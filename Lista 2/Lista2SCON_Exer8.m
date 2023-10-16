%%Exercício 8

clc; 
close all; 
clear all;

%Definição dos parâmetros
z1 = 5;
z2 = 10;
z3 = 15;

nume1 = [20/z1 20];
nume2 = [20/z2 20];
nume3 = [20/z3 20];
deno = [1 3 20];

%Definição das funções
H1 = tf(nume1,deno)
H2 = tf(nume2,deno)
H3 = tf(nume3,deno)

%Plotagem
figure()
step(H1)
hold on
step(H2)
step(H3)
grid on
legend('Z = 5','Z = 10','Z = 15')