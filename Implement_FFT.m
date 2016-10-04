clear;
close all;
clc;
im = imread('test.jpg');
im = rgb2gray(im);
%fft1_1d = fft()
%power(2,ceil(log2(size(im,2))))
fft1_1D = fft(im,power(2,ceil(log2(size(im,1)))),1);
fft2_1D = (fft(fft1_1D',power(2,ceil(log2(size(im,2)))),1))';
fft2D = fft2(im, power(2,ceil(log2(size(im,1)))), power(2,ceil(log2(size(im,2)))));
fftresult = -fft2D+fft2_1D;
fftresult = power(fftresult,10);
%r = size(im
figure, imshow(im), title('input image im');
%figure, imshow(fftresult), title('input image im result');
figure, imshow(fft1_1D), title('output image tff1');
figure, imshow(fft2D), title('output image tff2D');
%%%%%%%%%%%%%%%%%%%%%%%%%%%Bai tap 2%%%%%%%%%%%%%%%%%%%%%%%%%%%

exp_mark = zeros(power(2,ceil(log2(size(im,1)))),power(2,ceil(log2(size(im,1)))));
for r = 1:power(2,ceil(log2(size(im,1)))),
    for c = 1:power(2,ceil(log2(size(im,1)))),
        alpha = 2*pi/power(2,ceil(log2(size(im,1))))*(r-1)*(c-1);
        exp_mark(r,c) = cos(alpha)+1i*sin(alpha);
    end;
end;

padding = zeros(power(2,ceil(log2(size(im,1)))), size(im,2));
for r = 1:1:size(im, 1),
    for c = 1:1:size(im, 2),
        padding(r, c) = im(r, c);
    end;
end;

resulCheck1 = (exp_mark*padding);

exp_mark2 = zeros(power(2,ceil(log2(size(resulCheck1,2)))),power(2,ceil(log2(size(resulCheck1,2)))));
for r = 1:power(2,ceil(log2(size(resulCheck1,2)))),
    for c = 1:power(2,ceil(log2(size(resulCheck1,2)))),
        alpha = 2*pi/power(2,ceil(log2(size(resulCheck1,2))))*(r-1)*(c-1);
        exp_mark(r,c) = cos(alpha)+1i*sin(alpha);
    end;
end;

padding = zeros(power(2,ceil(log2(size(im,1)))), power(2,ceil(log2(size(im,2)))));
for r = 1:1:size(resulCheck1, 1),
    for c = 1:1:size(resulCheck1, 2),
        padding(r, c) = resulCheck1(r, c);
    end;
end;

resulCheck2 = (padding*exp_mark');

figure, imshow(resulCheck1), title('check dft');
figure, imshow(resulCheck2), title('check dft2');
%figure, imshow(resulCheck2), title('check dft 2');