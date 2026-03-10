% build_hardware_swingup.m
% Builds IP_LQG_PCI6221_SwingUp.slx for the CMNO Quanser hardware.
% Uses add_block/add_line — no XML editing, works on any MATLAB version.
%
% REQUIRES: IP_MACRO.m run first, and the original IP_LQG_PCI6221_2015a.slx
% (needed to copy the Quanser subsystem block which has the NI-PCI6221 drivers)
%
% Run: IP_MACRO.m → build_hardware_swingup.m → open model → Run

src_mdl = 'IP_LQG_PCI6221_2015a';   % original with Quanser block
mdl     = 'IP_LQG_PCI6221_SwingUp';

% Close if already open
if bdIsLoaded(mdl), close_system(mdl, 0); end
if bdIsLoaded(src_mdl), close_system(src_mdl, 0); end

% Open source to copy Quanser block
open_system([src_mdl '.slx']);
new_system(mdl);
open_system(mdl);

%% ── Copy Quanser hardware subsystem from original model ──────────────────
add_block([src_mdl '/Quanser - Inverted Pendulum'], ...
    [mdl '/Quanser - Inverted Pendulum'], ...
    'Position', [430 155 560 205]);

% Copy Display (status indicator)
add_block([src_mdl '/Display'], [mdl '/Display'], ...
    'Position', [590 155 640 185]);

% Copy ToWorkspace blocks if they exist in source
try
    add_block([src_mdl '/To Workspace1'], [mdl '/Log_u'], ...
        'VariableName','u_hw', 'Position',[590 205 660 225]);
catch; end
try
    add_block([src_mdl '/To Workspace2'], [mdl '/Log_y'], ...
        'VariableName','y_hw', 'Position',[590 228 660 248]);
catch; end

close_system(src_mdl, 0);

%% ── OBSERVER ─────────────────────────────────────────────────────────────
add_block('simulink/Signal Routing/Mux', [mdl '/Mux_yu'], ...
    'Inputs','2', 'DisplayOption','bar', ...
    'Position',[220 168 225 202]);
add_block('simulink/Continuous/State-Space', [mdl '/Observer'], ...
    'A','A-L*C', 'B','[L, B]', 'C','eye(5)', 'D','zeros(5,3)', ...
    'X0','zeros(5,1)', ...
    'Position',[245 165 330 205]);

%% ── INTEGRAL on alpha_hat ────────────────────────────────────────────────
add_block('simulink/User-Defined Functions/Fcn', [mdl '/Fcn_alpha'], ...
    'Expr','u(1)', 'Position',[350 108 395 128]);
add_block('simulink/Continuous/Integrator', [mdl '/z_alpha'], ...
    'InitialCondition','0', 'Position',[415 108 455 128]);

%% ── AUGMENTED LQR ────────────────────────────────────────────────────────
add_block('simulink/Signal Routing/Mux', [mdl '/Mux_aug'], ...
    'Inputs','2', 'DisplayOption','bar', ...
    'Position',[355 168 360 212]);
add_block('simulink/Math Operations/Gain', [mdl '/Gain_LQR'], ...
    'Gain','-K_aug', 'Multiplication','Matrix(K*u)', ...
    'Position',[375 173 435 207]);

%% ── SWING-UP constants ───────────────────────────────────────────────────
add_block('simulink/Sources/Constant', [mdl '/Const_ksw'], ...
    'Value','k_swingup', 'SampleTime','inf', 'Position',[228 255 268 273]);
add_block('simulink/Sources/Constant', [mdl '/Const_hJ2'], ...
    'Value','0.5*J2_nl', 'SampleTime','inf', 'Position',[228 278 268 296]);
add_block('simulink/Sources/Constant', [mdl '/Const_mglp'], ...
    'Value','mp*g_acc*lp', 'SampleTime','inf', 'Position',[228 301 268 319]);

%% ── MUX for swing-up Fcn ─────────────────────────────────────────────────
add_block('simulink/Signal Routing/Mux', [mdl '/Mux_sw'], ...
    'Inputs','4', 'DisplayOption','bar', ...
    'Position',[278 215 283 325]);

