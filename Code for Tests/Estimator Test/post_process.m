% ------------------------------
% post_process.m
% Run AFTER each hardware experiment to save & analyze results
% Assumes workspace contains: y (timeseries), u (timeseries)
% and the current K, L, A, B, C from IP_MACRO
% ------------------------------

%% 1) Save current experiment data
% Change exp_name before each run!
exp_name = 'exp_Qe10_Re1';  % <-- CHANGE THIS FOR EACH CONFIG
save(fullfile(pwd, [exp_name '.mat']), 'y', 'u', 'K', 'L', 'A', 'B', 'C', 'Qr', 'Rr', 'Qe', 'Re');
fprintf('Saved experiment: %s\n', exp_name);

%% 2) Reconstruct estimated states (offline observer simulation)
% The LQG controller block implements:
%   x_hat_dot = (A - B*K - L*C) * x_hat + L * y
%   u = -K * x_hat
% We can reconstruct x_hat from the saved y data.

t_vec = y.Time;
y_data = y.Data;       % Nx2: [alpha_meas, beta_meas]
u_data = u.Data;       % Nx1: control voltage

dt = mean(diff(t_vec));
n_states = size(A, 1); % 6 for augmented system
N = length(t_vec);

% Observer dynamics matrix
A_obs = A - B*K - L*C;

% Simulate observer (Euler integration - matches real-time behavior)
x_hat = zeros(N, n_states);
for k = 1:N-1
    x_hat_dot = A_obs * x_hat(k,:)' + L * y_data(k,:)';
    x_hat(k+1,:) = x_hat(k,:) + dt * x_hat_dot';
end

% Estimated measurements: y_hat = C * x_hat
y_hat = (C * x_hat')';  % Nx2

%% 3) Plot: Measured vs Estimated
figure('Name', ['Measured vs Estimated - ' exp_name]);

subplot(2,1,1);
plot(t_vec, y_data(:,1), 'b', t_vec, y_hat(:,1), 'r--', 'LineWidth', 1.2);
ylabel('\alpha (rad)'); grid on;
legend('Measured', 'Estimated');
title([exp_name ' - Motor shaft angle'], 'Interpreter', 'none');

subplot(2,1,2);
plot(t_vec, y_data(:,2), 'b', t_vec, y_hat(:,2), 'r--', 'LineWidth', 1.2);
ylabel('\beta (rad)'); xlabel('Time (s)'); grid on;
legend('Measured', 'Estimated');
title('Pendulum angle');

%% 4) Plot: All estimated states
state_names = {'\alpha', '\dot{\alpha}', '\beta', '\dot{\beta}', 'i', '\int\alpha'};
figure('Name', ['Estimated States - ' exp_name]);
for j = 1:n_states
    subplot(3,2,j);
    plot(t_vec, x_hat(:,j), 'LineWidth', 1.2);
    ylabel(state_names{j}); grid on;
    if j >= 5, xlabel('Time (s)'); end
end
sgtitle(['Estimated States - ' exp_name], 'Interpreter', 'none');

%% 5) Plot: Control signal
figure('Name', ['Control - ' exp_name]);
plot(t_vec, u_data, 'LineWidth', 1.2);
ylabel('u (V)'); xlabel('Time (s)'); grid on;
title(['Control Signal - ' exp_name], 'Interpreter', 'none');
yline(5, 'r--'); yline(-5, 'r--');

%% 6) Performance metrics
% Trim initial transient (first TIME_DELAY + 2 seconds)
t_start = 8;  % skip calibration + initial transient
idx = t_vec >= t_start;

alpha_meas = y_data(idx, 1);
beta_meas  = y_data(idx, 2);
u_trim     = u_data(idx);

% MSE of alpha (should go to 0 with integrator)
mse_alpha = mean(alpha_meas.^2);
% MSE of beta (pendulum deviation)
mse_beta  = mean(beta_meas.^2);
% Max absolute control effort
u_max = max(abs(u_trim));
% RMS control effort
u_rms = sqrt(mean(u_trim.^2));
% Estimation error (measured vs estimated)
est_err_alpha = sqrt(mean((y_data(idx,1) - y_hat(idx,1)).^2));
est_err_beta  = sqrt(mean((y_data(idx,2) - y_hat(idx,2)).^2));

fprintf('\n=== Performance Metrics: %s ===\n', exp_name);
fprintf('MSE alpha:          %.6f rad^2\n', mse_alpha);
fprintf('MSE beta:           %.6f rad^2\n', mse_beta);
fprintf('Max |u|:            %.3f V\n', u_max);
fprintf('RMS u:              %.3f V\n', u_rms);
fprintf('Est. error alpha:   %.6f rad (RMS)\n', est_err_alpha);
fprintf('Est. error beta:    %.6f rad (RMS)\n', est_err_beta);
fprintf('================================\n\n');