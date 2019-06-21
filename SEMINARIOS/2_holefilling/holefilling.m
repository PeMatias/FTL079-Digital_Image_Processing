clear all
close all

%Ler o arquivo
f = imread('Fig0916(a)(region-filling-reflections).tif');
figure, imshow( f );

f = im2bw(f);

%Chamar função para preencher buracos
g = imfill( f, [232 417; 57 64], 8);
figure, imshow( g );