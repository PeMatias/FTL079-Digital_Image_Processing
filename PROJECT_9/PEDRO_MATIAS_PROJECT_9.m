% FTL079_DIP_PROJECT_9
% Pedro V D S Matias (pvsm@icomp.ufam.edu.br), 15-06-2019 12:29 
%-------------------------------------------------------------------------

close all,clear all clc;


[f,cmap] = imread('polymercell.tif');

%   1. Suavização de imagem para redução de ruído;
%   2. Detecção de pontos de borda: operações locais que extrapolam a imagem de todos os pontos que 
%   são candidatos potenciais para se tornarem pontos de borda
%   3. Localização de borda: o objetivo desta etapa é selecionar entre os pontos de borda candidatos 
%   apenas os pontos que são verdadeiros membros do conjunto de pontos que compõem uma aresta.


%   Calculo do gradiente, da magnitude e do ângulo

sx=[-1 -1 -1; 0 0 0; 1 1 1];
sy=[-1 0 1; -1 0 1; -1 0 1];

Gx=abs(imfilter(double(f), sx, 'conv', 'replicate'));
Gy=abs(imfilter(double(f), sy, 'conv', 'replicate'));
gx = mat2gray(Gx);
gy = mat2gray(Gy);

g = gx+gy; 

subplot(2,2,1); imshow(f,[],'Border','tight');    title('imagem original');
subplot(2,2,2); imshow(gx, [],'Border','tight');  title('|Gx| - Operador de Prewitt');
subplot(2,2,3); imshow(gy, [],'Border','tight');  title('|Gy| - Operador de Prewitt');
subplot(2,2,4); imshow(g, [],'Border','tight');   title('Imagem Segmentada - Operador de Prewitt');
