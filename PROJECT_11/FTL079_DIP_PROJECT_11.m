% FTL079_DIP_PROJECT_11
% Pedro V D S Matias (pvsm@icomp.ufam.edu.br), 15-06-2019 12:29 
%-------------------------------------------------------------------------

close all,clear all clc;

f = imread('sunflower.tif');
g1 = colorSpaceConv(f,'rgb2cmy');
g2 = colorSpaceConv(f,'rgb2cmyk');
g3 = colorSpaceConv(g1,'cmy2rgb');
g4 = colorSpaceConv(g1,'cmyk2rgb');


figure;
imshow(f,[])
figure;
subplot(2,2,1); imshow(g1,[],'Border','tight');    title('RGB -> CMY');
subplot(2,2,2); imshow(g2, [],'Border','tight');  title('RGB -> CMYK');
subplot(2,2,3); imshow(g3,[],'Border','tight');    title('CMY -> RGB');
subplot(2,2,4); imshow(g4, [],'Border','tight');  title('CMYK -> RGB');