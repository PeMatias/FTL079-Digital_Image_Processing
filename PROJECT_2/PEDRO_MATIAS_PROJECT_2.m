clear,clc;
%=========================================================================
%% (A) função pixVal4e no arquivo pixVale.m
%=========================================================================

%=========================================================================
%% (B) Teste da função pixVal4e com a imagem girl.tif

img = imread('girl.tif');
[img_r, img_c] = size(img);

fprintf('\n(b) Usando a função pixVal4e(f,x,y)\n')
fprintf('Na origem [f(1,1)] da imagem     v = %d\n', pixVal4e(img,1,1));
fprintf('Na metade [f(M/2,N/2)] da imagem v = %d\n', pixVal4e(img,floor(img_r/2),floor(img_c/2)));
%=========================================================================

%=========================================================================
%% (C) função cursorValues4e(f) no arquivo cursorValues4e.m
%=========================================================================

fprintf('\n(c) Usando a função cursorValues4e(f)\n');
[x,y,f] = cursorValues4e(img);
fprintf('\nAs coordenadas, são x= %d y= %d,\n e o valor de intensidade do pixel f(x,y) = %d\n',x,y,f);