function result = cdm(input, N, min, L)
    delta = L / N;
    result = round((input - min) / delta);
end