clear all
close all

% Imagem de entrada
f = zeros(10,10);
f(2,7) = 1 ; f(2,8) = 1; f(2,9) = 1; f(3,7) = 1 ; f(3,8) = 1; f(3,9) = 1;
f(4,6) = 1 ; f(4,7) = 1; f(4,9) = 1; f(5,6) = 1 ; f(5,7) = 1; f(5,8) = 1;
f(5,9) = 1 ; f(6,6) = 1; f(6,5) = 1; f(6,4) = 1 ; f(7,3) = 1; f(7,4) = 1;
f(7,5) = 1 ; f(8,2) = 1; f(8,5) = 1; f(9,3) = 1 ; f(9,4) = 1; f(9,5) = 1;


% Elementos estruturante
B = ones(3);

% Arranjo com um ponto 
X = zeros(10,10);
X(7,4) = 1;

g = extraction_connected_components( f, B, X );
figure('Name', 'Componentes conexos extraídos');
subplot(2,2,1); imshow(f,[], 'Border','tight'); title('f');
subplot(2,2,2); imshow(B,[], 'Border','tight'); title('B');
subplot(2,2,3); imshow(X,[],'Border','tight');title('X');
subplot(2,2,4); imshow(g,[],'Border','tight');title('g');