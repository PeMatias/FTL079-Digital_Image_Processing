function E = geodetic_erosion_gray(F,G,B,tam)
%GEODETIC EROSION Erosão geodésica de tamanho 'tam' da imagem 
%binaria F em relação a G 
%   É realizada a erosao entre o marcador,
%   imagem F, (pontos de partida da transf.)
%   e o elemento estruturante B, e a união com a
%   máscara G. A intersecção limita a dilatação.
% Entradas:
%   F = imagem binária - marcador #1;
%   G = imagem binária - máscara  #2;
%   B = elemento estrurante #3;
%   tam = Arranjo matricial com um ponto conhecido de f #3
% Saidas:
%   E = imagem resultante

if tam == 0
    E = F;
elseif tam == 1
    % Dilatação da imagem com elemento estruturante
    E = imerode(F,B);
    % União da imagem erodida com a máscara
    E = max(E,G);
else
    E = geodetic_erosion_gray(geodetic_erosion_gray(F,G,B,tam-1),G,B,1);
end

end

