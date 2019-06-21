function g = extraction_connected_components(f,B,X)
%EXTRACTION CONNECTED COMPONENTS Extrai compontentes conexos da imagem f
%   Extração de componentes conexos da imagem binaria f, realizando a 
%   dilatação entre o arranjo X e o elemento estruturante B, e a intersecção com a
%   imagem original. A função para quando X_(k+1) = X_(k)
% Entradas:
%   f = imagem binária #1;
%   B = elemento estrurante #2;
%   X = Arranjo matricial com um ponto conhecido de f #3
% Saidas:
%   g = componente conexo

    %f = f > 205; %binarização para f em escala de cinza
    Xk = zeros(size(f)); % Inicializa o arranjo matricial
    compara = ~isequal(X, Xk); % Variavel de estado de comparacao
    while compara % Atual é diferente do proximo
        %%Dilatacao - imdilate realiza dilatações múltiplas, usando cada 
        %             elemento estruturante em SE em sucessão
        dilatedI = imdilate( X, B ); 
        %Intersecao - min retorna uma matriz com os menores (0's)
        %             elementos tirados de X OU B, isto é, os 
        %             maiores(1's) de X E B
        Xk = dilatedI & f;   
        % Atualiza variavel de estado
        compara = ~isequal(X, Xk);
       
%         figure;
%         subplot(2,2,1); imshow(f,[], 'Border','tight'); title('f');
%         subplot(2,2,2); imshow(B,[], 'Border','tight'); title('B');
%         subplot(2,2,3); imshow(X,[],'Border','tight');title('X');
%         subplot(2,2,4); imshow(Xk,[],'Border','tight');title('Xk');
        
        % Atualiza o arranjo anterior
        X = Xk;
    end 
    g = X;
end

