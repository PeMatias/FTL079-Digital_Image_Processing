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

figure;imshow(Img_256,[]);title('256 niveis');
for lay  = L:-1:1
     figure;imshow(ImgRes(:,:,lay),[]);title(string(2^lay)+' níveis');
     % Arquivos numerados exponecialmente
     filename = ['drip-boottle-',num2str(2^lay),'.tif'];
     % Escrevendo as imagens
     imwrite(ImgRes(:,:,lay),filename,'tif','Compression','none','Resolution',783);
end











    
    
    
    
    
    
    
    
    
    
        