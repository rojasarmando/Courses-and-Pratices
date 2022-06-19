%Funciones cuadraticas 
% 10 (x^2) + 12 * x + 21
% Armando Rojas - UNEFA 

valorA=10;
valorB=12;
valorC=21;

funcionCuadratica = valorB^2 - 4 * valorA * valorC;
solucion1=(-valorB+sqrt(funcionCuadratica))/(2*valorA);
solucion2=(-valorB-sqrt(funcionCuadratica))/(2*valorA);

vertice1= -valorB/(2*valorA);
vertice2= -funcionCuadratica/(4*valorA);

if (funcionCuadratica < 0 )
    %no puede ser negativo
    fprintf('No tiene puntos de Corte en x\n');
elseif (funcionCuadratica==0)
    %tiene unica solucion 
    fprintf('Posee una solucion: (%.2f,0)\n',solucion1);
else
    %muestra los 2 puntos 
    fprintf('Tiene dos puntos de Corte en X y son\n');
    fprintf('Punto 1 (%.2f,0)\n',solucion1);
    fprintf('Punto 2 (%.2f,0)\n',solucion2);
end


fprintf('El punto de Corte en Y es (0,%.2f)\n',valorC);
fprintf('El Vertice se encuentra en el punto (%.2f,%.2f)\n',vertice1,vertice2);

if (valorA>0)
    fprintf('Tiene Minimo en Y y es: %.2f\n',vertice2);
    fprintf('Descrece desde -infinito hasta %.2f\n',vertice1);
    fprintf('Crece desde %.2f hasta infinito\n',vertice1);
elseif (valorA<0)
    fprintf('Posee un Maximo en Y y es: %.2f\n',vertice2);
    fprintf('Crece desde el infinito hasta %.2f\n',vertice1);
    fprintf('Y Descrece desde %.2f hasta el infinito\n',vertice1);
end

ezsurf('10* x^2 + 12 * x + 21');