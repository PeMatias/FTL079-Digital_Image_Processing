% FTL079_DIP_PROJECT_12
% Pedro V D S Matias (pvsm@icomp.ufam.edu.br), 15-06-2019 14:29 
%------------------------------------------------------------------------

clc;
clear all;

f = imread('RGB-color-cube.tif'); % Imagem original
g1=rgb2hsi(f); % Transforma RGB-> HSI
g2=hsi2rgb(g1); % Transforma de HSI para RGB

figure;
subplot(1,3,1); imshow(f,[],'Border','tight');    title('Original');
subplot(1,3,2); imshow(g1,'Border','tight');  title('RGB -> HSI');
subplot(1,3,3); imshow(g2,[],'Border','tight');    title('HSI -> RGB');


imwrite(g1 ,'rgb2hsi_cube.tif','tif');
imwrite(g2 ,'hsi2rgb_cube.tif','tif');