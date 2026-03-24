% ------------------------------
% CMNO 2024/2025 - Modified IP_MACRO
% Augmented system with integral action on alpha
% Observer on original 5-state system (observability preserved)
% ------------------------------

% Load original state model
load('IP_MODEL.mat')

% Save original matrices (5-state system)
A_orig = A;
B_orig = B;
C_orig = C;
D_orig = D;

% =============================================
% AUGMENTED SYSTEM: add integrator of alpha
% State vector: [alpha; alpha_dot; beta; beta_dot; i; int_alpha]
% =============================================
A = [A_orig, zeros(5,1);
     1 0 0 0 0 0];

B = [B_orig;
     0];

C = [C_orig, zeros(2,1)];

D = zeros(2,1);

% =============================================
% CONSTRAINTS
% =============================================
V_MAX  = 5;
V_MIN  = -5;
ALPHA_MAX = 90 * pi/180;
BETA_MAX  = 15 * pi/180;
TIME_DELAY = 6;
T  = 30;
Ts = 0.001;

% =============================================
% REGULATOR (LQR) - 6 states
% Qr = diag([alpha, alpha_dot, beta, beta_dot, i, int_alpha])
% =============================================
Qr = diag([10, 0, 1, 0, 0, 50]);
Rr = 0.1;
K = lqr(A, B, Qr, Rr);

% =============================================
% ESTIMATOR (LQE) - on ORIGINAL 5-state system
% =============================================
% Process noise covariance (5x5) - how much we DISTRUST the model
% Larger value => estimator relies MORE on measurements for that state
%   Qe(1,1): alpha      - motor shaft angle dynamics
%   Qe(2,2): alpha_dot  - motor shaft velocity dynamics
%   Qe(3,3): beta       - pendulum angle dynamics
%   Qe(4,4): beta_dot   - pendulum velocity dynamics
%   Qe(5,5): i          - motor current dynamics
% --- CHANGE THESE ---
Qe = diag([10, ...   % alpha
            10, ...   % alpha_dot
            10, ...   % beta
            10, ...   % beta_dot
            10]);     % i
% ---------------------

% Measurement noise covariance (2x2) - how much we DISTRUST the sensors
% Larger value => estimator relies MORE on model for that measurement
%   Re(1,1): alpha measurement  - potentiometer (typically noisier)
%   Re(2,2): beta measurement   - optical encoder (typically cleaner)
% --- CHANGE THESE ---
Re = diag([1, ...     % alpha sensor (potentiometer)
           1]);       % beta sensor  (optical encoder)
% ---------------------

G5 = eye(5);
L5 = lqe(A_orig, G5, C_orig, Qe, Re);

% Augmented L: last row integrates measured alpha
L = [L5;
     1 0];

% =============================================
% DISPLAY
% =============================================
fprintf('\n=== DESIGN PARAMETERS ===\n');
fprintf('Qe = diag(%.1f, %.1f, %.1f, %.1f, %.1f)\n', diag(Qe));
fprintf('Re = diag(%.2f, %.2f)\n', diag(Re));
fprintf('Qr = diag(%.1f, %.1f, %.1f, %.1f, %.1f, %.1f)\n', diag(Qr));
fprintf('Rr = %.2f\n\n', Rr);

disp('K (1x6):'); disp(K)
disp('L (6x2):'); disp(L)
disp('Closed-loop poles (A-BK):'); disp(eig(A - B*K))
disp('Controller poles (A-BK-LC):'); disp(eig(A - B*K - L*C))