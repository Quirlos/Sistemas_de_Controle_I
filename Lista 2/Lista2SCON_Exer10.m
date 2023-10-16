%%Exercício 10

clc; 
close all; 
clear all;

%Definição das funções
numeplanta = [1];
denoplanta = [1 20 20];
planta = tf(numeplanta,denoplanta);

%%Letras A e B
K = [0.1:0.1:10];

for ii = 1:length(K)
    aux = tf(K(ii),1);
    aux2 = series(aux,planta);
    T1 = feedback(aux2,1,-1);
    Y1 = step(T1); % R(s) = 1/s e Tp(s) = 0
    Yt(ii) = Y1(end);
    T2 = feedback(planta,aux);
    Y2 = step(T2);
    Yt2(ii) = Y2(end);
end

%Plotagem
figure(10)
plot(K,Yt)
grid on
hold on
plot(K,Yt2)
legend('Letra A','Letra B')