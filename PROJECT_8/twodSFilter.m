function [g] = twodSFilter(f,w)
%TWODSFILTER Executa filtragem espacial 2-D de imagem, f
%   f=imagem#1; w=kernel#2
%   g = imagem_filtrada

% Dimensões da imagem
[M,N] = size(f);
[m,n] = size(w);

%Padding na imagem
r = round((m-1)/2);
c = round((n-1)/2);

h = imagePad4e(f,r,c,'replicate');

% Prototipo de matriz
g = im2uint8(zeros(M,N));
for x=1+r:M+r
    for y=1+c:N+c
        % Extraçao da submatriz com o pixel f(x,y) centralizado, usando 
        % a matriz com o padding de replicação
        z = h(x-r:x+r,y-c:y+c); %centralizando os pixels da matriz f
        for s = 1:m
            for t = 1:n
                % Cada pixel da f(x,y) está deslocado em r no eixo x e c no
                % eixo y, realizando a convolução do kernel w com a
                % submatriz z, e atribuindo a posição correta em g.
                g(x-r,y-c) = g(x-r,y-c) + round(w(s,t)*z(s,t));
            end
        end
    end
end
                
                
                
                



end
