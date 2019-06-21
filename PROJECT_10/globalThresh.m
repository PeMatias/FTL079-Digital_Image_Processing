function g = globalThresh(f, delT)
%GLOBATRHESH Segmentação baseada em limiar
%    f = imagem #1; delT = erro#2.
[M,N] = size(f);
g = zeros(M,N);
h = im2double(f);
% Estimando valor inicial
x1 = min(min(h));
x2 = max(max(h));
G1 = []; G2 = [];
iteracao = 1;
disp(nargin);
if nargin == 1
   % Se tiver so 1 parametro de entrada o default é delT=0,01
   
   delT = 0.01;
   %T_prox  = randsample(x1:delT:x2, 1);
   T_prox = mean(mean(h));
   T = 0;
   while(abs(T_prox - T) >= delT )
       T = T_prox;
       disp(T)
       g = h > T;
       for x = 1:M
           for y = 1:N
               if(g(x,y) == 1)
                   G1(end+1) = h(x,y);
               else
                   G2(end+1) = h(x,y);
               end
           end
       end
       T_prox = 0.5*(mean(G1) + mean(G2));
       iteracao = iteracao+1;
   end
                    
else
   %T_prox  = randsample(x1:delT:x2, 1);
   T_prox = mean(mean(h));
   T = 0;
   while(abs(T_prox - T) >= delT )
       T = T_prox;
       disp(T)
       g = h > T;
       for x = 1:M
           for y = 1:N
               if(g(x,y) == 1)
                   G1(end+1) = h(x,y);
               else
                   G2(end+1) = h(x,y);
               end
           end
       end
       T_prox = 0.5*(mean(G1) + mean(G2));
       iteracao = iteracao+1;
   end
end

disp(T);
disp(iteracao);
end

