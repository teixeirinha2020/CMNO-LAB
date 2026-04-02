% ------------------------------
% CMNO 2025/2026 - Group 35
% 
% Authors:
% Lucas Moreira, 109657
% Tomas Teixeira, 109766
% Pedro Machado, 110718
% ------------------------------

% Preamble 
clear; clc; close all;

% Run IP_MACRO script
run("IP_MACRO.m")

%% Q1 - Eigenvalues of matrix A
eigenvalues_A = eig(A);
disp(eigenvalues_A);

% We have 5 eigenvalues. Three of them are negative, one is positive, and
% one is zero. Because of the positive eigenvalue, the equilibrium is unstable.


%% Q2 - Controllability Matrix

Cont_Matrix = ctrb(A, B);
r_c = rank(Cont_Matrix);
disp(r_c);

% The rank of the controllability matrix is equal to 5, which matches the
% the dimension of the state vector x. Therefore, the system is
% completely controllable. This means that, given the appropriate input, we
% can drive the system to any final state in a finite time interval.

%% Q3 - Observability Matrix 

Observ_Matrix = obsv(A, C);
r_o = rank(Observ_Matrix);
disp(r_o);

% The rank of the observability matrix is equal to 5, which matches the
% dimension of the state vector x. Therefore, the system is
% observable. This means that we can reconstruct the initial state, x_0, from a
% finite sequence of measurements.

%% Q4 - Bode Plots of the open-loop system

[num, den] = ss2tf(A, B, C, D);

w = logspace(-1, 3, 1000);
sys = ss(A, B, C, D);

% --- Figure 1: Alpha Output ---
figure(1);
margin(sys(1,1), w);
grid on;
title('Bode Diagram - $\alpha$', 'Interpreter', 'latex');
exportgraphics(gcf, 'bode_plot_alpha.pdf', 'ContentType', 'vector');

% --- Figure 2: Beta Output ---
figure(2);
margin(sys(2,1), w);
grid on;
title('Bode Diagram - $\beta$', 'Interpreter', 'latex');
exportgraphics(gcf, 'bode_plot_beta.pdf', 'ContentType', 'vector');
figure;
pzmap(sys(1,1));
grid on;
title('Pole-Zero Map - $\alpha$', 'Interpreter', 'latex');

%% Q5 - Regulator gain

%lqr computes the optimal gain matrix K, the solution S of the Riccati
%equation, and the closed-loop poles P for sys

[K, S, P] = lqr(sys, Qr, Rr);  
disp('Matrix K')
disp(K)
disp('Matrix S')
disp(S)
disp('Closed-loop Poles')
disp(P)

% K is the solution to the optimization problem of the LQR for the infinite-horizon
% or steady state problem (T = infinite) which guarantees closed-loop asymptotic
% stability. Constant Gain Matrix is given by: K = (R^-1)(B^T)S ;  where S is 
% the solution to the Algebric Riccati Equation (ARE) formulated for the LQR version: 
% SA + (A^T)S - SB(R^-1)(B^T)S + Q = 0 where Q is a positive semi-definite matrix and R is a positive
% definite matrix. 
% In order for the ARE (9) to have a unique, positive definite solution S, 
% it is a sufficient condition that the system defined by
% the pair (A, B) is controllable.

%% Q6 - Simulink 

x0 = [0.1 0 0 0 0]';
D = zeros(5,1);

T = 2;
out = sim("Q6_SIM", T);

figure
plot(out.x.Time, out.x.Data);
title('State feedback test')
xlabel('Time [s]')
legend({'$\alpha$ [rad]', ...
        '$\dot{\alpha}$ [rad/s]', ...
        '$\beta$ (rad)', ...
        '$\dot{\beta}$ [rad/s]', ...
        '$i$ [A]'}, ...
        'Interpreter','latex', ...
        'Location','best')
grid on
exportgraphics(gcf, 'Q6_states.pdf', 'ContentType', 'vector');


%% Q7 - Gain Estimator 
% The Kalman filter is a widely used observer to tackle the estimation 
% problem for linear dynamic systems. When both the process and 
% measurement associated with the estimated state are corrupted by random, 
% independent, zero mean Gaussian white noise, the solution provided by the
% Kalman filter is statistically optimal with respect to any quadratic 
% function of the estimation error. For this reason, it is also referred to
% as Linear Quadratic Estimator (LQE), and represents the dual of the LQR 
% to the estimation problem.

