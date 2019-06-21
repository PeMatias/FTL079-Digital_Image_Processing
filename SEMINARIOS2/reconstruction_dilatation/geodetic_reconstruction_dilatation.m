function [Rd,k] = geodetic_reconstruction_dilatation(F,G,B)
%GEODETIC RECONSTRUCTION DILATATION Reconstrução por dilatação geodésica
%binaria F em relação a G 
%   É realizada a dilatação até estabilizar, entre o marcador,
%   imagem F, (pontos de partida da transf.)
%   e o elemento estruturante B, e a intersecção com a
%   máscara G. A intersecção limita a dilatação.
% Entradas:
%   F = imagem binária - marcador #1;
%   G = imagem binária - máscara  #2;
%   B = elemento estrurante #3;
% Saidas:
%   R = imagem resultante
%   k = iterações realizadas


k = 0;
compara = 1;  % Inicializa
Dk = geodetic_dilatation_gray(F,G,B,0);
while compara
    k = k+1;
    D = Dk;
    Dk= geodetic_dilatation_gray(F,G,B,k);
    compara = ~isequal(D,Dk); % verifica se são diferentes
%    figure;
%     subplot(1,2,1); imshow(D,[], 'Border','tight'); title('D');
%     subplot(1,2,2); imshow(Dk,[], 'Border','tight'); title('D_k');
end
Rd = Dk;
end

