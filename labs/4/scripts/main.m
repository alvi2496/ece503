clc;
clear all;
close all;
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
ytest = D_bc_te(31,:);
w = zeros(30, 1);
b = 0;
w_hat = [w; b];
[xs,fs,k] = grad_desc('evaluate', 'gradient', w_hat, 75);
w_star = xs(1:30, :);
b_star = xs(31, :);
r = w_star' * Xtest + b_star;
false_positive = 0;
false_negetive = 0;
for i=1:89
    if r(i) > 0
        r(i) = 1;
    elseif r(i) < 0
        r(i) = -1;
    end
    if r(i) == 1 && r(i) ~= ytest(i)
        false_positive = false_positive + 1;
    elseif r(i) == -1 && r(i) ~= ytest(i)
        false_negetive = false_negetive + 1;
    end
end
error_rate = (false_positive + false_negetive) / 89 * 100;
disp("Result:");
fprintf("False Positive: %d\n", false_positive);
fprintf("Flase Negetive: %d\n", false_negetive);
fprintf("Error Rate: %f\n", error_rate);

