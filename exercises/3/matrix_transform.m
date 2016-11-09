function result = matrix_transform(f_out, f_in)

    A = [
        f_in(1,1) f_in(1,2) 1 0 0 0 -f_in(1,1)*f_out(1,1) -f_in(1,2)*f_out(1,1);
        0 0 0 f_in(1,1) f_in(1,2) 1 -f_in(1,1)*f_out(1,2) -f_in(1,2)*f_out(1,2);
        f_in(2,1) f_in(2,2) 1 0 0 0 -f_in(2,1)*f_out(2,1) -f_in(2,2)*f_out(2,1);
        0 0 0 f_in(2,1) f_in(2,2) 1 -f_in(2,1)*f_out(2,2) -f_in(2,2)*f_out(2,2);
        f_in(3,1) f_in(3,2) 1 0 0 0 -f_in(3,1)*f_out(3,1) -f_in(3,2)*f_out(3,1);
        0 0 0 f_in(3,1) f_in(3,2) 1 -f_in(3,1)*f_out(3,2) -f_in(3,2)*f_out(3,2);
        f_in(4,1) f_in(4,2) 1 0 0 0 -f_in(4,1)*f_out(4,1) -f_in(4,2)*f_out(4,1);
        0 0 0 f_in(4,1) f_in(4,2) 1 -f_in(4,1)*f_out(4,2) -f_in(4,2)*f_out(4,2)
        ];

    b = [
        f_out(1,1);
        f_out(1,2);
        f_out(2,1);
        f_out(2,2);
        f_out(3,1);
        f_out(3,2);
        f_out(4,1);
        f_out(4,2)
       ];

    h = A\b;
    M = ones(3,3);

    for i = 1:8
        x = floor((i-1) / 3) + 1;
        y = mod(i -1, 3) + 1;
        M(x,y) = h(i);
    end
    
    result = M;

end