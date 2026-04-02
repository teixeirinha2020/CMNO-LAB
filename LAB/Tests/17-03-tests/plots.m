clear 
close all

rad2deg = 180/pi;

%% Qr1
% Data load
data = load("1_1_1.mat");
alpha_std = std(data.y(:,1));
alpha_mean = mean(data.y(:,1));
alpha_range = range(data.y(:,1));
alpha_mse = mse(data.y(:,1));

beta_std = std(data.y(:,2));
beta_mean = mean(data.y(:,2));
beta_range = range(data.y(:,2));
beta_mse = mse(data.y(:,2));

Qr1_data2 = load("10_1_1.mat");
Qr1_data3 = load("100_1_1.mat");
Qr1_data4 = load("1000_1_1.mat");
Qr1_data5 = load("5000_1_1.mat");

% Plots
figure
tiledlayout(2,1)
nexttile
plot(data.t.time, data.y * rad2deg)
title("Qr1 = 1")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(data.t.time, data.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr1_1.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Qr1_data2.t.time, Qr1_data2.y * rad2deg)
title("Qr1 = 10")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr1_data2.t.time, Qr1_data2.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr1_10.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Qr1_data3.t.time, Qr1_data3.y * rad2deg)
title("Qr1 = 100")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr1_data3.t.time, Qr1_data3.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr1_100.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Qr1_data4.t.time, Qr1_data4.y * rad2deg)
title("Qr1 = 1000")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr1_data4.t.time, Qr1_data4.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr1_1000.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Qr1_data5.t.time, Qr1_data5.y * rad2deg)
title("Qr1 = 5000")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr1_data5.t.time, Qr1_data5.u )
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr1_5000.pdf', 'ContentType', 'vector');


%% Qr3
Qr3_data2 = load("1_10_1.mat");
Qr3_data3 = load("1_100_1.mat");
Qr3_data4 = load("1_0d1_1.mat");
Qr3_data5 = load("1_0d01_1.mat");

figure
tiledlayout(2,1)
nexttile
plot(Qr3_data2.t.time, Qr3_data2.y * rad2deg)
title("Qr3 = 10")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr3_data2.t.time, Qr3_data2.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr3_10.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Qr3_data3.t.time, Qr3_data3.y * rad2deg)
title("Qr3 = 100")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr3_data3.t.time, Qr3_data3.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr3_100.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Qr3_data4.t.time, Qr3_data4.y * rad2deg)
title("Qr3 = 0.1")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr3_data4.t.time, Qr3_data4.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr3_0d1.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Qr3_data5.t.time, Qr3_data5.y * rad2deg)
title("Qr3 = 0.01")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Qr3_data5.t.time, Qr3_data5.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Qr3_0d01.pdf', 'ContentType', 'vector');


%% Rr
Rr_data2 = load("1_1_10.mat");
Rr_data3 = load("1_1_0d1.mat");
Rr_data4 = load("1_1_0d01.mat");
Rr_data5 = load("1_1_0d001.mat");

figure
tiledlayout(2,1)
nexttile
plot(Rr_data2.t.time, Rr_data2.y * rad2deg)
title("Rr = 10")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Rr_data2.t.time, Rr_data2.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Rr_10.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Rr_data3.t.time, Rr_data3.y * rad2deg)
title("Rr = 0.1")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Rr_data3.t.time, Rr_data3.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Rr_0d1.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Rr_data4.t.time, Rr_data4.y * rad2deg)
title("Rr = 0.01")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Rr_data4.t.time, Rr_data4.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Rr_0d01.pdf', 'ContentType', 'vector');

figure
tiledlayout(2,1)
nexttile
plot(Rr_data5.t.time, Rr_data5.y * rad2deg)
title("Rr = 0.001")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(Rr_data5.t.time, Rr_data5.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'Rr_0d001.pdf', 'ContentType', 'vector');


%% Other
other_data = load("1000_1_0d001.mat");
figure
tiledlayout(2,1)
nexttile
plot(other_data.t.time, other_data.y * rad2deg)
title("Qr1 = 1000, Qr3 = 1, Rr = 0.001")
ylabel("Ângulo [deg]")
legend("\alpha", "\beta")
xlim([10,20])
grid on
nexttile
plot(other_data.t.time, other_data.u)
xlabel("Tempo[s]")
ylabel("u [V]")
xlim([10,20])
grid on
exportgraphics(gcf, 'other_Qr1_1000_Rr_0d001.pdf', 'ContentType', 'vector');