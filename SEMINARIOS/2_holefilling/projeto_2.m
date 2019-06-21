clear; clc;

f = imread('Fig0916(a)(region-filling-reflections).tif');         % Abre a imagem

imshow(f);                      

[a,b,c] = cursorValues4e(f);    % Aplica a funcao cursorValues4e na imagem f

f = im2bw(f);

%Chamar função para preencher buracos
g = imfill( f, [b a], 8);
figure, imshow( g );