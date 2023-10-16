clear x pp zz G sys

p = [1 3 4 2];

r = roots(p)

%%(3s²+2s+1)(s+4)
p1 = [3 2 1];d = [1 4];
x = conv(p1,d)
%%calculando o valor do polinomio com s = -5
valor = polyval(x,-5)

%%Representar uma função de transferência
num1=[10];den1=[1 2 5];
sys1=tf(num1,den1)
num2=[1];den2=[1, 1];
sys2=tf(num2,den2)
sys=sys1+sys2

pp = pole(sys)
zz = zero(sys)

%%Redução do diagrama de blocos
sys = series(sys1,sys2)
sysr = parallel(sys1,sys2)
sysrealim = feedback(sys1,sys2)

step(sysrealim)

%%Cancelamento de  fatores em comum
sys3r = minreal(sysrealim)

%%Representação de polos e zeros
pzmap(sys3r)