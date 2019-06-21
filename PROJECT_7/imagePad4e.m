function [g] = imagePad4e(f,r,c,padtype)
%IMAGEPAD4E Realiza padding nas imagens
%   Se padtype='zeros' ou for omitido, implementa padding com zeros
%   Se padtype='replicate' deve ser replicado o padding.
%   f = imagem #1; r = rows #2; c = columns #3; padtype =  tipo de padding #4
%   g = imagem de saída.

% Pegando as dimensões da imagem
[M,N] = size(f);

% Prototipo de G, com r linhas em cima e em baixo
% e c colunas na esquerda e na direita
Mnew = M+2*r;
Nnew = N+2*c;
g  = im2uint8(zeros(Mnew,Nnew));
if nargin == 3 
   % Se tiver so 3 parametros de entrada o default é pad zeros
   % copia da matriz f na submatriz g
   g(1+r:Mnew-r , 1+c:Nnew-c) = f;
   
elseif nargin == 4
    % Se tiver 4, o quarto é o padtype
    switch padtype
        case 'zeros'
            % copia da matriz f na submatriz g
            g(1+r:Mnew-r , 1+c:Nnew-c) = f;

        case 'replicate'

            % Replicação nas linhas acima
            for x = 1:r
                g(x,1+c:Nnew-c) = f(1,:);
            end
            % Replicação nas linhas abaixo
            for x = Mnew-r:Mnew
                g(x,1+c:Nnew-c) = f(M,:);
            end
            % Replicação nas colunas à esquerda
            for y = 1:c
                 g(1+r:Mnew-r,y) = f(:,1);
            end
            % Replicação nas colunas à direita
            for y = Nnew-c:Nnew
                 g(1+r:Mnew-r,y) = f(:,M);
            end
            % Preenchimento das submatrizes de quina (cantos)
            g(1:r , 1:c)                = f(1,1); %superior esquerda
            g(Mnew-r:Mnew ,1:c)         = f(M,1); %inferior esquerda
            g(1:r , Nnew-c:Nnew)        = f(1,N); %superior direito
            g(Mnew-r:Mnew ,Nnew-c:Nnew) = f(M,N); %inferior direito

            % copia da matriz f para a submatriz g
            g(1+r:Mnew-r , 1+c:Nnew-c) = f;

        otherwise
            warning('padtype não definido, apenas zeros e replicate');
    
end

end

