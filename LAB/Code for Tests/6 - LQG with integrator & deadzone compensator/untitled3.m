clear 
close all

rad2deg = 180/pi;

data = load("1teste.mat");
data1 = load("2teste.mat");
data2 = load("3teste-int20.mat");
data3 = load("4teste-100-10-20.mat");
data4 = load("5teste-deadzone1_8.mat");
data5 = load("6teste-10-10-15.mat");
data6 = load("7teste-100-10-10.mat");
data7 = load("8teste-100-10-5.mat");
data8 = load("9teste-100-10-5-1_5dead.mat");
data9 = load("10teste-100-10-5-2_2dead_with_pert.mat");
data10 = load("11teste-100-5-5-2_2dead.mat");
data11 = load("12teste-100-10-50-2_2dead_with_pert.mat");
data12 = load("13teste-100-30-15-2_2dead_with_pert.mat");
data13 = load("14teste-100-1-15-2_2dead_with_pert.mat");
data14 = load("15teste-100-1-15-2_2dead_with_pert.mat");


% Plots
figure
tiledlayout(2,1)
nexttile
plot(data.t, data.y.signals.values * rad2deg)
title("Qr = diag([100 0 1 0 15]), Rr = 0.01, +-0.20 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data.t, data.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '1teste.pdf', 'ContentType', 'vector');

% Plots
figure
tiledlayout(2,1)
nexttile
plot(data1.t, data1.y.signals.values * rad2deg)
title("Qr = diag([10 0 100 0 15]), Rr = 0.01, +-0.20 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data1.t, data1.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '2teste.pdf', 'ContentType', 'vector');

% Plots
figure
tiledlayout(2,1)
nexttile
plot(data2.t, data2.y.signals.values * rad2deg)
title("Qr = diag([10 0 100 0 20]), Rr = 0.01, +-0.20 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data2.t, data2.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '3teste-int20.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data3.t, data3.y.signals.values * rad2deg)
title("Qr = diag([100 0 10 0 20]), Rr = 0.01, +-0.20 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data3.t, data3.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '4teste-100-10-20.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data4.t, data4.y.signals.values * rad2deg)
title("Qr = diag([10 0 100 0 15]), Rr = 0.01, +-0.20 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data4.t, data4.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '5teste-deadzone1_8.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data5.t, data5.y.signals.values * rad2deg)
title("Qr = diag([10 0 10 0 15]), Rr = 0.01, +-0.20 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data5.t, data5.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '6teste-10-10-15.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data6.t, data6.y.signals.values * rad2deg)
title("Qr = diag([100 0 10 0 10]), Rr = 0.01, +-0.22 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data6.t, data6.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '7teste-100-10-10.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data7.t, data7.y.signals.values * rad2deg)
title("Qr = diag([100 0 10 0 5]), Rr = 0.01, +-0.22 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data7.t, data7.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '8teste-100-10-5.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data8.t, data8.y.signals.values * rad2deg)
title("Qr = diag([100 0 10 0 5]), Rr = 0.01, +-0.15 Comp.")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data8.t, data8.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '9teste-100-10-5-1_5dead.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data9.t, data9.y.signals.values * rad2deg)
title("Qr = diag([100 0 10 0 5]), Rr = 0.01, +-0.22 Comp. - With perturbation")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data9.t, data9.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '10teste-100-10-5-2_2dead_with_pert.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data10.t, data10.y.signals.values * rad2deg)
title("Qr = diag([100 0 5 0 5]), Rr = 0.01, +-0.22 Comp.")
ylabel("Angle [deg]")
xlim([10, 29])
legend("\alpha", "\beta")
grid on

nexttile
plot(data10.t, data10.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 29])
grid on
exportgraphics(gcf, '11teste-100-5-5-2_2dead.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data11.t, data11.y.signals.values * rad2deg)
title("Qr = diag([100 0 10 0 50]), Rr = 0.01, +-0.22 Comp. - With perturbation")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data11.t, data11.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '12teste-100-10-50-2_2dead_with_pert.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data12.t, data12.y.signals.values * rad2deg)
title("Qr = diag([100 0 30 0 15]), Rr = 0.01, +-0.22 Comp. - With perturbation")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data12.t, data12.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '13teste-100-30-15-2_2dead_with_pert.pdf', 'ContentType', 'vector');

%Plots
figure
tiledlayout(2,1)
nexttile
plot(data13.t, data13.y.signals.values * rad2deg)
title("Qr = diag([100 0 1 0 15]), Rr = 0.01, +-0.22 Comp. - With perturbation")
ylabel("Angle [deg]")
xlim([10, 30])
legend("\alpha", "\beta")
grid on

nexttile
plot(data13.t, data13.u.signals.values)
legend("u")
xlabel("Time [s]")
ylabel("Voltage [V]")
xlim([10, 30])
grid on
exportgraphics(gcf, '14teste-100-1-15-2_2dead_with_pert.pdf', 'ContentType', 'vector');