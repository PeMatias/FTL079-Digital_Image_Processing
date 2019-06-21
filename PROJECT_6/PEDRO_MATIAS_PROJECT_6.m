%% TESTE DE EQUALIZAÇÃO DE HISTOGRAMA

% Lendo as imagemns de teste
f1 = imread('hidden-horse.tif');
f2 = imread('spillway-dark.tif');

% Equalização
g1 = histEqual4e(f1);
g2 = histEqual4e(f2);

% Histogramas normalizados
p11 = imagehist4e(f1,'n');
p21 = imagehist4e(f2,'n');
p12 = imagehist4e(g1,'n');
p22 = imagehist4e(g2,'n');

%
figure;
subplot(2,2,1); imshow(f1,[],'Border','tight'); title('Imagem original - hidden-horse.tif');
subplot(2,2,2); imshow(g1,[],'Border','tight'); title('Imagem equalizada - hidden-horse.tif');
subplot(2,2,3);bar(p11,0.5);ylabel('p(r_k)');xlabel('r_k');
        legend('n_k/MN');title('Histograma original - hidden-horse.tif');
        
subplot(2,2,4); bar(p12,0.5);
        title('p(r_k) = n_k versus r_k ');ylabel('p(r_k)');xlabel('r_k');
        legend('n_k/MN'); title('Histograma equalizada - hidden-horse.tif');



figure;
subplot(2,2,1); imshow(f2,[], 'Border','tight'); title('Imagem original - spillway-dark.tif');
subplot(2,2,2); imshow(g2,[], 'Border','tight'); title('Imagem equalizada - spillway-dark.tif');
subplot(2,2,3); bar(p21,0.5);
        title('p(r_k) = n_k versus r_k ');ylabel('p(r_k)');xlabel('r_k');
        legend('n_k/MN'); title('Histograma original - spillway-dark.tif');
        
subplot(2,2,4);  bar(p22,0.5);
        title('p(r_k) = n_k versus r_k ');ylabel('p(r_k)');xlabel('r_k');
        legend('n_k/MN'); title('Histograma equalizada - spillway-dark.tif');
        
%  Analisando os resultados pelas imagens 1 e 2 concluímos que os resultados
%  foram satisfatórios, como equalização é apenas uma ferramenta para aumento
%  do contraste nenhuma intensidade foi criada no processo, também os 
%  histogramas obtidos não perfeitamente uniformes.
%  Contudo o resultado permitiu notar significativos detalhes, 
%  demonstrando que essa técnica é útil para o realce do contraste 


