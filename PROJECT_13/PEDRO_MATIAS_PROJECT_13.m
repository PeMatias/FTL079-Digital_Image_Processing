% FTL079_DIP_PROJECT_13
% Pedro V D S Matias (pvsm@icomp.ufam.edu.br), 15-06-2019 14:29 
%------------------------------------------------------------------------
close all,clear all clc;
%%
f = imread('Fig0459(a)(orig_chest_xray).tif');
%a imagem original
figure,
imshow(f,[]);title('Imagem original');
%%
Do = 40;
g  = filtro_gaussiano_alto(f,Do);

figure,
imshow(g,[]);title(['Imagem passa alta D_o = ',num2str(Do)]);

% Filtro de enfase
%% 0 e 1
g1 = filtro_enfase(f,Do,0,1);
%% 0.2 e 0.8
g2 = filtro_enfase(f,Do,0.2,0.8);
%% 0.5 e 0.5
g3 = filtro_enfase(f,Do,0.5,0.5);
%% 0.8 e 0.2
g4 = filtro_enfase(f,Do,0.8,0.2); 
%% 1 e 0
g5 = filtro_enfase(f,Do,1,0);


%%
g11 = histEqual4e(g1);
p1 = imagehist4e(g1,'n');
p11 = imagehist4e(g11,'n');
figure;
subplot(2,2,1); imshow(g1,[],'Border','tight'); title('Filtro com enfase D_o = 40 k_1 = 0 k_2 = 1');
subplot(2,2,2); imshow(g11,[],'Border','tight'); title('Imagem equalizada');
subplot(2,2,3);bar(p1,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN');title('Histograma original da imagem filtrada');
subplot(2,2,4);bar(p11,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN'); title('Histograma equalizada');

%%
g22 = histEqual4e(g2);
p2 = imagehist4e(g2,'n');
p22 = imagehist4e(g22,'n');
figure;
subplot(2,2,1); imshow(g2,[],'Border','tight'); title('Filtro com enfase D_o = 40 k_1 = 0.2 k_2 = 0.8');
subplot(2,2,2); imshow(g22,[],'Border','tight'); title('Imagem equalizada');
subplot(2,2,3);bar(p2,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN');title('Histograma original da imagem filtrada');
subplot(2,2,4);bar(p22,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN'); title('Histograma equalizada');

%%

g33 = histEqual4e(g3);
p3 = imagehist4e(g3,'n');
p33 = imagehist4e(g33,'n');
figure;
subplot(2,2,1); imshow(g3,[],'Border','tight'); title('Filtro com enfase D_o = 40 k_1 = 0.5 k_2 = 0.5');
subplot(2,2,2); imshow(g33,[],'Border','tight'); title('Imagem equalizada');
subplot(2,2,3);bar(p3,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN');title('Histograma original da imagem filtrada');
subplot(2,2,4);bar(p33,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN'); title('Histograma equalizada');

%%

g44 = histEqual4e(g4);
p4 = imagehist4e(g4,'n');
p44 = imagehist4e(g44,'n');
figure;
subplot(2,2,1); imshow(g4,[],'Border','tight'); title('Filtro com enfase D_o = 40 k_1 = 0.8 k_2 = 0.2');
subplot(2,2,2); imshow(g44,[],'Border','tight'); title('Imagem equalizada');
subplot(2,2,3);bar(p4,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN');title('Histograma original da imagem filtrada');
subplot(2,2,4);bar(p44,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN'); title('Histograma equalizada');

%%
g55 = histEqual4e(g5);
p5 = imagehist4e(g5,'n');
p55 = imagehist4e(g55,'n');
figure;
subplot(2,2,1); imshow(g5,[],'Border','tight'); title('Filtro com enfase D_o = 40 k_1 = 1 k_2 = 0');
subplot(2,2,2); imshow(g55,[],'Border','tight'); title('Imagem equalizada');
subplot(2,2,3);bar(p5,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN');title('Histograma original da imagem filtrada');
subplot(2,2,4);bar(p55,0.5);ylabel('p(r_k)');xlabel('r_k');legend('n_k/MN'); title('Histograma equalizada');


















