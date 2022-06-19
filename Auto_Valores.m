%UNEFA - ING de Sistemas 6to Semestre
% Armando Rojas 26059573



%declaracion de matriz 

A = [10 -9; 4 -2]



% Obtencion del Auto Valor
% con una funcion propia de matlab

vector = eig(A)

%apartir de la matriz vector obtnenemos el valor

auto_valor = vector(1,1)

%Ahora obtenemos el auto vector


%copia de la matriz para luego mostrar
matriz = A

%Calculamos con el autovalor
A(1,1) = A(1,1) - auto_valor
A(2,2) = A(2,2) - auto_valor

% obtenemos Y para el auto valor 

y =  (A(1,2) / A(1,1)) * -1
%borrar 
clc
%mostrar Datos
fprintf('La matriz es = ( %2.1f  %2.1f ) \n',matriz(1,1),matriz(1,2));
fprintf('               ( %2.1f  %2.1f )\n\n',matriz(2,1),matriz(2,2));

fprintf('El auto-valor es = %2.1f \n',auto_valor)
fprintf('El auto-vector es = (%2.1f , %2.1f) \n',y,1)

