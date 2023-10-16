close all;
clc;
clear;

%%Gerando a função de transferência em malha aberta
p=[1 1]; %numerador da função de transferência
q=[1 5 6 0]; %denominador da função de transferência
sys=tf(p,q)

%% Gerando o lugar geométrico das raízes
%os polos buscam os zeros no infinito
rlocus(sys);

% o → zeros
% x → polos

% Linhas coloridas são os deslocamento das raízes (polos) conforme a
% variação do ganho k
% Quando as raízes se encontram (k = 0.419), é criticamente amortecido

% P/ polos:
% Duas raízes Subamortecido
% Raízes iguais Sem amortecimento
% Sem raízes 

%% Gera os vetores da posição das raízes associados
[r,K]=rlocus(sys)

%% localizar graficamente um ponto no LGR
disp("-------------------------------------------------------------")
figure(2)
rlocus(sys);
rlocfind(sys) % aparece a cruz que mostra onde o polos estão localizados
              % para aquele valor, resposta no prompt

%% Gera os ganhos/resíduos (r) de frações parciais associados com cada polo
% polo (p)
disp("-------------------------------------------------------------")
K = 20.5775; num = K * [1 4 3]; den = [1 5 6+K K 0];
[r, p, k] = residue(num, den) % Usado para expansão em frações parciais
disp("k = 0 pois não foi usado nas frações parciais")

%% respostas ao degrau K = 20.5775 vetor sem aplicação do degrau 
disp("-------------------------------------------------------------")
K = 20.5775; num = K * [1 4 3]; den = [1 5 6+K K];
sys = tf(num, den)

figure(3)
step(sys)
% characteristics → peak response: pico
% characteristics → setting time: mostra onde começa a entrar em regime
                                % permanente
% characteristics → rise time: p/sistemas superamortecidos tempo de subida
% de 0 a 100%

%% Sensibilidade das raízes para uma mudança de 5% de K
disp("-------------------------------------------------------------")
K = 20.5775; den = [1 5 6+K K]; r1 = roots(den); % raízes do polinomio den
dK = 1.0289;
Km = K + dK; % variação do ganho K
denm = [1 5 6+Km Km]; % novo denominador
r2 = roots(denm); % raízes do novo polinomio denm
dr = r1 - r2; 
Sensibilidade = dr / (dK / K) % sensibilidade 