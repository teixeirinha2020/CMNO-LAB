% Load state model
clear
close all
load('IP_MODEL.mat')

% Constraints
V_MAX = 5; % Maximum motor voltage
V_MIN = -5; % Minimum motor voltage

ALPHA_MAX = 90 * pi/180; % Maximum angle accepted for motor shaft
BETA_MAX = 15 * pi/180; % Maximum angle before falling
TIME_DELAY = 6; % seconds before start

T = 30; % Time duration of the simulation
Ts = 0.001; % Sampling time

% Augmented matrices to include integrator
A_aug = [A zeros(5,1);
        C(1,:) 0];

B_aug = [B; 0];

C_aug = [C zeros(2,1)];

% Regulator parameters
Qr = diag([10,0,1,0,0,1]); %Weight Matrix for x
Rr = 0.1; %Weight for the input variable
K = lqr(A_aug, B_aug, Qr, Rr); %Calculate feedback gain
disp(K)

% Estimator parameters
G = eye(size(A)); %
Qe = eye(size(A))*10;
Re = eye(2);
%Qe = diag([deg2rad(5)^2 0 deg2rad(5)^2 0 0]); %Variance of process errors
%Re = eye(2)*(deg2rad(1)^2); %Variance of measurement errors
L = lqe(A, G, C, Qe, Re); %Calculate estimator gains

L_aug = [L;
        1 0];

% Simulation & Plots
deg2rad = pi/180;
alpha_init = deg2rad * 5;
beta_init = deg2rad * 0;

x0 = [alpha_init 0 beta_init 0 0];

tau = 0.01; % Motor lag
dead_zone_half_width = 0.2; % Dead zone half-width

quant = 2 * pi / 4096; % quantizer interval in output
noise_power = quant^2 / 12; % White noise power
noise_sample_time = 0.01; % s

out = sim("SIM.slx");

figure
tiledlayout(2,1)
nexttile
hold on
plot(out.y.time, out.y.signals.values)
grid on
title('\alpha e \beta')
legend('\alpha', '\beta')
xlabel('Time [s]')
ylabel('Angle [deg]')

nexttile
plot(out.u.time, out.u.signals.values)
title('Voltage')
legend('u')
xlabel('Time [s]')
ylabel('Voltage [V]')
grid on