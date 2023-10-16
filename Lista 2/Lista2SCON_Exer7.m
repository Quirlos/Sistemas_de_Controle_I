%%Exercício 7

clc; 
close all; 
clear all;

%Definição dos parâmetros
Th = pi/6;
L = 0.5; %m
m = 1; %Kg
g = 9.8; %m/s^2
t = 0:0.01:10;

%Definição das funções
nume = [1 0 0];
deno = [1 0 g/L];
Tlin = tf(nume,deno);

[t,Ynlin] = ode45(@pend,t,[Th 0]);

%Plotagem
figure()
step(Th*Tlin,10)
hold on
plot(t,Ynlin(:,1), 'Color','r')
legend('Aproximação linear','Sistema não-linear')
grid on

function [yd]=pend(t,y)
    L=0.5; g=9.8;
    yd(1)=y(2);
    yd(2)=-(g/L)*sin(y(1));
    yd=yd';
end

