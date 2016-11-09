close all;
clear;

R_max = 200;
R_min = 150;

im = imread('circle.gif');
H = fspecial('laplacian');
im_filter = abs(imfilter(im, H));

A = create_accumulator(im_filter);
figure, imshow(im);
figure, imshow(im_filter), hold on;

[max, index] = Max3d(A);

y = index(1);
x = index(2);
r = index(3);
ang=0:0.01:2*pi; 
r = R_max - r(1);
yp=r*cos(ang);
xp=r*sin(ang);
plot(x(1)+xp,y(1)+yp, 'Color', 'red');

