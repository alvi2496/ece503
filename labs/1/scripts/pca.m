function [mew, U] = pca(f)
    mew = double.empty;
    U = double.empty;
    chunk = 1600;
    for i = 1:chunk:16000
       Xj = f(:, i:i+chunk-1);
       mew = [mew mean((Xj'))'];
       A = Xj - mew(:, int16(i / 1600) + 1);
       [Uj, ~] = eigs(((A * A') / 1600), 29);
       U = [U Uj];
    end
end

