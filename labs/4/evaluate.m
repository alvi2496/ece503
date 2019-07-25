function f_w_hat = evaluate(y_n, w_hat_transpose, x)
    sum = 0;
    for i=1:480
        sum = sum + log(1 + exp((-y_n(i) * w_hat_transpose * [x(:, i); 1])));
    end
    f_w_hat = sum / 480;
end

