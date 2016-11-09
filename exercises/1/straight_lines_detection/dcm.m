function result = dcm(index, N, min, L)
    delta = L / N;
    result = min + index * delta + delta / 2;
end