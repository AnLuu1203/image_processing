function accumulator = comp_accumulator(Ie)
    [R, C] = size(Ie);
    M = 1000;
    N = ceil(sqrt(R^2 + C^2)) * 2;
    A = zeros(N, M);
    max_im = max(Ie(:));
    
    [x, y] = find(Ie >= max_im * 0.7);
    num_x = size(x);
    num = num_x(1);
    for n = 1:num,
        for j = 1:M,
           theta =  dcm(j, M, -pi, 2 * pi);
           ro = x(n) * cos(theta) + y(n) * sin(theta);
           i = cdm(ro, N, - N / 2, N);
           A(i, j) = A(i, j) + Ie(x(n), y(n));
        end
    end
    accumulator = A;
end