% In continuous time, the random process and observation are given by:
% x' = Ax + Bu + Gw ; y = Cx + v
% where all terms are time dependant, w is the process noise associated
% with the model, v is the measurement noise associated with the sensors,
% and G is the process noise coupling matrix. The random noises are
% represented by the covariance matrices Q and R for the process and
% measurement noise, respectively. The Q and R matrices are positive 
% semi-definite. 
% The Kalman filter is capable of providing an optimal state estimation 
% according to the differential equation:
% xˆ' = A xˆ + B u + L (y − C xˆ) , where L is the Kalman Gain given by:
% L = P(C^T)(R^-1); where P is the solution to the Riccati Differential
% Equation: P' = AP + P(A^T) + GQ(G^T) - P(C^T)(R^-1)CP.
% For the steady state case, P' = 0, so this equation simplifies to the
% ARE. For the ARE to have a unique positive definite solution P, it is
% a sufficient condition that the pair (A, C) is observable. The tuning 
% parameters will be the Q and R noise covariance matrices.

G = eye(size(A));
Qe = eye(size(A))*10;
Re = eye(2);

L = lqe(A, G, C, Qe, Re);
disp('Matrix L:')
disp(L)

% G is the process noise coupling matrix...

%% Q8 - Simulink
% Matrices for the pendulum state-space
x0 = [0.1 0 0 0 0]';
D = zeros(2,1);

T = 5;
out = sim("Q8_SIM.slx", T);

% Plot measured outputs y (2 signals)
figure
plot(out.y.Time, out.y.Data(:,1), out.y.Time, out.y.Data(:,2))
title('Controlled system output')
xlabel('Time [s]')
ylabel('Angle [rad]')
legend({'\alpha [rad]','\beta [rad]'}, 'Location','best')
grid on
exportgraphics(gcf, 'Q8_angles.pdf', 'ContentType', 'vector');

% Plot control input u (1 signal)
figure;
plot(out.u.Time, out.u.Data)
title('Controlled system input')
xlabel('Time [s]')
ylabel('Voltage [V]')
legend({'u'}, 'Location','best')
grid on
exportgraphics(gcf, 'Q8_voltage.pdf', 'ContentType', 'vector');


%% Q11
% Q11.1 - Alpha Integrator
% Initial conditions
alpha_init = deg2rad(2);
x0 = [alpha_init 0 0 0 0]';
D = zeros(2,1);

% Augmented matrices to include integrator
A_aug = [A zeros(5,1);
        C(1,:) 0];

B_aug = [B; 0];

C_aug = [C zeros(2,1)];

% Regulator parameters
Qr = diag([100,0,10,0,0,15]); %Weight Matrix for x
Rr = 0.01; %Weight for the input variable
K_aug = lqr(A_aug, B_aug, Qr, Rr); %Calculate feedback gain

% Estimator parameters
G = eye(size(A)); %
Qe = eye(size(A))*10; %Variance of process errors
Re = eye(2)*(deg2rad(0.01)^2); %Variance of measurement errors
L = lqe(A, G, C, Qe, Re); %Calculate estimator gains

L_aug = [L;
        1 0];

T = 20;
out = sim("Q11_1_SIM.slx", T);

% Plot measured outputs y (2 signals)
figure
tiledlayout(2,1)
nexttile
plot(out.y.Time, out.y.Data(:,1), out.y.Time, out.y.Data(:,2))
title('Controlled system output (w/ \alpha integrator)')
xlabel('Time [s]')
ylabel('Angle [deg]')
legend({'\alpha','\beta'}, 'Location','best')
grid on

% Plot control input u (1 signal)
nexttile
plot(out.u.Time, out.u.Data)
title('Controlled system input - With \alpha integrator)')
xlabel('Time [s]')
ylabel('Voltage [V]')
legend({'u'}, 'Location','best')
grid on
exportgraphics(gcf, 'Q11_alpha_integrator.pdf', 'ContentType', 'vector');

% Q11.2 - Dead Zone Compensator
dead_zone_half_width = 0.2; % Dead zone half-width

T = 10;
out = sim("Q11_2_SIM.slx", T);

