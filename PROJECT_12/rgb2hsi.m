function g = rgb2hsi(f)
%RGB2HSI Converte imagem RGB em HSI
%   f = imagem RGB #1; g = retorno da funcao

% Normalizando a imagem
f = im2double(f);
% Extraindos as 3 componentes de cor
R=f(:,:,1); G=f(:,:,2); B=f(:,:,3);

%Matriz intesidade
I = (R+G+B)/3;  
p = find(I>0);

%Saturacao
S = zeros(size(I));

S(p) = 1 - ( 3.*min(min( R(p),G(p)),B(p) ) ./ ( R(p)+G(p)+B(p) )  );

%Hue
H = zeros(size(I));

H(p) = acos( (1/2).*((R(p)-G(p))+(R(p)-B(p))) ./ sqrt(((R(p)-G(p)).^2)+((R(p)-B(p)).*(G(p)-B(p)))) );  % calculo da matiz ("hue")

p1 = find(I);
p2 = find( (B(p1)./I(p1)) > (G(p1)./I(p1)) );

H(p2) = (2*pi)-H(p2);

% Normalizando o range
H = H./max(max(H));
S = S./max(max(S));
I = I./max(max(I));


g = zeros(size(f));
g(:,:,1)=H;
g(:,:,2)=S;
g(:,:,3)=I;
 


end

