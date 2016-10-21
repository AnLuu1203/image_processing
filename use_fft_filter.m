close all;
clear;

im = imread('test2.png');
im = rgb2gray(im);

[R, C] = size(im);
LEFT = - round(C/2, 0);
RIGHT = LEFT + C - 1;
TOP = - round(R/2, 0);
BOTTOM = TOP + R - 1;
RADIUS = 100;

[x, y] = meshgrid(LEFT:RIGHT, TOP:BOTTOM);
z = x.*x + y.*y;

% Ideal Low Pass Filter (ILPF)
mask_low = z < RADIUS * RADIUS;

% Ideal High Pass Filter (ILPF)
mask_high = z > RADIUS * RADIUS;

% Gaussian Low Pass Filter (GLPF)
mask_gaussian_low = zeros(R, C);
[C, R] = size(mask_gaussian_low);
for c = 1:C
    for r = 1:R
        r0 = sqrt((c - C/2)^2 + (r - R/2)^2);
        mask_gaussian_low(c, r) = exp((-r0^2)/(2*RADIUS^2));
    end
end

H_low = double(mask_low);
H_high = double(mask_high);
H_gaussian_low = double(mask_gaussian_low);

f = im;
F = fft2(f);
F = (fftshift(F));

G_low = F.*H_low;
G_low = fftshift(G_low);
g_low = ifft2(G_low);

G_high = F.*H_high;
G_high = fftshift(G_high);
g_high = ifft2(G_high);

G_gaussian_low = F.*H_gaussian_low;
G_gaussian_low = fftshift(G_gaussian_low);
g_gaussian_low = ifft2(G_gaussian_low);


figure, imshow(im), title('input');
figure, imshow(uint8(abs(g_low))), title('low');
figure, imshow(uint8(abs(g_high))), title('high');
figure, imshow(uint8(abs(g_gaussian_low))), title('gaussian low');