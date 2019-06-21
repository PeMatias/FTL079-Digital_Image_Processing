clear all
close all

%Definir o elemento estruturante
B = ones(19,19);

% Marcador com os pontos de partidas, F
%F = imread('rice-shaded.tif');
%F = imread('Fig0944(a)(calculator).tif');
%F = imread('girl.tif');
F = imread('sunflower.tif');
% Máscara, imagem para restringir a transformação, G
G=F;
%B = [0 1 0;1 1 1; 0 1 0];
F = imdilate(F,B);

E = geodetic_erosion_gray( F,G,B,1);

figure('Name', 'Erosão geodésica E(F)');
subplot(2,2,1); imshow(F,[], 'Border','tight'); title('F');
subplot(2,2,2); imshow(B,[], 'Border','tight'); title('B');
subplot(2,2,3); imshow(G,[],'Border','tight');title('G');
subplot(2,2,4); imshow(E,[],'Border','tight');title('E_G^k(F)');

[Re,k] = geodetic_reconstruction_erosion_gray(F,G,B);

figure('Name', 'Reconstrução geodésica por erosão Re(F)');
subplot(2,2,1); imshow(F,[], 'Border','tight'); title('F');
subplot(2,2,2); imshow(B,[], 'Border','tight'); title('B');
subplot(2,2,3); imshow(G,[],'Border','tight');title('G');
subplot(2,2,4); imshow(Re,[],'Border','tight');title('R_G^E(F)');
disp(k);

