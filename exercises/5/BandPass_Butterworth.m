clear; close all; clc;

im = imread('test.png');
im = rgb2gray(im);
F = fft2(double(im));
F_shift = fftshift(F);

[P, Q, Di] = size(im);
r0 = 230;
n = 2;
w = 40;
H = zeros(P,Q);

for u = 1:P
    for v = 1:Q
        r_uv = round(sqrt((u - P/2).^2 + (v - Q/2).^2));
        H(u,v) = 1 - (1 / (1 + (r_uv*w/(r_uv.^2 - r0.^2)).^(2*n)));
    end
end
out_mul = F_shift .* H;
out_shift = ifftshift(out_mul);
out = ifft2(out_shift);

out = (uint8(abs(out)));
figure, imshow(im), title('input');
figure, imshow(out), title('output butterworth');

figure,mesh(H);
figure,imshow(H);