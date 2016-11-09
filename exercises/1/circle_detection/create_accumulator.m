function result = create_accumulator( Ie )
    
    [R, C] = size(Ie);
    R_max = 200;
    R_min = 150;
    A = zeros(R, C, R_max - R_min);
    
    max_im = max(Ie(:));
    
    [x, y] = find(Ie >= max_im *0.9);
    num_x = size(x);
    num = num_x(1);
    
    for n = 1:num
        for xc = 1:R
            for yc = 1:C
                r = sqrt((xc - x(n))*(xc - x(n)) + (yc - y(n))*(yc - y(n)));
                if r > R_min && r < R_max
                    index_r = (R_max - r);
                    A(xc, yc, ceil(index_r)) = A(xc, yc, ceil(index_r)) + 1;
                end
            end
        end
    end
    
    result = A;

end

