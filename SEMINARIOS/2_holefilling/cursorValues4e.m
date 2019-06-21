function [r,c,v] = cursorValues4e(f)
%   Informa o valor do pixel quando o mouse clica em cima
%   Eh necessario que a imagem ja esteja previamente aberta
%   Na main function (que chamou a cursorValues4e()).
%   O programa exibira um cursor na imagem afim de captar
%   o pixel desejado pelo usuario atraves do mouse

[a, b] = ginput(1);     % Utiliza a funcao ginput e seleciona apenas um pixel

r = round(a);           % Arredonda os valores utilizados (para nao mostrar casas decimais)
c = round(b);


v = f(c,r);             % Verifica o valor do pixel nas coordenadas

h = gcf;                % h funciona como um "handler" da imagem mostrada na tela

close(h);               % Fecha a tela da imagem h (e somente essa)
end