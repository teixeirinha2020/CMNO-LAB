% ------------------------------
% CMNO 2024/2025 - Alberto Vale
% ------------------------------

clear; clc;
% Load state model
load('IP_MODEL.mat')

% Constraints
V_MAX = 5; % Maximum motor voltage
V_MIN = -5; % Minimum motor voltage

ALPHA_MAX = 90 * pi/180; % Maximum angle accepted for motor shaft
BETA_MAX = 15 * pi/180; % Maximum angle before falling
TIME_DELAY = 6; % seconds before start

T = 30; % Time duration of the simulation
Ts = 0.001; % Sampling time

A_aug = [A zeros(5,1);
        C(1,:) 0];

B_aug = [B; 0];

C_aug = [C zeros(2,1)];

% Regulator parameters
Qr = diag([100,0,1,0,0,15]); %Weight Matrix for x
Rr = 0.01; %Weight for the input variable
K = lqr(A_aug, B_aug, Qr, Rr); %Calculate feedback gain
disp(K)

% Estimator parameters
G = eye(size(A)); %
Qe = eye(size(A))*10;
%Qe = diag([deg2rad(10)^2 deg2rad(5)^2 deg2rad(10)^2 deg2rad(5)^2 10]); %Variance of process errors
Re = eye(2)*(deg2rad(0.1)^2); %Variance of measurement errors
L = lqe(A, G, C, Qe, Re); %Calculate estimator gains

L_aug = [L;
        1 0];
