clear 
close all

rad2deg = 180/pi;

data = load("qe1.mat");
data1 = load("qe10.mat");
data2 = load("qe0_1.mat");

% Plots
figure
tiledlayout(3,1)
nexttile
hold on
plot(data.t.time, data.y.signals.values(:,1)*rad2deg)
plot(data.t.time, data.y_estim.signals.values(:,1)*rad2deg)
title("Qe = eye(5), Re = eye(2) * deg2rad(0.01)^2")
ylabel("Angle [deg]")
xlim([15, 20])
legend("\alpha", "\alpha estimated")
grid on

nexttile
hold on
plot(data.t.time, data.y.signals.values(:,2)*rad2deg)
plot(data.t.time, data.y_estim.signals.values(:,3)*rad2deg)
ylabel("Angle [deg]")
xlim([15, 20])
legend("\beta", "\beta estimated")
grid on

nexttile
plot(data.t.time, data.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([15, 20])
grid on
exportgraphics(gcf, 'qe1.pdf', 'ContentType', 'vector');

figure
hold on
plot(data.t.time, data.y_estim.signals.values(:,1), 'LineWidth', 0.75)
plot(data.t.time, data.y_estim.signals.values(:,2), 'LineWidth', 0.75)
plot(data.t.time, data.y_estim.signals.values(:,3), 'LineWidth', 0.75)
plot(data.t.time, data.y_estim.signals.values(:,4), 'LineWidth', 0.75)
plot(data.t.time, data.y_estim.signals.values(:,5), 'LineWidth', 0.75)
title("Qe = eye(5), Re = eye(2) * deg2rad(0.01)^2 (Estimated)")
legend({'$\alpha$ [rad]', ...
        '$\dot{\alpha}$ [rad/s]', ...
        '$\beta$ [rad]', ...
        '$\dot{\beta}$ [rad/s]', ...
        '$i$ [A]'}, ...
        'Interpreter','latex', ...
        'Location','best')
xlim([15, 20])
grid on
exportgraphics(gcf, 'qe1_estimated.pdf', 'ContentType', 'vector');


figure
tiledlayout(3,1)
nexttile
hold on
plot(data1.t.time, data1.y.signals.values(:,1)*rad2deg)
plot(data1.t.time, data1.y_estim.signals.values(:,1)*rad2deg)
title("Qe = eye(5) * 10, Re = eye(2) * deg2rad(0.01)^2")
ylabel("Angle [deg]")
xlim([15, 20])
legend("\alpha", "\alpha estimated")
grid on

nexttile
hold on
plot(data1.t.time, data1.y.signals.values(:,2) * rad2deg)
plot(data1.t.time, data1.y_estim.signals.values(:,3) * rad2deg)
ylabel("Angle [deg]")
xlim([15, 20])
legend("\beta", "\beta estimated")
grid on

nexttile
plot(data1.t.time, data1.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([15, 20])
grid on
exportgraphics(gcf, 'qe10.pdf', 'ContentType', 'vector');

figure
hold on
plot(data1.t.time, data1.y_estim.signals.values(:,1),'LineWidth', 0.75)
plot(data1.t.time, data1.y_estim.signals.values(:,2),'LineWidth', 0.75)
plot(data1.t.time, data1.y_estim.signals.values(:,3),'LineWidth', 0.75)
plot(data1.t.time, data1.y_estim.signals.values(:,4),'LineWidth', 0.75)
plot(data1.t.time, data1.y_estim.signals.values(:,5),'LineWidth', 0.75)
title("Qe = eye(5)*10, Re = eye(2) * deg2rad(0.01)^2 (Estimated)")
legend({'$\alpha$ [rad]', ...
        '$\dot{\alpha}$ [rad/s]', ...
        '$\beta$ [rad]', ...
        '$\dot{\beta}$ [rad/s]', ...
        '$i$ [A]'}, ...
        'Interpreter','latex', ...
        'Location','best')
xlim([15, 20])
grid on
exportgraphics(gcf, 'qe10_estimated.pdf', 'ContentType', 'vector');


% Plots
figure
tiledlayout(3,1)
nexttile
hold on
plot(data2.t.time, data2.y.signals.values(:,1)*rad2deg)
plot(data2.t.time, data2.y_estim.signals.values(:,1)*rad2deg)
title("Qe = eye(5) * 0.1, Re = eye(2) * deg2rad(0.01)^2")
ylabel("Angle [deg]")
legend("\alpha", "\alpha estimated")
xlim([15, 20])
grid on

nexttile
hold on
plot(data2.t.time, data2.y.signals.values(:,2)*rad2deg)
plot(data2.t.time, data2.y_estim.signals.values(:,3)*rad2deg)
ylabel("Angle [deg]")
legend("\beta", "\beta estimated")
xlim([15, 20])
grid on


nexttile
plot(data2.t.time, data2.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([15, 20])
grid on
exportgraphics(gcf, 'qe0_1.pdf', 'ContentType', 'vector');


figure
hold on
plot(data2.t.time, data2.y_estim.signals.values(:,1),'LineWidth', 0.75)
plot(data2.t.time, data2.y_estim.signals.values(:,2),'LineWidth', 0.75)
plot(data2.t.time, data2.y_estim.signals.values(:,3),'LineWidth', 0.75)
plot(data2.t.time, data2.y_estim.signals.values(:,4),'LineWidth', 0.75)
plot(data2.t.time, data2.y_estim.signals.values(:,5),'LineWidth', 0.75)
title("Qe = eye(5) * 0.1, Re = eye(2) * deg2rad(0.01)^2 (Estimated)")
legend({'$\alpha$ [rad]', ...
        '$\dot{\alpha}$ [rad/s]', ...
        '$\beta$ [rad]', ...
        '$\dot{\beta}$ [rad/s]', ...
        '$i$ [A]'}, ...
        'Interpreter','latex', ...
        'Location','best')
xlim([15, 20])
grid on
exportgraphics(gcf, 'qe0_1_estimated.pdf', 'ContentType', 'vector');