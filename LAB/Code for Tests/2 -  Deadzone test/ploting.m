% plot_deadzone.m
% Deteta a deadzone do motor (0 a 2.5s) num único gráfico

clear; clc; close all;

%% 1. Carregar Dados
load('deadzone-sentido2.mat');

% Extrair arrays diretamente das estruturas
t_vec = alpha.time;
u_val = u.signals.values(:);
alpha_deg = alpha.signals.values(:) * (180/pi);

%% 2. Encontrar Deadzone (Sem Ruído)
% Como não há ruído, a deadzone é o primeiro índice onde o ângulo
% é diferente do ângulo inicial (0)
idx_mov = find(alpha_deg ~= alpha_deg(1), 1, 'first');

if ~isempty(idx_mov)
    v_deadzone = u_val(idx_mov);
    t_mov = t_vec(idx_mov);
    fprintf('Deadzone: %.3f V aos %.3f s\n', v_deadzone, t_mov);
else
    v_deadzone = NaN; t_mov = NaN;
end

%% 3. Gráficos (Tudo num só eixo usando yyaxis)
fig = figure('Name', 'Deadzone', 'Position', [100, 100, 900, 500]);

% --- Eixo Esquerdo: Tensão (V) ---
yyaxis left;
h_u = plot(t_vec, u_val, 'b', 'LineWidth', 1.5, 'DisplayName', 'Tensão (V)'); hold on;
ylabel('Tensão u (V)');
ax = gca; ax.YColor = 'b'; 

% Marcação do ponto de deadzone
if ~isnan(t_mov)
    h_pt = plot(t_mov, v_deadzone, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Ponto Deadzone');
    xline(t_mov, 'r--', 'LineWidth', 1.2, 'DisplayName', 'Início Movimento'); 
    text(t_mov, v_deadzone, sprintf('  %.2f V', v_deadzone), 'Color', 'r', 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% --- Eixo Direito: Ângulo (Graus) ---
yyaxis right;
h_alpha = plot(t_vec, alpha_deg, 'k', 'LineWidth', 1.5, 'DisplayName', '\alpha (graus)');
ylabel('\alpha (graus)');
ax.YColor = 'k'; 

% Formatação Geral
grid on; 
xlim([0, 2]); % Focar apenas no arranque
ylim([-2, 2]);
xlabel('Tempo (s)'); 

% Truque para o exportgraphics não cortar o topo do título:
title({' ', 'Análise da Deadzone: Tensão vs Alpha', ' '});
set(gca, 'Position', [0.1 0.12 0.8 0.75]); 

% Legendas
if ~isnan(t_mov)
    legend([h_u, h_alpha, h_pt], 'Location', 'northwest');
else
    legend([h_u, h_alpha], 'Location', 'northwest');
end

%% 4. Guardar
exportgraphics(fig, 'Calculo_Deadzone-sentido-2.pdf', 'Resolution', 1000);