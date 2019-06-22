function g = filtro_enfase(f,Do,k1,k2)
%FILTRO_ENFASE Realiza a filtragem no dominio da frequencia
%   Aplica um filtro gaussiano, com combinação de k1 e k2, passa-alta e com Do
%   f = imagem a ser filtrada #1, D0= #2, k1=#3,k2=#4
[M,N] = size(f);

M_new =2*M;
N_new =2*N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% computa as coordenadas usadas em filtros centradas em (M/2,N/2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fixando vetores de coordenadas
u = 0:(M_new - 1);
v = 0:(N_new - 1);

% centralizando os vetores de coordenadas
u = u - M_new/2;
v = v - N_new/2;

% calculo do array meshgrid

%No nosso caso: 
[U,V] = meshgrid(v,u);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calcula o filtro Gaussiano
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcula as distancias D(U,V)
D = sqrt(U.^2 + V.^2);
% Deteminacao do filtro H(u,v)
H = exp( -(D.^2)./(2*(Do^2)) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PRE- PROCESSAMENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Multiplicar a imagem por (-1)x+y (objetivo: centralizar o espectro de freqüência) e realizar o padding

f_new = im2double(zeros(M_new,N_new));
% padding
for x = 1:M
    for y = 1:N
        f_new(x,y) = f(x,y);
    end
end
%deslocamento da imagem 
for x=1:M
    for y=1:N
        k=x+y;
        f_new(x,y)=f_new(x,y).*((-1)^k);
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FILTRAGEM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Transformada de Fourier
F = fft2(f_new);

% g = G^-1 -> G(u,v) = F(u,v)*H(u,v)
H1 = 1 - H; %passa-alta
%disp(H1);
H_new = (k1 + k2*H1);
%disp(H_new);
g_hf = real(ifft2(H_new.*F));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% POS-PROCESSAMENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% crop  para o tamanho original

g = g_hf(1:M,1:N);


% compensar o deslocamento de espectro
for x=1:M
    for y=1:N
        k=x+y;
        g(x,y)=g(x,y).*((-1)^k);
    end
end

g = mat2gray(g);
g = im2uint8(g);
end

