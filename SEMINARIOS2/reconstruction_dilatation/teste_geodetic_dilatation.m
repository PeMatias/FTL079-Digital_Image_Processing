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
F = imerode(F,B);
h = geodetic_dilatation_gray( F,G,B,1); % Aumentar o valor de tam = 6 estabilidade
% 
figure('Name', 'dilatação geodésica D(F)');
subplot(2,2,1); imshow(F,[], 'Border','tight'); title('F');
subplot(2,2,2); imshow(B,[], 'Border','tight'); title('B');
subplot(2,2,3); imshow(G,[],'Border','tight');title('G');
subplot(2,2,4); imshow(h,[],'Border','tight');title('D_G^k(F)');

[Rd,k] = geodetic_reconstruction_dilatation( F,G,B);
figure('Name', 'Reconstrução geodésica por dilatação Rd ');
subplot(2,2,1); imshow(F,[], 'Border','tight'); title('F');
subplot(2,2,2); imshow(B,[], 'Border','tight'); title('B');
subplot(2,2,3); imshow(G,[],'Border','tight');title('G');
subplot(2,2,4); imshow(Rd,[],'Border','tight');title('R_G^D');
disp(k);
