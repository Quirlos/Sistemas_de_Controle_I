%% Exercício 2

clc; 
close all; 
clear all

%%Definição das funções
numecont = [1]; %Numerador da função do controlador
denocont = [1 1]; %Denominador da função do controlador
controlador = tf(numecont,denocont) %Função Transferência do controlador

numeplant = [1 2]; %Numerador da função da planta
denoplant = [1 3]; %Denominador da função da planta
planta = tf(numeplant,denoplant) %Função Transferência da planta

%%Letra A
G1 = series(controlador,planta);
TF = feedback(G1,1,-1) %Pode ser vista "Command Window"

%%Letra B
%Plotagem
figure()
step(TF) 
%Confirmamos pelo gráfico que o valor é igual a 2/5 = 0,4
grid on
