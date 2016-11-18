clc;
clear all;
close all;

%im = imread('test.png');
%im = rgb2gray(im);
im = checkerboard(100);
%im = rgb2gray(im);

H_sobel = fspecial('sobel');
H_lap = fspecial('laplacian');

im_sobel = imfilter(double(255*im), H_sobel);
im_lap = imfilter(double(255*im), H_lap);


imshow(im), title('input');
figure,imshow(im_sobel), title('Sobel');
figure,imshow(im_lap), title('Laplacian');