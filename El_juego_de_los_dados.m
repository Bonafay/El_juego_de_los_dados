
clc, clear;
format short

fprintf("\tThe dice game\n\n");
inBank = input("¿Cuanto desea apostar?\n")

dice_6 = [1:6];
dice_8 = [1:8];
dice_12 = [1:12];
dice_20 = [1:20];
combinatoria = 0;
equalDices = 0;
parDices = 0;
imparDices = 0;
thirtyPoints = 0;

% Calculo de la combinatoria (Todas las posibles combinaciones)
for i=1 : length(dice_20)
  for j=1 : length(dice_12)
    for k=1 : length(dice_8)
      for l=1 : length(dice_6)
        combinatoria = combinatoria + 1;
        % Inciso A
        if( (dice_20(i) == dice_12(j)) && (dice_12(j) == dice_8(k)) && (dice_8(k) == dice_6(l)) )
          equalDices = equalDices + 1; % Veces en que todos los datos tienen los mismos puntos
        end
        
        % Inciso B
        if( (rem(dice_20(i),2) == 0) && (rem(dice_12(j),2) == 0) && (rem(dice_8(k),2) == 0) && (rem(dice_6(l),2) == 0))
          parDices = parDices + 1;
        end
        if( (rem(dice_20(i),2) == 0) && (rem(dice_12(j),2) == 0) && (rem(dice_8(k),2) == 0) && (rem(dice_6(l),2) == 0))
          imparDices = imparDices + 1;
        end
        
        % Inciso C
        if( (dice_20(i) + dice_12(j) + dice_8(k) + dice_6(l)) == 30 )
          thirtyPoints = thirtyPoints + 1;
        end
        
      end
    end
  end
end

% Analiticamente
P_A = (equalDices / combinatoria);
P_B = (parDices+imparDices)/combinatoria;
P_C = (thirtyPoints/combinatoria);

fprintf("\n\nEl juego ha comenzado y tus probabilidades de ganar en %d datos son:", combinatoria);
fprintf("\n Multiplicar por 10 tu apuesta: %d", P_A);
fprintf("\n Multiplicar por 5 tu apuesta: %d", P_B);
fprintf("\n Multiplicar por 2 tu apuesta: %d", P_C);

fprintf("\n\n los dados se han lanzado y sus resultados son: \n");
dice_6 = randi(6);
dice_8 = randi(8);
dice_12 = randi(12);
dice_20 = randi(20);
fprintf("\n Dado de 6 caras: %d", dice_6);
fprintf("\n Dado de 8 caras: %d", dice_8);
fprintf("\n Dado de 12 caras: %d", dice_12);
fprintf("\n Dado de 20 caras: %d", dice_20);

if( (dice_20 == dice_12) && (dice_12 == dice_8) && (dice_8 == dice_6) )
  fprintf("\n Has ganado: \n");
  inBank*10
  elseif( (rem(dice_20,2) == 0) && (rem(dice_12,2) == 0) && (rem(dice_8,2) == 0) && (rem(dice_6,2) == 0) || ( (rem(dice_20,2) == 0) && (rem(dice_12,2) == 0) && (rem(dice_8,2) == 0) && (rem(dice_6,2) == 0)))
  fprintf("\n Has ganado:\n");
  inBank*5
    elseif( (dice_20 + dice_12 + dice_8 + dice_6) == 30 )
    fprintf("\n Has ganado:\n");
    inBank*2
else
fprintf("\n Has perdido /w\\ \n\n");
end