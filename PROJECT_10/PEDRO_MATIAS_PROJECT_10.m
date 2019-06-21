% FTL079_DIP_PROJECT_10
% Pedro V D S Matias (pvsm@icomp.ufam.edu.br), 15-06-2019 12:29 
%-------------------------------------------------------------------------

close all,clear all clc;


[f,cmap] = imread('rice-shaded.tif');

g1 = globalThresh(f);

figure;
subplot(1,2,1); imshow(f,[],'Border','tight');    title('imagem original');
subplot(1,2,2); imshow(g1, [],'Border','tight');  title('imagem segmentada delT = 0.01');



g2 = globalThresh(f,0.05);

figure;
subplot(1,2,1); imshow(f,[],'Border','tight');    title('imagem original');
subplot(1,2,2); imshow(g2, [],'Border','tight');  title('imagem segmentada delT = 0.05');

figure;
imshow(g1-g2,[]);title('diferença entre delt = 0.001 delT = 0.05');