%% ── SWING-UP Fcn ─────────────────────────────────────────────────────────
swExpr = ['u(6)*(u(7)*u(4)*u(4)+u(8)*(cos(u(3))-1.0))'...
          '*tanh(100.0*(u(4)*cos(u(3))))'];
add_block('simulink/User-Defined Functions/Fcn', [mdl '/Fcn_sw'], ...
    'Expr',swExpr, 'Position',[300 265 490 289]);

%% ── |beta_hat| for switch condition ──────────────────────────────────────
add_block('simulink/User-Defined Functions/Fcn', [mdl '/Fcn_absBeta'], ...
    'Expr','abs(u(3))', 'Position',[355 228 400 248]);

%% ── SWITCH and SATURATION ────────────────────────────────────────────────
add_block('simulink/Signal Routing/Switch', [mdl '/Switch_mode'], ...
    'Criteria','u2 >= Threshold', 'Threshold','ALPHA_SWITCH', ...
    'Position',[455 173 495 207]);
add_block('simulink/Discontinuities/Saturation', [mdl '/Sat'], ...
    'UpperLimit','V_MAX', 'LowerLimit','V_MIN', ...
    'Position',[505 173 540 207]);

%% ── WIRING ───────────────────────────────────────────────────────────────

% Quanser y → Mux_yu:1, Display
add_line(mdl, 'Quanser - Inverted Pendulum/1', 'Mux_yu/1');
add_line(mdl, 'Quanser - Inverted Pendulum/2', 'Display/1');

% Mux_yu → Observer
add_line(mdl, 'Mux_yu/1', 'Observer/1');

% Observer x_hat → Fcn_alpha, Mux_aug:1, Mux_sw:1, Fcn_absBeta
add_line(mdl, 'Observer/1', 'Fcn_alpha/1');
add_line(mdl, 'Observer/1', 'Mux_aug/1');
add_line(mdl, 'Observer/1', 'Mux_sw/1');
add_line(mdl, 'Observer/1', 'Fcn_absBeta/1');

% Fcn_alpha → z_alpha → Mux_aug:2
add_line(mdl, 'Fcn_alpha/1', 'z_alpha/1');
add_line(mdl, 'z_alpha/1',   'Mux_aug/2');

% Mux_aug → Gain_LQR → Switch:1
add_line(mdl, 'Mux_aug/1',  'Gain_LQR/1');
add_line(mdl, 'Gain_LQR/1', 'Switch_mode/1');

% Swing-up constants → Mux_sw
add_line(mdl, 'Const_ksw/1',  'Mux_sw/2');
add_line(mdl, 'Const_hJ2/1',  'Mux_sw/3');
add_line(mdl, 'Const_mglp/1', 'Mux_sw/4');

% Mux_sw → Fcn_sw → Switch:3
add_line(mdl, 'Mux_sw/1', 'Fcn_sw/1');
add_line(mdl, 'Fcn_sw/1', 'Switch_mode/3');

% Fcn_absBeta → Switch:2
add_line(mdl, 'Fcn_absBeta/1', 'Switch_mode/2');

% Switch → Saturation → Quanser input, Mux_yu:2
add_line(mdl, 'Switch_mode/1', 'Sat/1');
add_line(mdl, 'Sat/1', 'Quanser - Inverted Pendulum/1');
add_line(mdl, 'Sat/1', 'Mux_yu/2');

% Optional logging
try
    add_line(mdl, 'Sat/1', 'Log_u/1');
    add_line(mdl, 'Quanser - Inverted Pendulum/1', 'Log_y/1');
catch; end

%% ── Save ─────────────────────────────────────────────────────────────────
save_system(mdl, [mdl '.slx']);
fprintf('\nModel saved: %s.slx\n', mdl);
fprintf('\n=== HARDWARE PROCEDURE ===\n');
fprintf('1. run(''IP_MACRO.m'')\n');
fprintf('2. Pendulum hanging DOWN (beta ~ 180 deg)\n');
fprintf('3. Click Run in Simulink\n');
fprintf('4. Wait for Display to show 1 (calibration done)\n');
fprintf('5. Swing-up starts automatically\n');
fprintf('6. When |beta| < 30 deg -> switches to LQR+integral\n');
fprintf('\nTuning: k_swingup (default 10) - increase if too weak\n');
