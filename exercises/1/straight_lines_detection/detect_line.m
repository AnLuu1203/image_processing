clear; clc; close all;

im = imread('house_test.png');
im = rgb2gray(im);
%im = checkerboard(100);

lapla = fspecial('laplacian');
im_filter = abs(imfilter(im, lapla));
max_im = max(im_filter(:));

[R, C] = size(im_filter);

% create A table
A = comp_accumulator(im_filter);
A = apply_nonmaxima_suppression(A);

figure, imshow(im), title('input'), hold on;
result = find_maxima(A);
figure, imshow(A), title('output');