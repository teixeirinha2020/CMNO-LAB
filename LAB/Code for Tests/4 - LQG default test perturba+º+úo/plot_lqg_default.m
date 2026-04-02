clear 
close all

rad2deg = 180/pi;

data = load("perturbacao.mat");

% Plots
figure
tiledlayout(2,1)
nexttile
plot(data.t.time, data.y.signals.values * rad2deg)
title("LQG default values test w/ perturbations")
ylabel("Angle [deg]")
xlim([10,30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data.t.time, data.u.signals.values)
legend("u")
xlabel("Time[s]")
ylabel("Voltage [V]")
xlim([10,30])
grid on
exportgraphics(gcf, 'lqg_default.pdf', 'ContentType', 'vector');