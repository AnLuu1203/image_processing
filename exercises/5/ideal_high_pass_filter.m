function result = ideal_high_pass_filter(radius)
    H = ones(100, 100);

    [R C] = size(H);
    LEFT = - round(C/2, 0);
    RIGHT = LEFT + C - 1;
    TOP = - round(R/2, 0);
    BOTTOM = TOP + R - 1;
    RADIUS = radius;

    [x, y] = meshgrid(LEFT:RIGHT, TOP:BOTTOM);
    z = x.*x + y.*y;

    mask = z > RADIUS * RADIUS;
    mask = double(mask);
    mask_shift = fftshift(mask);

    figure, surf(mask);
    % figure, surf(mask_shift);

    result = mask;
end

