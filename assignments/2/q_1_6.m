clc;
clear all;
close all;
D = load('/home/alvi/Documents/courses/ece503/assignments/2/D_iris.mat');
D = D.D_iris;
D = D(1:4,51:150);
D1 = D(:,1:50);
D2 = D(:,51:100);
rand('state', 15)
r1 = randperm(50);
D1train = D1(:,r1(1:40));
D1test = D1(:,r1(41:50));
rand('state', 16)
r2 = randperm(50);
D2train = D2(:,r2(1:40));
D2test = D2(:,r2(41:50));
Dtrain = [D1train D2train];
Dtest = [D1test D2test];
y = [ones(40, 1); -ones(40, 1)];
a = sum((Dtrain' * Dtrain), 2);
b = Dtrain * y;
W = b / a;
F = W' * Dtest;