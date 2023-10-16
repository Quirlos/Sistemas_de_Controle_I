%% Exercício 4

clc; 
close all; 
clear all;

%Definição dos parâmetros
m = 10; %Kg
k = 1; %N/m
b = 0.5; %Ns/m

%Definição das funções
num = [1/m];
den = [1 b/m k/m];
H = tf(num,den)

%Plotagem
figure()
step(H)
%Podemos observar que a amplitude máx. é aprox. 1,8m
grid on