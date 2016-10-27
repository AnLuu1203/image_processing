clear;
close all;

%(120 100)
%(450 100)
%(120 600)
%(450 600)
poster = imread('poster.jpg');
poster = rgb2gray(poster);
figure, imshow(poster), title('poster');
impixelinfo;

f_poster = [
    120 100;
    450 100;
    120 600;
    450 700
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


A = [
    f_in(1,1) f_in(1,2) 1 0 0 0 -f_in(1,1)*f_poster(1,1) -f_in(1,2)*f_poster(1,1);
    0 0 0 f_in(1,1) f_in(1,2) 1 -f_in(1,1)*f_poster(1,2) -f_in(1,2)*f_poster(1,2);
    f_in(2,1) f_in(2,2) 1 0 0 0 -f_in(2,1)*f_poster(2,1) -f_in(2,2)*f_poster(2,1);
    0 0 0 f_in(2,1) f_in(2,2) 1 -f_in(2,1)*f_poster(2,2) -f_in(2,2)*f_poster(2,2);
    f_in(3,1) f_in(3,2) 1 0 0 0 -f_in(3,1)*f_poster(3,1) -f_in(3,2)*f_poster(3,1);
    0 0 0 f_in(3,1) f_in(3,2) 1 -f_in(3,1)*f_poster(3,2) -f_in(3,2)*f_poster(3,2);
    f_in(4,1) f_in(4,2) 1 0 0 0 -f_in(4,1)*f_poster(4,1) -f_in(4,2)*f_poster(4,1);
    0 0 0 f_in(4,1) f_in(4,2) 1 -f_in(4,1)*f_poster(4,2) -f_in(4,2)*f_poster(4,2)
    ];

b = [
    f_poster(1,1);
    f_poster(1,2);
    f_poster(2,1);
    f_poster(2,2);
    f_poster(3,1);
    f_poster(3,2);
    f_poster(4,1);
    f_poster(4,2)
   ]

h = A\b;
M = ones(3,3);

for i = 1:8
    x = floor((i-1) / 3) + 1;
    y = mod(i -1, 3) + 1;
    M(x,y) = h(i);
end


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