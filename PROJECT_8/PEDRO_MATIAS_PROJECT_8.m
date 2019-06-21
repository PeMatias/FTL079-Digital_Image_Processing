%% TESTE DE FILTRAGEM ESPACIAL

% Lendo as imagens de teste
f = imread('testpattern1024.tif');


% Teste sua função implementando um filtro passa-baixa (filtro espacial 
% de média) para reduzir as transições agudas em intensidade
% com w = 3X3, 11x11 e 21x21

w1(1:3,1:3)   = 1/(3*3);
w2(1:11,1:11) = 1/(11*11);
w3(1:21,1:21) = 1/(21*21);

g1 = twodSFilter(f,w1);
g2 = twodSFilter(f,w2);
g3 = twodSFilter(f,w3);

figure;
subplot(2,2,1); imshow(f,[],'Border','tight'); title('Imagem original');
subplot(2,2,2); imshow(g1,[],'Border','tight'); title('Filtro de Media 3x3');
subplot(2,2,3);imshow(g2,[],'Border','tight'); title('Filtro de Media 11x11');
subplot(2,2,4); imshow(g3,[],'Border','tight'); title('Filtro de Media 21x21');


%%  COMENTARIOS SOBRE OS TIPOS DE MASCARAS
% O processo de suavização e remoção de ruído é proporcional à
% dimensão da máscara, assim quanto maior a mascara como a w3(21x21) a
% imagem está completamente borrada, principalmente em pontos regiões de
% bordas. Isso ocorre porque a filtragem na é uma operação pontual, o valor
% dos pixels dependerá da vizinhança que para aqueles nas bordas da imagem
% foi feito uma padding de replicação.
