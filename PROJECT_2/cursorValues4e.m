function [r,c,v] = cursorValues4e(f)
%CURSORVALUES4E Retorna o valor da linha, coluna e da intensidade do pixel
%   Mostra a imagem f, exibindo um cursor controlado pelo mouse sobre ele e,
%   quando o botão esquerdo do mouse é clicado, gera as coordenadas de 
%   linha / coluna (r, c) e o valor v do pixel nessas coordenadas

figure;
hold on;
imshow(f); % Mostrar a imagem
[x,y] = ginput(1); % Apenas um click, por isso N = 1
r = floor(x); % Aplicando o arrendomento no valor de x do ginput
c = floor(y); % Aplicando o arrendomento no valor de y do ginput
v = f(r,c);

%disp(r),disp(c),disp(v);

h = gcf(); 
close(h); % Fechar a janela da imagem
end

