function [correct, incorrect] = classify(T, l, U, mew)
    correct = 0;
    incorrect = 0;
    chunk = 1000;
    for k = 1:chunk:10000
       tic
       for i = k:k+chunk-1
            x = T(:, i);
            ej = double.empty;
            for j=1:10
               Uq_j = U(:, (j-1)*29+1:j*29);
               mew_j = mew(:, j);
               Fj = Uq_j' * (x - mew_j);
               x_head = Uq_j * Fj + mew_j;
               ej = [ej norm(x - x_head)];
            end
            [~, class] = min(ej);
            if (l(i) == class-1)
                correct = correct + 1;
            else
                incorrect = incorrect + 1;
            end
       end
       fprintf("CPU time of %d - %d: %f\n", k, i, toc);
    end
end
