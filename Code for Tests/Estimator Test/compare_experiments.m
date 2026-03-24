% ------------------------------
% compare_experiments.m
% Load and compare all saved experiments
% Run after completing all hardware tests
% ------------------------------

%% Load all experiment files
files = dir('exp_*.mat');
n_exp = length(files);

if n_exp == 0
    error('No experiment files found! Run post_process.m after each experiment.');
end

fprintf('Found %d experiments:\n', n_exp);
for i = 1:n_exp
    fprintf('  %d) %s\n', i, files(i).name);
end

%% Metrics table
names = {};
mse_alpha_all = [];
mse_beta_all  = [];
u_max_all     = [];
u_rms_all     = [];

t_start = 8; % skip calibration

figure('Name', 'Alpha Comparison');
hold on;
figure('Name', 'Beta Comparison');
hold on;
figure('Name', 'Control Comparison');
hold on;

colors = lines(n_exp);

for i = 1:n_exp
    data = load(files(i).name);
    exp_name = files(i).name(1:end-4);
    names{i} = exp_name;

    t_vec = data.y.Time;
    y_data = data.y.Data;
    u_data = data.u.Data;

    idx = t_vec >= t_start;

    mse_alpha_all(i) = mean(y_data(idx,1).^2);
    mse_beta_all(i)  = mean(y_data(idx,2).^2);
    u_max_all(i)     = max(abs(u_data(idx)));
    u_rms_all(i)     = sqrt(mean(u_data(idx).^2));

    % Plot alpha
    figure(1);
    plot(t_vec, y_data(:,1), 'Color', colors(i,:), 'LineWidth', 1.2);

    % Plot beta
    figure(2);
    plot(t_vec, y_data(:,2), 'Color', colors(i,:), 'LineWidth', 1.2);

    % Plot u
    figure(3);
    plot(t_vec, u_data, 'Color', colors(i,:), 'LineWidth', 1.2);
end

figure(1); legend(names, 'Interpreter', 'none'); grid on;
ylabel('\alpha (rad)'); xlabel('Time (s)');
title('Motor Shaft Angle Comparison');

figure(2); legend(names, 'Interpreter', 'none'); grid on;
ylabel('\beta (rad)'); xlabel('Time (s)');
title('Pendulum Angle Comparison');

figure(3); legend(names, 'Interpreter', 'none'); grid on;
ylabel('u (V)'); xlabel('Time (s)');
title('Control Signal Comparison');
yline(5, 'r--'); yline(-5, 'r--');

%% Print metrics table
fprintf('\n========== COMPARISON TABLE ==========\n');
fprintf('%-25s  MSE_alpha    MSE_beta   |u|_max   u_RMS\n', 'Experiment');
fprintf('--------------------------------------------------------------\n');
for i = 1:n_exp
    fprintf('%-25s  %.6f   %.6f   %.3f    %.3f\n', ...
        names{i}, mse_alpha_all(i), mse_beta_all(i), u_max_all(i), u_rms_all(i));
end
fprintf('==============================================================\n');

%% Bar chart comparison
figure('Name', 'Metrics Comparison');
subplot(2,2,1); bar(mse_alpha_all); set(gca, 'XTickLabel', names, 'XTickLabelRotation', 45);
ylabel('MSE \alpha'); title('Motor Shaft Error'); grid on;
subplot(2,2,2); bar(mse_beta_all); set(gca, 'XTickLabel', names, 'XTickLabelRotation', 45);
ylabel('MSE \beta'); title('Pendulum Error'); grid on;
subplot(2,2,3); bar(u_max_all); set(gca, 'XTickLabel', names, 'XTickLabelRotation', 45);
ylabel('|u|_{max} (V)'); title('Peak Control Effort'); grid on;
subplot(2,2,4); bar(u_rms_all); set(gca, 'XTickLabel', names, 'XTickLabelRotation', 45);
ylabel('u_{RMS} (V)'); title('RMS Control Effort'); grid on;