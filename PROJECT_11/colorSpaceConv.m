function g=colorSpaceConv(f, method)
%COLORSPACECONV Converte uma imagem colorida para o modelo designado
%   f = imagem ; method = modelo#2
%   valores possiveis de method= 'rgb2cmy','cmy2rgb','rgb2cmyk' e
%   'cmyk2rgb'
[M,N,F] = size(f);

g = im2double(zeros(M,N,F));
if max(max(f)) > 1
    h  = im2double(f);  % normaliza
else
    h = f;
end

R = 1;G = 2; B = 3;
C = 1;M = 2; Y = 3;
switch lower(method)
    case 'rgb2cmy'
        g(:,:,C) = 1 - h(:,:,R);
        g(:,:,M) = 1 - h(:,:,G);
        g(:,:,Y) = 1 - h(:,:,B);
    case 'rgb2cmyk'
        K =  min( min( h(:,:,R) , h(:,:,G) ) , h(:,:,B));
        g(:,:,C) = ( 1 - h(:,:,R) - K)./(1 - K);
        g(:,:,M) = ( 1 - h(:,:,G) - K)./(1 - K);
        g(:,:,Y) = ( 1 - h(:,:,B) - K)./(1 - K);
        
    case 'cmy2rgb'        
        g(:,:,R) = 1 - h(:,:,C);
        g(:,:,G) = 1 - h(:,:,M);
        g(:,:,B) = 1 - h(:,:,Y);
        g = im2uint8(g);
    case 'cmyk2rgb'
        K = min( min( h(:,:,C) , h(:,:,M) ) , h(:,:,Y));
        g(:,:,R) = (1 - h(:,:,C)).*(1-K);
        g(:,:,G) = (1 - h(:,:,M)).*(1-K);
        g(:,:,B) = (1 - h(:,:,Y)).*(1-K);
        g = im2uint8(g);
       

        
    otherwise
        disp('Metodos desconhecido. Apenas rgb2cmy,cmy2rgb,rgb2cmyk e cmyk2rgb')
end


    

end





% g(:,:,C) = 1 - h(:,:,R);
%         g(:,:,M) = 1 - h(:,:,G);
%         g(:,:,Y) = 1 - h(:,:,B);
%         K = ones(M,N);
%         for x = 1:M
%             for y = 1:N
%                 if g(x,y,C) < K(x,y) % pega os menores valores de cada canal
%                     K(x,y) = g(x,y,C);
%                 end
%                 if g(x,y,M) < K(x,y)
%                     K(x,y) = g(x,y,M);
%                 end
%                 if g(x,y,Y) < K(x,y)
%                     K(x,y) = g(x,y,Y);
%                 end  
%                 g(x,y,C) = (g(x,y,C) - K(x,y))/(1 - K(x,y));
%                 g(x,y,M) = (g(x,y,M) - K(x,y))/(1 - K(x,y));
%                 g(x,y,Y) = (g(x,y,Y) - K(x,y))/(1 - K(x,y));
%             end
%         end