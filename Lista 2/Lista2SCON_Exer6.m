%% Exercício 6

clc; 
close all; 
clear all;

%Definição dos parâmetros
K1 = 4;

nume1 = [1];
deno1 = [1 1];
H1 = tf(nume1,deno1)

nume2 = [1 0];
deno2 = [1 0 2];
H2 = tf(nume2,deno2)

nume3 = [4 2];
deno3 = [1 2 1];
H3 = tf(nume3,deno3)

nume4 = [1];
deno4 = [1 0 0];
H4 = tf(nume4,deno4)

K2 = 50;

num5 = [1 0 2];
den5 = [1 0 0 14];
H5 = tf(num5,den5)

%%Letra A
%Definição das funções
aux1 = series(H1,H2); 
aux2 = feedback(aux1,H3,-1);
aux3 = feedback(H4,K2,+1);
aux4 = series(aux2,aux3);
aux5 = feedback(aux4,H5,-1);
TF = series(K1,aux5) % Função Transferência do sistema completo

%%Letra B
%Plotagem
figure()
pzmap(TF)
grid on

%%Letra C
p = pole(TF) %Indicados por X
z = zero(TF) %Indicados por 0