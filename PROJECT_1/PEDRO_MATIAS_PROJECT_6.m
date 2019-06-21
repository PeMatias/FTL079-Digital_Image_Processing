%% TESTE DE EQUALIZAÇÃO DE HISTOGRAMA

% Lendo as imagemns de teste
f1 = imread('hidden-horse.tif');
f2 = imread('spillway-dark.tif');

g1 = histEqual4e(f1);
g2 = histEqual4e(f2);

figure;
subplot(1,2,1); imshow(f1,[]); title('Imagem original - hidden-horse.tif');
subplot(1,2,2); imshow(g1,[]); title('Imagem equalizada - hidden-horse.tif');

subplot(2,2,1); imshow(f2,[]); title('Imagem original - spillway-dark.tif');
subplot(2,2,2); imshow(g2,[]); title('Imagem equalizada - spillway-dark.tif');



