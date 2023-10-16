%%Exercício 9

clc; 
close all; 
clear all;

numeG = [1 1];
denoG = [1 2];
G = tf(numeG,denoG)

numeH = [1];
denoH = [1 1];
H = tf(numeH,denoH)

%%Letra A
TF = feedback(G,H,-1)

%%Letra B
figure()
pzmap(TF)
grid on

%%Letra C
cancel = minreal(TF)