function [g] = histEqual4e(f)
%HISTEQUAL4E Executa a equalização do histograma em uma imagem de 
% entrada de 8 bits, f
%   f = imagem MxN #1
%   Os  níveis  de  cinza  para  a  imagem  original  f  
%   e  para  a  imagem  equalizada  g  são representados por rk 
%   e sk, respectivamente, com o 0≤k≤L-11 

% Calculo do histograma da imagem a ser equalizada
p = imagehist4e(f,'n'); %normalizado
L = 256;
s = zeros(1,L-1);
for k= 1:L
    % arredondar valor para o nível de cinza mais próximo
    s(k) = round((L-1)*sum(p(1:k)));
end

[M,N] = size(f);
g = zeros(M,N);

for x = 1:M
    for y = 1:N
        %obter a imagem final equalizada
        g(x,y) = s(f(x,y)+1);
    end
end 
imagehist4e(g,'n');








