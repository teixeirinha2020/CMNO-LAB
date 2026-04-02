clear 
close all

rad2deg = 180/pi;

data = load("lqg-integrador-standard-no-perturb.mat");
data1 = load("lqg-integrador-standard-perturb.mat");

% Plots
figure
tiledlayout(2,1)
nexttile
plot(data.t.time, data.y.signals.values * rad2deg)
title("LQG with \alpha integrator")
ylabel("Angle [deg]")
legend("\alpha", "\beta",'Location','best')
xlim([10,30])
grid on

nexttile
plot(data.t.time, data.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10,30])
grid on
exportgraphics(gcf, 'lqg_integrator.pdf', 'ContentType', 'vector');

% Plots
figure
tiledlayout(2,1)
nexttile
plot(data1.t.time, data1.y.signals.values * rad2deg)
title("LQG with \alpha integrator w/ perturbation")
ylabel("Angle [deg]")
legend("\alpha", "\beta")
xlim([10,30])
grid on

nexttile
plot(data1.t.time, data1.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10,30])
grid on
exportgraphics(gcf, 'lqg_integrator_perturb.pdf', 'ContentType', 'vector');