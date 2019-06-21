clear all
close all

%Ler o arquivo
f = imread('images/Fig0918(a)(Chickenfilet with bones).tif');
figure, imshow( f );



%Definir o elemento estruturante
B = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];

%Iniciar um ponto (ou v�rios) pertencente ao buraco preenchido
X = zeros( size( f ) );
X( 128, 189 ) = 1;
X( 151, 169 ) = 1;
X( 157, 190 ) = 1;
X( 80, 261 ) = 1;
X( 192, 353 ) = 1;
X( 197, 263 ) = 1;
X( 272, 345 ) = 1;
X( 45, 402 ) = 1;
X( 232, 397 ) = 1;

%Chamar fun��o para preencher buracos
f = f > 205; %limiarização -> binarização
g = extraction_connected_components( f, B, X );
figure('Name', 'Componentes conexos extraídos');
subplot(2,2,1); imshow(f,[], 'Border','tight'); title('f');
subplot(2,2,2); imshow(B,[], 'Border','tight'); title('B');
subplot(2,2,3); imshow(X,[],'Border','tight');title('X');
subplot(2,2,4); imshow(g,[],'Border','tight');title('g');
