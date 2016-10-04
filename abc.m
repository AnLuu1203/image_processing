clear;
close all;
clc;

im = imread('test2.png');
im = rgb2gray(im);

H = 1/ 9.0 * ones(3,3);
im_blur = abs(imfilter(double(im), H));
% im_blur = uint8(im_blur);
 
H2 = [1 1 1; 1 -8 1; 1 1 1];
im_out = (imfilter(double(im_blur), H2));
im_out = uint8(im_out);
% im = uint8(255* checkerboard(100));
% Hx1 = [-1 0 1];
% Hy1 = [-1; 0; 1];
% H = [-1 2 -1];
% 
% Hb = fspecial('average', 11);
% 
% im_blur = imfilter(im, Hb);
% 
% H2nd = [-1 2 -1];
% 
% I2nd = imfilter(double(im_blur), H2nd);
% 
% I1 = imfilter(double(im), Hy1);
% I2 = imfilter(double(im), H);
% 
% g = sqrt(I1.*I1 + I2.*I2);
% im_out = 2 * double(im) - double(im_blur);

figure, imshow(im), title('in');
figure, imshow((im_out)), title('out');