clear;
close all;


%(120 190) - (0 0)
%(1400 220) - (1300 0)
%(130 1120) - (0 1000)
%(1320 1150) - (1300 1000)

im_in = imread('geometric.png');
im_in = rgb2gray(im_in);
figure, imshow(im_in);
impixelinfo;

A = [
    120 190 1 0 0 0 0 0;
    0 0 0 120 190 1 0 0;
    1400 220 1 0 0 0 1400*1300 1300*220;
    0 0 0 1400 220 1 0 0;
    130 1120 1 0 0 0 0 0;
    0 0 0 130 1120 1 130*1000 1120*1000;
    1320 1150 1 0 0 0 1320*1300 1150*1300;
    0 0 0 1320 1150 1 1320*1000 1150*1000
    ];

b = [0 0 1300 0 0 1000 1300 1000];
b = b';

h = A\b;
M = ones(3,3);

for i = 1:8
    x = floor((i-1) / 3) + 1;
    y = mod(i -1, 3) + 1;
    M(x,y) = h(i);
end

im_out = zeros(1000, 1300);

[R, C] = size(im_in);

for c = 1:C
    for r = 1:R
       P = round(M * [c; r; 1]);
       if (P(1) > 0 && P(2) > 0)
           im_out(P(2),P(1)) = im_in(r,c);
       end
    end
end

im_out = uint8(im_out);

figure, imshow(im_out);