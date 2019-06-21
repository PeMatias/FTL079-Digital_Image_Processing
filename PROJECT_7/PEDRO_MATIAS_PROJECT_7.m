%% TESTE DE EQUALIZAÇÃO DE HISTOGRAMA

% Lendo as imagens de teste
f = imread('testpattern1024.tif');

% Obtendo os padding zeros e replicate de 3 colunas e 3 linhas
g1 = imagePad4e(f,3,3); % Padding Zeros
g2 = imagePad4e(f,3,3,'replicate');

% Apresentando as imagens
figure;imshow(g1,[]);
figure;imshow(g2,[]);

%% COMENTARIOS SOBRE OS METODOS DE PADDING
% No caso do zeros quanto maior os parametros r e c, maior fica a borda
% produzida com o padding, afinal ele adiciona linhas e colunas com pixels
% pretos.
% No caso do padding replicate a imagem não apresenta o contorno, ela fica
% semelhante a orginal devido estar expandido a imagem com a copia da
% intensidades da borda. Se torna mais adequada para aplicações de filtro
