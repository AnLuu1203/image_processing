function result = find_maxima(A)
    [M, N] = size(A);
    k = 1;
    [Max, index] = max(A(:));
    [x, y] = ind2sub(size(A),index);
    ro = dcm(x(k), M, -M/2, M);
    theta = dcm(y(k), N, -pi, 2*pi);
    a = -cos(theta)/ sin(theta);
    b = ro / sin(theta);
    X = 1:1:1000;
    Y = a*X + b;
    plot(X, Y, 'Color', 'red');
    A(x(k), y(k)) = 0;
    result = A;
end