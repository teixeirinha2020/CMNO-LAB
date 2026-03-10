% IP_MACRO.m — CMNO 2024/2025
% Run this BEFORE any simulation or hardware run.

load('IP_MODEL.mat')   % loads A, B, C, D

%% ── Constraints ──────────────────────────────────────────────────────────
V_MAX      =  5;
V_MIN      = -5;
ALPHA_MAX  = 90  * pi/180;
BETA_MAX   = 15  * pi/180;
TIME_DELAY = 6;
T          = 20;
Ts         = 0.001;

%% ── LQR + integral (augmented, Q9) ──────────────────────────────────────
A_aug = [A,             zeros(5,1);
         1, 0, 0, 0, 0, 0          ];
B_aug = [B; 0];
Qr_aug = diag([150, 1, 2, 0, 0, 300]);
Rr_aug = 0.1;
K_aug  = lqr(A_aug, B_aug, Qr_aug, Rr_aug);

%% ── Kalman observer ──────────────────────────────────────────────────────
G  = eye(size(A));
Qe = eye(size(A)) * 10;
Re = eye(2);
L  = lqe(A, G, C, Qe, Re);

%% ── Nonlinear plant parameters (derived from IP_MODEL A,B matrices) ──────
% These match the actual CMNO Quanser — NOT Balula's different apparatus.
g_acc = 9.81;
mp    = 0.127;          % kg      pendulum mass
lp    = 0.1685;         % m       pendulum pivot-to-CoM

Le1   = 0.2273;         % m       arm length
J0_nl = 0.014939;       % kg.m²   arm total inertia at base
J2_nl = 0.004873;       % kg.m²   pendulum total inertia at pivot
Ka1   = 1.755e-4;       % N.m.s   arm viscous friction
Ka2   = 2.339e-5;       % N.m.s   pendulum viscous friction
Kf_nl = 0.5801;         % N.m/A   motor torque constant (after gearbox)
Lb    = 0.003;          % H       motor inductance
Rm    = 2.2663;         % Ohm     motor resistance
Kt    = 0.6961;         % V.s     back-EMF constant

%% ── Swing-up (energy-based, Balula eq 3.1) ──────────────────────────────
% E - E_ref = 0.5*J2*betadot^2 + mp*g*lp*(cos(beta)-1)
% At bottom: E-E_ref = -0.42 J   (need to inject 0.42 J to reach upright)
% u = k_sw*(E-E_ref)*tanh(100*betadot*cos(beta))
k_swingup    = 10;           % [V/J]  tune: increase if too slow
ALPHA_SWITCH = 30*pi/180;    % [rad]  switch to LQR when |beta_hat| < 30 deg

%% ── Initial state for nonlinear simulation ───────────────────────────────
x0_nonlin = [0; 0; pi - 0.05; 0; 0];
%             a    adot  beta      bdot  i
D = [0; 0];
