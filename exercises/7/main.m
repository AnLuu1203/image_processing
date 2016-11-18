close all;
clear;

Hx = [
    -1 0 1;
    -1 0 1;
    -1 0 1
    ];

H_lap = [
    -1 -1 -1;
    -1 8 -1;
    -1 -1 -1
    ];

%im = imread('test.jpg');
%im = rgb2gray(im);
im = checkerboard(100);

im_filter_1 = imfilter(im, Hx);
im_filter_2 = imfilter(im, H_lap);

figure, imshow(im), title('in');
figure, imshow(im_filter_1), title('1');
figure, imshow(im_filter_2), title('2');