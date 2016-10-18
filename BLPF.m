clear;
close all;
clc;
n = 2;
r0 = 10;
matrix = zeros(100, 100);

[C R] = size(matrix);

for c = 1:C
    for r = 1:R
        ra = sqrt((c - C/2)^2 + (r - R/2)^2);
        matrix(c, r) = 1 / (1 + (ra/r0)^(2*n));
    end
end

%matrix = matrix / sum(matrix(:))
surf((matrix));
