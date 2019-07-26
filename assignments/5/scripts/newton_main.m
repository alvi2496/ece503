clc;
clear all;
close all;
x1 = [2; 3];
x2 = [-3; 3];
x3 = [2; -3];
x4 = [-3; -3];
x = [2 -3 2 -3; 3 3 -3 -3];
for i=1:4
    [xs,fs,k] = newton('beale','gradient','hessian',x(:, i),0.1,1e-6);
    disp(fs);
end