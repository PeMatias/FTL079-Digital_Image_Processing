function h = imagehist4e(f,mode)
%IMAGEHIST4E Histograma de uma imagem em tons de cinza
%   Processa o histograma de uma imagem , f, de 256 niveis de cinza,
%   cujas as intensidades são não-negativas.
%   Se mode='n' o histograma deve ser normalizado
%   Se mode='u' deve ser desnormalizado.
%   f = imagem #1; mode = normalização #2.

% Pegando as dimensões da imagem
[M,N] = size(f);
h = zeros(1,256);

for x = 1:M % Varredura vertical
    for y = 1:N % Varredura horizontal
        % Pega o valor da intensidade do pixel atual
        r = f(x,y)  + 1;
        % Incrementa no bin da intensidade correspondente. Do 1 ate
        % 256
        h(r) = h(r) + 1; 
    end
end
switch mode
    case 'n' % Hist. Normalizado
       
        h = h/(M*N);
%         bar(h,0.5);
%         title('p(r_k) = n_k/MN versus r_k ');
%         ylabel('p(r_k)');
%         xlabel('r_k');
%         legend('n_k/MN');


    case 'u' % Hist. Não Normalizado
       
%         bar(h,0.5);
%         title('h(r_k) = n_k versus r_k ');
%         ylabel('h(r_k)');
%         xlabel('r_k');
%         legend('n_k');

        
    otherwise
        warning('modo não definido, somente Normalized (n) ou unnormalized (u)')
    
end

