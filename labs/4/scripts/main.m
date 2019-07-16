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