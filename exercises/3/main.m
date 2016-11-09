clear;
close all;

%(120 100)
%(450 100)
%(120 600)
%(450 600)
poster = imread('laptop.jpg');
poster = rgb2gray(poster);
figure, imshow(poster), title('laptop');
impixelinfo;

f_poster = [
    77 32;
    297 29;
    122 208;
    331 160
    ];

im_in = imread('test.jpg');
im_in = rgb2gray(im_in);
figure, imshow(im_in), title('img in');
[R_in, C_in] = size(im_in);

f_in = [
    1 1;
    C_in 1;
    1 R_in;
    C_in R_in
    ];

M = matrix_transform(f_poster, f_in);

im_out = poster;
[R, C] = size(im_in);

for c = 1:C
    for r = 1:R
       P = (M * [c; r; 1]);
       if (P(1) > 0 && P(2) > 0)
           im_out(round(P(2)/P(3)),round(P(1)/P(3))) = im_in(r,c);
       end
    end
end

im_out = uint8(im_out);

figure, imshow(im_out);