% Plot measured outputs y (2 signals)
figure
tiledlayout(2,1)
nexttile
plot(out.y.Time, out.y.Data(:,1), out.y.Time, out.y.Data(:,2))
title('Controlled system output - With \alpha integrator & dead zone compensator')
xlabel('Time [s]')
ylabel('Angle [deg]')
legend({'\alpha','\beta'}, 'Location','best')
grid on

% Plot control input u (1 signal)
nexttile
plot(out.u.Time, out.u.Data)
title('Controlled system input - With \alpha integrator & dead zone compensator')
xlabel('Time [s]')
ylabel('Voltage [V]')
legend({'u'}, 'Location','best')
grid on
exportgraphics(gcf, 'Q11_alpha_integrator_deadzone.pdf', 'ContentType', 'vector');



%% Final Simulations
% Final 1 - No deadzone compensator
% Initial conditions
alpha_init = deg2rad(2);
beta_init = deg2rad(0.5);

x0 = [alpha_init 0 beta_init 0 0]';
D = zeros(2,1);

% Motor characteristics
tau = 0.01; % Motor lag
dead_zone_half_width = 0.2; % Dead zone half-width

% Sensors characteristics
quant = 2 * pi / 4096; % quantizer interval in output
noise_power = quant^2 / 12; % White noise power
noise_sample_time = 0.01; % s

% Augmented matrices to include integrator
A_aug = [A zeros(5,1);
        C(1,:) 0];

B_aug = [B; 0];

C_aug = [C zeros(2,1)];

% Regulator parameters
Qr = diag([100,0,10,0,0,15]); %Weight Matrix for x
Rr = 0.01; %Weight for the input variable
K_aug = lqr(A_aug, B_aug, Qr, Rr); %Calculate feedback gain

% Estimator parameters
G = eye(size(A)); %
Qe = eye(size(A))*10-2; %Variance of process errors
Re = eye(2)*(deg2rad(0.01)^2); %Variance of measurement errors
L = lqe(A, G, C, Qe, Re); %Calculate estimator gains

L_aug = [L;
        1 0];

T = 10;
out = sim("Final_no_comp_SIM.slx", T);

% Plot measured outputs y (2 signals)
figure
tiledlayout(2,1)
nexttile
plot(out.y.Time, out.y.Data(:,1), out.y.Time, out.y.Data(:,2))
title('Final controlled system output - No dead zone compensator')
xlabel('Time [s]')
ylabel('Angle [deg]')
legend({'\alpha','\beta'}, 'Location','best')
grid on

% Plot control input u (1 signal)
nexttile
plot(out.u.Time, out.u.Data)
title('Controlled system input - No dead zone compensator')
xlabel('Time [s]')
ylabel('Voltage [V]')
legend({'u'}, 'Location','best')
grid on
exportgraphics(gcf, 'final_no_deadzone.pdf', 'ContentType', 'vector');

%Final 2 - With dead zone compensator
T = 10;
out = sim("Final_SIM.slx", T);

% Plot measured outputs y (2 signals)
figure
tiledlayout(2,1)
nexttile
plot(out.y.Time, out.y.Data(:,1), out.y.Time, out.y.Data(:,2))
title('Controlled system output - With dead zone compensator')
xlabel('Time [s]')
ylabel('Angle [deg]')
legend({'\alpha','\beta'}, 'Location','best')
grid on

% Plot control input u (1 signal)
nexttile
plot(out.u.Time, out.u.Data)
title('Controlled system input - With dead zone compensator')
xlabel('Time [s]')
ylabel('Voltage [V]')
legend({'u'}, 'Location','best')
grid on
exportgraphics(gcf, 'final_deadzone.pdf', 'ContentType', 'vector');


% Final 3 - Sensors + compensator

T = 10;
out = sim("Final_sensors_SIM.slx", T);

% Plot measured outputs y (2 signals)
figure
tiledlayout(2,1)
nexttile
plot(out.y.Time, out.y.Data(:,1), out.y.Time, out.y.Data(:,2))
title('Final controlled system output - With sensors model')
xlabel('Time [s]')
ylabel('Angle [deg]')
legend({'\alpha','\beta'}, 'Location','best')
grid on

% Plot control input u (1 signal)
nexttile
plot(out.u.Time, out.u.Data)
title('Controlled system input - With sensors model')
xlabel('Time [s]')
ylabel('Voltage [V]')
legend({'u'}, 'Location','best')
grid on
exportgraphics(gcf, 'final_sensors.pdf', 'ContentType', 'vector');
