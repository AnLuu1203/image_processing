clear all;
close all;

H = ones(100, 100);

[R C CH] = size(H);
LEFT = - round(C/2, 0);
RIGHT = LEFT + C - 1;
TOP = - round(R/2, 0);
BOTTOM = TOP + R - 1;
RADIUS = 50;

[x, y] = meshgrid(LEFT:RIGHT, TOP:BOTTOM);
z = x.*x + y.*y;

masko = z < RADIUS * RADIUS;
masko = double(masko);
mask_shift = fftshift(masko);

%figure, surf(mask);
%figure, surf(mask_shift);
%surf(fftshift(abs(ifft2(mask_shift))));

%high_mask = abs(double(mask) - 1)
%high_mask_space = fftshift(abs(ifft2(high_mask)))
%surf(high_mask_space)

