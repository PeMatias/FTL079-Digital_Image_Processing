clear;
% Para obter as intensidades do nivel de cinza de cada pixel,
% na matriz "img"
img = imread('cktboard_200dpi_gl.jpg');


%========================================================================%
%% 1 QUESTAO
%========================================================================%
% Obtenção das dimensões (linhas e colunas) da imagem via método size()
[M N] = size(img);
whos img;
% Obtenção do valor médios das intensidades de nivl de cinza,
% via mean2() - Media dos valores de uma matriz
media_intensidade = mean2(img);
%========================================================================%
%% 2 QUESTAO
%========================================================================%
% Obtenção do numero de BITS para armazenar cada pixel
K = imfinfo('cktboard_200dpi_gl.jpg');
image_bits = K.Width * K.Height * K.BitDepth;
%========================================================================%
%% 3 QUESTAO
%========================================================================%
% Obtenção da taxa de compressão 
image_bytes = image_bits/8;
taxa_compressao = image_bytes / K.FileSize;
%========================================================================%
% Print dos valores obtidos
fprintf('IMAGEM: cktboard_200dpi_gl.jpg\n\n');
fprintf('Tamanho (M,N) da imagem, M = %d e N = %d\n\n',M,N);
fprintf('Valor do numero de bits para armazenar cada pixe image_bits = %d\n\n',image_bits);
fprintf('Valor taxa de taxa_compressao = %f \n',taxa_compressao);
fprintf('Essa redução permite a transmissão de aproximadamente %.0f vezes\na quantidade de dados não compactados por unidade de tempo.\n',taxa_compressao);
%========================================================================%

%% Imagem salva no formato PNG - descomentar para mostrar a imagem em janelas
img_nova = imread('cktboard_novo_formato.png');
figure;
subplot(1,2,1); imshow(img); title('Imagem original');
subplot(1,2,2); imshow(img_nova,[]); title('Imagem salva no formato PNG');
