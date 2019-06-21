function h=hsi2rgb(f)
%RGB2HSI Converte imagem RGB em HSI
%   f = imagem RGB #1; g = retorno da funcao

f=im2double(f);

H = f(:,:,1);
S = f(:,:,2);
I = f(:,:,3);

H = 2*pi*H;

r = ones(size(H));
g = ones(size(H));
b = ones(size(H));


p = find(H<=(2*pi/3));

b(p) = (1/3)*(1-S(p));
r(p) = (1/3)*(1+ ((S(p).*cos(H(p)))./cos((pi/3)-H(p))) );
g(p) = 1-(r(p)+b(p));

p=find( (H>(2*pi/3)) & (H<=(4*pi/3)) );

H(p) = H(p)-(2*pi/3);
r(p) = (1./3)*(1-S(p));
g(p) = (1./3)*(1+ ((S(p).*cos(H(p)))./cos((pi/3)-H(p))) );
b(p) = 1-(r(p)+g(p));

p = find( (H>(4*pi/3)) & (H<=(2*pi)) );

H(p) = H(p)-(4*pi/3);
g(p) = (1./3)*(1-S(p));
b(p) = (1./3)*(1+ ((S(p).*cos(H(p)))./cos((pi/3)-H(p))) );
r(p) = 1-(g(p)+b(p));

R = (3*I.*r)*255;
G = (3*I.*g)*255;
B = (3*I.*b)*255;

h = im2double(zeros(size(f)));
h(:,:,1) = R;
h(:,:,2) = G;
h(:,:,3) = B;

h = uint8(h); 
end

