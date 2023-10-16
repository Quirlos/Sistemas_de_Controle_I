%%Exercício 3

clc; 
close all; 
clear all;

%Definição da função
t1 = 0:0.01:10
num = [1];
den = [1 4 3];
TF = tf(num,den) %Função Transferência sem aplicação do degrau

yt = (1/3) - (1/2).*exp(-t1) + (1/6)*exp(-3.*t1);

%Plotagem
figure()
plot(t1,yt)
hold on
step(TF)
grid on