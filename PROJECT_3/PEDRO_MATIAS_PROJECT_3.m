close all,clear all,clc, format compact;

% Reduza o número de intensidades da imagem drip-bottle-256.tif de 256 para
% 2 em potências inteiras de 2, enquanto deixa a resolução da imagem em um
% fixo 783 dpi (a imagem é de tamanho 2022x1800 pixels).

% Lendo e armazenando os valores dos pixels da imagem
Img_256 = imread('drip-bottle-256.tif');
% Extraindo o número de linhas e colunas da imagem 
[M, N] = size(Img_256);
% Quantidade de reduções de 256 para 2, pode ser determinada pela diferença
% de logaritmos na base 2. Informará a quantidade de imagens possiveis
L = log2(256) - log2(2);
% Criando uma matriz 3D com a resolução espacial constante e L páginas logo
% A imagem redimensionada será [M N L} com cada elemento sendo escrito com
% 1 byte (8 bits sem sinal)
ImgRes = im2uint8( zeros(M,N,L)); % Prototipo de imagem com elementos zeros

I = Img_256; %Inicializa a matriz temporaria com a de 256 niveis
for lay = L:-1:1 % varredura por camada (página) da maior potencia a menor
    for col = 1:N % varredura horizonalmente - colunas
        for row = 1:1:M %varredra verical - linhas
            ImgRes(row,col,lay) = I(row,col)/2; % Reduz a intensidade na metade
        end
    end 
    I = ImgRes(:,:,lay); % Atualiza a para o nivel mais baixo 2^()
end

figure;
subplot(2,2,1);imshow(Img_256,[]);title('256 niveis');

subplot(2,2,2);imshow(ImgRes(:,:,7),[]);title('128 niveis');
imwrite(ImgRes(:,:,7),'drip-bottle-128.tif'); % gerando imagens tif

subplot(2,2,3);imshow(ImgRes(:,:,6),[]);title('64 níveis');
imwrite(ImgRes(:,:,6),'drip-bottle-64.tif'); % gerando imagens tif

subplot(2,2,4);imshow(ImgRes(:,:,5),[]);title('32 níveis');
imwrite(ImgRes(:,:,5),'drip-bottle-32.tif'); % gerando imagens tif

figure;
subplot(2,2,1);imshow(ImgRes(:,:,4),[]);title('16 níveis');
imwrite(ImgRes(:,:,4),'drip-bottle-16.tif'); % gerando imagens tif

subplot(2,2,2);imshow(ImgRes(:,:,3),[]);title('8 níveis');
imwrite(ImgRes(:,:,3),'drip-bottle-8.tif'); % gerando imagens tif

subplot(2,2,3);imshow(ImgRes(:,:,2),[]);title('4 níveis');
imwrite(ImgRes(:,:,2),'drip-bottle-4.tif'); % gerando imagens tif

subplot(2,2,4);imshow(ImgRes(:,:,1),[]);title('2 níveis');
imwrite(ImgRes(:,:,1),'drip-bottle-2.tif'); % gerando imagens tif







    
    
    
    
    
    
    
    
    
    
        