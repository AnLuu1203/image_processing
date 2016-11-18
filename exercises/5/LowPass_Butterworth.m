clear; close all; clc;

im = imread('./test.png');
im = rgb2gray(im);
F = fft2(double(im));
F_shift = fftshift(F);
% imshow(F_shift),title('fft');

[P, Q, Di] = size(im);
r0 = 90;
n = 2;
H = zeros(P,Q);

for u = 1:P
    for v = 1:Q
        r_uv = round(sqrt((u - P/2).^2 + (v - Q/2).^2));
        H(u,v) = 1 / (1 + (r_uv/r0).^(2*n));
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