function result = band_reject_filter(RADIUS, radius)
    H = ones(100, 100);

    [R C] = size(H);
    LEFT = - round(C/2, 0);
    RIGHT = LEFT + C - 1;
    TOP = - round(R/2, 0);
    BOTTOM = TOP + R - 1;

    [x, y] = meshgrid(LEFT:RIGHT, TOP:BOTTOM);
    z = x.*x + y.*y;

    mask_R = z > RADIUS * RADIUS;
    mask_r = z < radius * radius;
    mask = mask_R | mask_r;
    mask = double(mask);
    mask_shift = fftshift(mask);

    figure, surf(mask);
    % figure, surf(mask_shift);

    result = mask;
end

