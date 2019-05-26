function [mew, U, F] = pca(f)
    mew = double.empty;
    U = double.empty;
    F = double.empty;
    [m, n] = size(f);
    for i = 1:1600:n
       Xj = f(1:m, i:i+1599);
       mew = [mew mean(Xj')'];
       A = Xj - mew(int16(i / 1600) + 1);
       [Uj, Sj] = eigs(((A * A') / 1600), 29);
       U = [U Uj];
       F = [F (Uj' * Xj)];
    end
end

