%% ================================================================
%  test.m - Procedimento de tuning do estimador (Kalman/LQE)
%  CMNO 2024/2025 - Lab Sessions 5 & 6
%  ================================================================
clear; clc; close all;

%% ================================================================
%  PASSO 0 - Medir Re (ruído dos sensores)
%  ================================================================
%  1) Abrir IP_TEST_PCI6221_2015a.slx
%  2) Pêndulo completamente PARADO na posição de repouso (para baixo)
%  3) Correr ~10 segundos sem tocar em nada
%  4) Parar o Simulink
%  5) Os "To Workspace" guardam alpha_data e beta_data
%  6) Correr esta secção:

var_alpha = var(alpha_data);   % se for Timeseries: var(alpha_data.Data)
var_beta  = var(beta_data);

Re = diag([var_alpha, var_beta]);
fprintf('Re medido experimentalmente:\n');
disp(Re)
fprintf('var_alpha = %.6f\n', var_alpha);
fprintf('var_beta  = %.6f\n', var_beta);


%% ================================================================
%  PASSO 1 - Varrimento escalar de Qe (ordem de grandeza)
%  Objetivo: encontrar o melhor compromisso entre rapidez do
%  estimador e amplificação de ruído no controlo.
%  Re FIXO (medido no passo 0), Qe = eye(5) * escalar
%  ================================================================
%  Para cada valor de escalar:
%    1) Mudar Qe no IP_MACRO.m
%    2) Correr IP_MACRO.m
%    3) Verificar polos (todos com parte real negativa!)
%    4) Abrir IP_LQG_PCI6221_2015a.slx
%    5) Fazer experiência no hardware
%    6) Guardar dados com post_process.m
%  ================================================================

% --- TESTE 1A: Qe = eye(5) * 0.1 ---
% Confia muito no modelo, estimador lento
% Expectativa: u suave, mas pode não seguir perturbações

% --- TESTE 1B: Qe = eye(5) * 1 ---
% Compromisso conservador

% --- TESTE 1C: Qe = eye(5) * 10 ---
% Compromisso agressivo (baseline original)

% --- TESTE 1D: Qe = eye(5) * 100 ---
% Confia muito nas medições, estimador rápido
% Expectativa: segue bem perturbações, mas u pode ser ruidoso

% DEPOIS DOS 4 TESTES: comparar resultados
% Critérios:
%   - MSE de beta (estabilidade do pêndulo)
%   - Suavidade de u (menos oscilação = melhor)
%   - Erro de estimação (medido vs estimado)
% Escolher a melhor ordem de grandeza => q_base

%% ================================================================
%  PASSO 2 - Afinação individual de Qe (baseada na física)
%  Partir do melhor q_base do passo 1
%  Justificação para cada estado:
%    alpha, alpha_dot: atrito seco (Coulomb) mal modelado -> Qe maior
%    beta, beta_dot:   linearização sin(b)~b é a maior fonte de erro -> Qe maior
%    i:                modelo elétrico (RL) é preciso -> Qe menor
%  ================================================================

% --- TESTE 2A: Referência uniforme ---
% Qe = diag([q_base, q_base, q_base, q_base, q_base])

% --- TESTE 2B: Penalizar incerteza mecânica ---
% Qe = diag([1.5*q_base, 1.5*q_base, 2*q_base, 2*q_base, 0.5*q_base])
% Justificação: beta tem mais erro de linearização, i tem modelo bom

% --- TESTE 2C: Variante ---
% Qe = diag([q_base, q_base, 3*q_base, 3*q_base, 0.2*q_base])
% Mais agressivo na compensação de beta

%% ================================================================
%  PASSO 3 - Verificação dos polos (correr ANTES de cada teste!)
%  ================================================================
%  Depois de correr IP_MACRO.m, verificar:

% run('IP_MACRO.m')
% 
% % Polos do regulador (primeiros 5 estados)
% polos_reg = eig(A_orig - B_orig * K(1:5));
% fprintf('Polos do regulador:\n'); disp(polos_reg)
% 
% % Polos do observador
% polos_obs = eig(A_orig - L5 * C_orig);
% fprintf('Polos do observador:\n'); disp(polos_obs)
% 
% % Regra: polos do observador devem ser 2-5x mais rápidos
% % (parte real mais negativa) que os do regulador
% fprintf('Polo mais lento do regulador:  %.2f\n', max(real(polos_reg)))
% fprintf('Polo mais lento do observador: %.2f\n', max(real(polos_obs)))

%% ================================================================
%  PASSO 4 - Comparação final
%  ================================================================
%  Depois de todos os testes:
%  run('compare_experiments.m')
%
%  Para o relatório, justificar a escolha final com:
%    - Re determinado experimentalmente (variância do ruído dos sensores)
%    - Qe afinado em dois passos:
%      1) Varrimento escalar para encontrar ordem de grandeza
%      2) Afinação individual baseada na física do modelo
%    - Validação: polos do observador 2-5x mais rápidos que os do regulador
%    - Métrica de desempenho: MSE de alpha e beta, RMS de u