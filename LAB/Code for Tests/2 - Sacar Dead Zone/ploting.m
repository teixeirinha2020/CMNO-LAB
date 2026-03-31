% plot_deadzone.m
% Deteta a deadzone do motor (0 a 2s) num único gráfico

clear; clc; close all;

%% 1. Carregar Dados
load('deadzone.mat');

% Extrair arrays (Structure with time)
t_vec = t.signals.values(:); 
u_val = u.signals.values(:);
alpha_rad = alpha.signals.values(:);

% Converter ângulo de radianos para graus
alpha_deg = alpha_rad * (180/pi);

%% 2. Encontrar Deadzone
% Limiar de movimento (0.005 radianos são aprox. 0.3 graus)
limiar_deg = 0.1; 
alpha_base = mean(alpha_deg(1:100));

% Primeiro índice onde o motor mexe
idx_mov = find(abs(alpha_deg - alpha_base) > limiar_deg, 1, 'first');

if ~isempty(idx_mov)
    v_deadzone = u_val(idx_mov);
    t_mov = t_vec(idx_mov);
    fprintf('Deadzone: %.3f V aos %.3f s\n', v_deadzone, t_mov);
else
    v_deadzone = NaN; t_mov = NaN;
end

%% 3. Gráficos (Tudo num só eixo usando yyaxis)
% Aumentada a largura e altura para evitar margens sobrepostas
fig = figure('Name', 'Deadzone', 'Position', [100, 100, 900, 500]);

% --- Eixo Esquerdo: Tensão (V) ---
yyaxis left;
h_u = plot(t_vec, u_val, 'b', 'LineWidth', 1.5, 'DisplayName', 'Tensão (V)'); hold on;
ylabel('Tensão u (V)');
ax = gca; ax.YColor = 'b'; % Pinta o eixo esquerdo de azul

% Marcação do ponto de deadzone no eixo esquerdo
if ~isnan(t_mov)
    h_pt = plot(t_mov, v_deadzone, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Ponto Deadzone');
    h_line = xline(t_mov, 'r--', 'LineWidth', 1.2, 'DisplayName', 'Início Movimento'); 
    text(t_mov, v_deadzone, sprintf('  %.2f V', v_deadzone), 'Color', 'r', 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% --- Eixo Direito: Ângulo (Graus) ---
yyaxis right;
h_alpha = plot(t_vec, alpha_deg, 'k', 'LineWidth', 1.5, 'DisplayName', '\alpha (graus)');
ylabel('\alpha (graus)');
ax.YColor = 'k'; % Pinta o eixo direito de preto

% Formatação Geral
grid on; 
xlim([0, 2.5]); % Focar apenas no arranque
xlabel('Tempo (s)'); 
title('Análise da Deadzone: Tensão vs Alpha ');

% Adicionar a legenda (junta as linhas relevantes)
if ~isnan(t_mov)
    legend([h_u, h_alpha, h_pt], 'Location', 'northwest');
else
    legend([h_u, h_alpha], 'Location', 'northwest');
end

%% 4. Guardar
% O exportgraphics vai cortar as margens direitinho com este novo layout
exportgraphics(fig, 'Calculo_Deadzone.png', 'Resolution', 300);