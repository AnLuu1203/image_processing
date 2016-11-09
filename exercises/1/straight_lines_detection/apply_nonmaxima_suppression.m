function accumulator = apply_nonmaxima_suppression(A)
    [M, N] = size(A);
    
    for i = 2:(M - 1) 
        for j = 2:(N - 1)
            NW = A(i - 1, j - 1);
            Na = A(i - 1, j);
            NE = A(i - 1, j + 1);
            E = A(i, j + 1);
            SE = A(i + 1, j + 1);
            S = A(i + 1, j);
            SW = A(i + 1, j - 1);
            W = A(i, j - 1);
            C = A(i, j);
            C1 = (C < NW ) || (C < Na);
            C2 = (C < NE) || (C < E);
            C3 = (C < SE) || (C < S);
            C4 = (C < SW ) || (C < W );
            
            if C1 || C2 || C3 || C4
                A(i, j) = 0;
            end
        end
    end
    accumulator = A;
end