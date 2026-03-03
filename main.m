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

%% Q4 - Bode Plot of the open-loop system

w = logspace(-1, 3, 1000);
sys = ss(A, B, C, D);
G = ss2tf(A, B, C, D); % Why am I computing this?
 
% Matrix C has 2 rows, so we have 2 measurements
bode(sys(1, 1), sys(2, 1), w) % Both measurements on the same plot
legend('y_1','y_2')
grid on

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
D = [0 0 0 0 0]';
t = 2;
I_5 = eye(5);

out = sim("Q6_Model_2015a.slx", t);

gg = plot(out.x.Time, out.x.Data);
legend({'$\alpha$ (rad)', ...
        '$\dot{\alpha}$ (rad/s)', ...
        '$\beta$ (rad)', ...
        '$\dot{\beta}$ (rad/s)', ...
        '$i$ (A)'}, ...
        'Interpreter','latex', ...
        'Location','best')
grid on


%% Q7 - Gain Estimator 
% The Kalman filter is a widely used observer to tackle the estimation 
% problem for linear dynamic systems. When both the process and 
% measurement associated with the estimated state are corrupted by random, 
% independent, zero mean Gaussian white noise, the solution provided by the
%  Kalman filter is statistically optimal with respect to any quadratic 
% function of the estimation error. For this reason, it is also referred to
%  as Linear Quadratic Estimator (LQE), and represents the dual of the LQR 
% to the estimation problem.

% In continuous time, the random process and observation are given by:
% x' = Ax + Bu + Gw ; y = Cx + v
% where all terms are time dependant, w is the process noise associated
% with the model, v is the measurement noise associated with the sensors,
% and G is the process noise coupling matrix. The random noises are
% represented by the covariance matrices Q and R for the process and
% measurement noise, respectively. The Q and R matrices are positive 
% semi-definite. 
% he Kalman filter is capable of providing an optimal state estimation 
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

% G is the process noise coupling matrix

%% Q8 - Simulink

t = 4;

% Matrices for the pendulum state-space
x0 = [0.1 0 0 0 0]';
D = [0 0]';

out = sim("Q8_Model_2015a.slx", t);

% Plot measured outputs y (2 signals)
figure;
plot(out.y.Time, out.y.Data(:,1), out.y.Time, out.y.Data(:,2));
grid on;
legend({'y_1','y_2'}, 'Location','best');

% Plot control input u (1 signal)
figure;
plot(out.u.Time, out.u.Data);
grid on;
legend({'u'}, 'Location','best');
