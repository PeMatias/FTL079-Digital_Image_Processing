function g = imagescaling(f,cx,cy)
%IMAGESCALING Função de redimensionameno (reescalonameno)
%   Reescalonameno de imagens em escala de cinza - shrinking e zooming-
%   nas direções entre x, y de acordo com os fatores positivos cx e cy.
%   f=imagem em escala de cinza #1;
%   cx=fator vertical #2;
%   cy=fator horizontal #3

if  cx > 0 && cy > 0 
  % Pega as dimensões da imagem
  [M,N] = size(f);
  % Nova dimensão
  M_new = round(M*cx);
  N_new = round(N*cy);
  % Cria o prototipo da imagem com uma matriz escalonada,com pixel de 1byte
  g = im2uint8(zeros(M_new,N_new));
  
  % Mapeamento inverso fe(x) -> fe(x_new)
  % x = M - ( (M-1)*(M_new - x_new) )/ (M_new - 1);
  x_new = 1:M_new;
  y_new = 1:N_new;
  % Mapa das coordenadas do escalonamento
  Fe_x = [x_new ; M - ( (M-1)*(M_new - x_new) )/ (M_new - 1)]';
  Fe_y = [y_new ; N - ( (N-1)*(N_new - y_new) )/ (N_new - 1)]';
  %disp(Fe_x);disp(Fe_y);
  
  % dx e dy foram obtidos pelo mapeamento das coordenadas da matriz 
  % escalonada (x_new, y_new) em coordenadas (x,y) na matriz original
  %dx = Fe_x(:,2); % fe(x_new)
  %dy = Fe_y(:,2); % fe(y_new)
  f(1,N+1) = 0; % padding na imagem fornecida com zero na ultima coluna
  f(M+1,1) = 0; % padding na imagem fornecida com zero na ultima linha
  
  for w = 1:M_new % varredura na linha da nova matriz
      x = round(Fe_x(w,2)); % valor inteiro arrendondado do obtido pelo mapeamento 
      dx = abs(x- Fe_x(w,2)); % distancia entre os pontos da coordenada antiga com a nova
      
      for z =1:N_new % varredura nas colunas da nova matriz
          y = round(Fe_y(z,2));% valor inteiro arrendondado do obtido pelo mapeamento 
          dy = abs(Fe_y(z,2) - y);
          % Passos
          % interpolação  linear ao  longo da  linha  do  topo  para  obter  o valor  de f(xi,y)
          % interpolação linear ao longo da linha debaixo para obter o valor de f(xi+1, y)
          % interpolar ao longo da coluna y entre esses dois novos valores para obter o valor de f(x,y)
          % valores dos novos pixels serão os valores obtidos arredondados, pois as intensidades são valores inteiros
          g(w,z) = round( (1-dx)*(1-dy)*f(x,y) + dx*(1-dy)*f(x+1,y) + (1-dx)*dy*f(x,y+1) + dx*dy*f(x+1,y+1) );
      end
  end
 
          
      
else
    error('Os fatores devem ser positivos');

end

