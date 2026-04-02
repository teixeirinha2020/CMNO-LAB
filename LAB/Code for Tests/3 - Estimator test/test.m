% =========================================================================
% test.m
% Script rápido para comparar os dados medidos com os estimados
% e exportar automaticamente o gráfico para PNG (Compatível com R2015a).
%
% -------------------------------------------------------------------------
% PRÉ-REQUISITOS (Variáveis necessárias no Workspace)
%   tout           - Vetor de tempo da simulação
%   alpha_sensor   - Ângulo do motor medido (rad)
%   alpha_estimado - Ângulo do motor estimado (rad)
%   beta_sensor    - Ângulo do pêndulo medido (rad)
%   beta_estimado  - Ângulo do pêndulo estimado (rad)
%   Qe             - Matriz de covariância do processo
%   Re             - Matriz de covariância da medição
% -------------------------------------------------------------------------
% =========================================================================

%% 1. Geração Automática do Nome do Teste
% Extrai os valores das diagonais das matrizes
qe_diag = diag(Qe);
re_diag = diag(Re);

% Converte os valores para texto separados por '_' (ex: 10_10_10_10_10)
qe_str = sprintf('%g_', qe_diag); 
qe_str(end) = []; % Remove o último '_' a mais

re_str = sprintf('%g_', re_diag); 
re_str(end) = []; % Remove o último '_' a mais

% Constrói o nome final
nome_do_teste = sprintf('Qe_%s__Re_%s', qe_str, re_str);

%% 2. Criação da Figura
% Criamos a figura com um tamanho fixo
fig = figure('Name', 'Comparação Sensor vs Estimador', 'Position', [100, 100, 800, 600]);

% --- Subplot 1: Motor Shaft Angle (Alpha) ---
subplot(2,1,1);
plot(t, y.signals.valu, 'b', 'LineWidth', 1.2); hold on;
plot(t, y_estim(1,:), 'r--', 'LineWidth', 1.2); hold off;

% strrep para evitar que os '_' ponham o texto em subscript no título
title(['\alpha (Ângulo do Motor) - Teste: ', strrep(nome_do_teste, '_', '\_')]);
xlabel('Tempo (s)');
ylabel('\alpha (rad)');
legend('Sensor', 'Estimador', 'Location', 'best');
grid on;

% --- Subplot 2: Pendulum Angle (Beta) ---
subplot(2,1,2);
plot(t, y(3,:), 'b', 'LineWidth', 1.2); hold on;
plot(t, y_estim(3,:), 'r--', 'LineWidth', 1.2); hold off;

title(['\beta (Ângulo do Pêndulo) - Teste: ', strrep(nome_do_teste, '_', '\_')]);
xlabel('Tempo (s)');
ylabel('\beta (rad)');
legend('Sensor', 'Estimador', 'Location', 'best');
grid on;

%% 4. Guardar a Imagem Automaticamente (Método R2015a)
nome_ficheiro = sprintf('Resultados_%s.png', nome_do_teste);

% Imprime com 300 DPI de resolução
print(fig, nome_ficheiro, '-dpng', '-r300');

fprintf('--> Gráfico guardado com sucesso: %s\n', nome_ficheiro);