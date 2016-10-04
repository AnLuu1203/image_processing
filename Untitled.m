close all;
clear;
clc;

Ia = uint8(255* checkerboard(10));
im = imread('test.jpg');
im = rgb2gray(im);

H1 = (1 / (9)) * ones(3, 3);
H2 = [
    -1 0 1;
    -2 0 2;
    -1 0 1];

im_out = uint8(abs(xcorr2(im, H1)));
% im_out = uint8(abx(imfilter(im, H2)));

Ib = uint8(xcorr2(Ia, H1));

figure, imshow(im), title('in');
figure, imshow(im_out), title('out');
im_out(1,1) = 3434;

% figure, imshow(Ia), title('in');
% figure, imshow(Ib), title('out');