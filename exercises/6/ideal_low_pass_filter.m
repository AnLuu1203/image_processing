function result = ideal_low_pass_filter(radius, row, col)
    H = ones(row, col);

    [R C] = size(H);
    LEFT = - round(C/2, 0);
    RIGHT = LEFT + C - 1;
    TOP = - round(R/2, 0);
    BOTTOM = TOP + R - 1;
    RADIUS = radius;

    [x, y] = meshgrid(LEFT:RIGHT, TOP:BOTTOM);
    z = x.*x + y.*y;

    mask = z < RADIUS * RADIUS;
    mask = double(mask);
    mask_shift = fftshift(mask);

    % figure, surf(mask);
    % figure, surf(mask_shift);

    result = mask;
    %surf(fftshift(abs(ifft2(mask_shift))));

    %high_mask = abs(double(mask) - 1)
    %high_mask_space = fftshift(abs(ifft2(high_mask)))
    %surf(high_mask_space)
end