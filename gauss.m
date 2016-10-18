clear;
close all;
clc;
ep = 15;
matrix = zeros(100, 100);

[C R] = size(matrix);

for c = 1:C
    for r = 1:R
        matrix(c, r) = (1/(2*pi*ep^2))*exp(-((r-R/2)^2 + (c - C/2)^2)/(2*ep^2));
    end
end

matrix = matrix / sum(matrix(:))
surf(matrix);

m_space = fftshift(abs(ifft2(matrix)));

figure, surf(m_space);
