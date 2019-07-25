function f_w_hat = evaluate(w_hat)
    D_bc_tr = load('/home/alvi/Documents/courses/ece503/labs/4/data/D_bc_tr.mat');
    D_bc_tr = D_bc_tr.D_bc_tr;
    D_bc_te = load('/home/alvi/Documents/courses/ece503/labs/4/data/D_bc_te.mat');
    D_bc_te = D_bc_te.D_bc_te;
    Xtrain = zeros(30,480);
    for i = 1:30
        xi = D_bc_tr(i,:);
        mi = mean(xi);
        vi = sqrt(var(xi));
        Xtrain(i,:) = (xi - mi)/vi;
    end
    Xtest = zeros(30,89);
    for i = 1:30
        xi = D_bc_te(i,:);
        mi = mean(xi);
        vi = sqrt(var(xi));
        Xtest(i,:) = (xi - mi)/vi;
    end
    ytrain = D_bc_tr(31,:);
    sum = 0;
    w_hat_transpose = w_hat';
    for i=1:480
        sum = sum + log(1 + exp((-ytrain(i) * w_hat_transpose * [Xtrain(:, i); 1])));
    end
    f_w_hat = sum / 480;
end

