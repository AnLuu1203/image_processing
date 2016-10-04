clear;
close all;
clc;
im = imread('test.jpg');
im = rgb2gray(im);

H = imhist(im);

C = zeros(1,256);
C(1) = H(1);
for i = 2:1:256,
    C(i) = C(i - 1) + H(i);
end;

g = zeros(size(im));
for r = 1:1:size(im, 1),
    for c = 1:1:size(im, 2),
        value = im(r,c);
        g(r, c) = 256 * (C(value + 1) / (size(im, 1) * size(im, 2)));
    end;
end;

g = uint8(g);
Hg = imhist(g);
Cg = zeros(1, 256);
Cg(1) = Hg(1);
for i = 2:1:256,
    Cg(i) = Cg(i - 1) + Hg(i);
end;

figure, imshow(im), title('input image');
figure, imshow(g), title('Processed Image');

figure, plot(C), title('Hist input');
figure, plot(Cg), title('Hist output');