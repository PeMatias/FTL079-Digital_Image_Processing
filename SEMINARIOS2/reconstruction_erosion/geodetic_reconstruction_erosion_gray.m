function [Re,k] = geodetic_reconstruction_erosion_gray(F,G,B)
%GEODETIC RECONSTRUCTION EROSION Reconstrução por erosão geodésica
% F em relação a G 
%   É realizada a erosão até estabilizar entre o marcador,
%   imagem F, (pontos de partida da transf.)
%   e o elemento estruturante B, e a intersecção com a
%   máscara G. A união libera a erosão.
% Entradas:
%   F = imagem - marcador #1;
%   G = imagem - máscara  #2;
%   B = elemento estrurante #3;
% Saidas:
%   Re = imagem resultante reconstruída
%   k  = iterações realizadas
k = 0;
compara = 1;  % Inicializa
Ek = geodetic_erosion_gray(F,G,B,0);
while compara
    k = k+1;
    E = Ek;
    Ek= geodetic_erosion_gray(F,G,B,k);
    compara = ~isequal(E,Ek); % verifica se são diferentes
%     figure;
%     subplot(1,2,1); imshow(E,[], 'Border','tight'); title('E');
%     subplot(1,2,2); imshow(Ek,[], 'Border','tight'); title('E_k');
end
Re = Ek;
end