%% Exercício 5

clc; 
close all; 
clear all;

%Definição dos parâmetros
J = 10.8e8; % slug*m^2
K = 10.8e8;
a = 1;
b = 8;

%Definição das funções
numecont = [K K*a];
denocont = [1 b];
controlador = tf(numecont,denocont)

numeveiculo = [1];
denoveiculo = [J 0 0];
veiculo = tf(numeveiculo,denoveiculo)

%%Letra A
G = series(controlador,veiculo);
TF = feedback(G,1,-1) % Função Transferência do sistema inteiro

%%Letra B
%Plotagem
figure()
step(10*TF) %Inserção de um degrau de 10 graus
grid on

%%Letra C
Jc1 = 0.8*J; %Diminui J em 20%
Jc2 = 0.5*J; %Diminui J em 50%

%Definição das funções
denoveiculoc1 = [Jc1 0 0];
veiculoc1 = tf(numeveiculo,denoveiculoc1)
Gc1 = series(controlador,veiculoc1);
Tc1 = feedback(Gc1,1,-1) %Função Transferência do sistema c1

denoveiculo2 = [Jc2 0 0];
veiculoc2 = tf(numeveiculo,denoveiculo2)
Gc2 = series(controlador,veiculoc2);
Tc2 = feedback(Gc2,1,-1) % Função Transferência do sistema c2

figure()
step(10*Tc1)
hold on
step(10*Tc2)
legend('J reduzido 20%','J reduzido 50%')
grid on