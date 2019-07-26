clc;
clear all;
close all;
x1 = [2; 3];
x2 = [-3; 3];
x3 = [2; -3];
x4 = [-3; -3];
x = [2 -3 2 -3; 3 3 -3 -3];
for i=1:4
    [xs,fs,k] = grad_desc('beale','gradient', x(:, i), 1e-6);
    disp(fs);
end