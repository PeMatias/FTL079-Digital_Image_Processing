clear all
close all

%Definir o elemento estruturante
B = ones(3);

% Marcador com os pontos de partidas, F
F = zeros(9,10);
F(3,3) = 1;
disp(F);

% Máscara, imagem para restringir a transformação, G
G = zeros(9,10);
G(3,3) = 1; G(4,3) = 1; G(4,4) = 1; G(5,4) = 1;
G(6,4) = 1; G(7,4) = 1; G(8,4) = 1; G(6,5) = 1;
G(8,5) = 1; G(6,6) = 1; G(7,6) = 1; G(8,6) = 1;
disp(G);

h = geodetic_dilatation( F,G,B,1); % Aumentar o valor de tam = 6 estabilidade

figure('Name', 'dilaação geodésica D(F)');
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
