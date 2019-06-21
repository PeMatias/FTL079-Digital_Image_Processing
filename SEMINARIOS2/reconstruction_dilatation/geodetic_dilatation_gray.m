function D = geodetic_dilatation_gray(F,G,B,tam)
%GEODETIC DILATATION Dilatação geodésica de tamanho 'tam' da imagem 
%binaria F em relação a G 
%   É realizada a dilatação entre o marcador,
%   imagem F, (pontos de partida da transf.)
%   e o elemento estruturante B, e a intersecção com a
%   máscara G. A intersecção limita a dilatação.
% Entradas:
%   F = imagem binária - marcador #1;
%   G = imagem binária - máscara  #2;
%   B = elemento estrurante #3;
%   tam = Arranjo matricial com um ponto conhecido de f #3
% Saidas:
%   D = imagem resultante

D = zeros(size(F));
if tam == 0
    D = F;
elseif tam == 1
    % Dilatação da imagem com elemento estruturante
    D = imdilate(F,B);
    %imshow(D);
    % Interseccao da imagem dilatada com a máscara
    D = min(D,G);
else
    D = geodetic_dilatation_gray(geodetic_dilatation_gray(F,G,B,tam-1),G,B,1);
end

end

