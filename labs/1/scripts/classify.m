function result = classify(T, l, U, mew, F)
    result = 0;
    for i=1:100
        x = T(:, i);
        d = 123456.1234;
        for j=1:10
           Uq_j = U(:, (j-1)*29+1:j*29);
           Fj = F(:, (j-1)*1600+1:j*1600);
           mew_j = mew(:, j);
           x_head = Uq_j * Fj + mew_j;
           ej = norm((x-x_head), 2);
           if (ej < d) 
               d = ej;
               class = j-1;
           end
        end
        if (l(i) == class)
            result = result + 1;
        end
        fprintf("Image: %d; Actual: %d, Prediction: %d\n", i,class,l(i));
    end
    result = result / (i-1) * 100;
end

