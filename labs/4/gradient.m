function g_w_hat = gradient(y_n, w_hat_transpose, x)
    sum = 0;
    for i=1:480
        calc_e = exp((-y_n(i) * w_hat_transpose * [x(:, i); 1]));
        sum = sum + (((y_n(i) * calc_e) / (1 + calc_e)) * [x(:, i); 1]);
    end
    g_w_hat = - (sum / 480);
end

