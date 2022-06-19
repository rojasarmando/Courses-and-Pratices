% Armando Rojas - UNEFA 2018

%% Tanque de Nivel dinamico

clc
clear all
close all
%Variables del tanque

k1=0.05;k2=0.015;g=10;
A=0.5;
a1=0.0:0.1:1;   %valvula de entrada
a2=0:0.1:1;     %valvula de Salida
k=1;

A1o=0.6; %Abertura de valvula en punto de Equilibrio
A2o=0.5; %Abertura de valvula de salida en un punto de no equilibrio

%punto de equilibrio del tanque

Ho=(k1^2*A1o^2)/(k2^2*A2o^2*2*g);

%Grafica no lineal del comportamiento del nivel manipulando la válvula de Entrada y salida

for i=1:11
       hA1(i)=(k1^2*a1(i)^2)/(k2^2*A2o^2*2*g);
       hA2(i)=(k1^2*A1o^2)/(k2^2*a2(i)^2*2*g);
       k=k+1;
end
figure
t=0:0.1:1;
subplot(2,1,1);
plot(t,hA1),grid
axis([0 1 0 1]);
title('Variación en valvula de entrada a1');
ylabel('Altura (h)');
xlabel('Abertura de la valvula a1');
subplot(2,1,2);
plot(t,hA2),grid
axis([0 1 0 1]);
title('Variación en valvula de entrada a2');
ylabel('Altura (h)');
xlabel('Abertura de la valvula a2');

%% Proceso de Simulacion

tsim=300;       %tiempo de Simulacion
tA1=10;         %tiempo en  que la variacion de a1 acontece
tA2=150;        %tiempo en  que la variacion de a2 acontece

dA1=0.02;       %variacion en  a1
dA2=0.03;       %variacion en a2
%Simulacion

sim('tanque');

%Graficos

figure
subplot(3,1,1);
plot(t,rY(:,1),t,rY(:,3)),grid
title('Nível del Tanque');
ylabel('Altura (h)');
xlabel('Tiempo (s)');
legend('ALinear','Linear');

subplot(3,1,2);
plot(t,rY(:,2)),grid
title('Abertura en a1');
ylabel('% a1');
xlabel('tiempo (s)');

subplot(3,1,3);
plot(t,rY(:,4)),grid
title('Abertura en a2');
ylabel('% a2');
xlabel('tiempo (s)');
clc