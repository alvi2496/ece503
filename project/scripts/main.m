clc,
close all;
clear all;

split('/home/alvi/Documents/courses/ece503/project/data/data.mat');

Xtrain = load('/home/alvi/Documents/courses/ece503/project/data/Xtrain.mat');
Xtrain = Xtrain.Xtrain;

Ytrain = load('/home/alvi/Documents/courses/ece503/project/data/Ytrain.mat');
Ytrain = Ytrain.Ytrain;

Xtest = load('/home/alvi/Documents/courses/ece503/project/data/Xtest.mat');
Xtest = Xtest.Xtest;

Ytest = load('/home/alvi/Documents/courses/ece503/project/data/Ytest.mat');
Ytest = Ytest.Ytest;

% Xtrain = process(Xtrain);
% Ytrain = process(Ytrain);
% Xtest = process(Xtest);
% Ytest = process(Ytest);

train_size = size(Xtrain);
test_size = size(Xtest);

Xtrain = [Xtrain, ones(train_size(1), 1)];
W_B = ( ( inv( (Xtrain' * Xtrain) ) ) * Xtrain' ) * Ytrain;
w = W_B(1:5, :);
b = W_B(6);
sum = 0;

for i=1:test_size(1)
   y = w' * Xtest(i, :)' + b;
   if dif(y, Xtest(i, 1)) < dif(y, Xtest(i, 2))
       y = Xtest(i, 1);
   else
       y = Xtest(i, 2);
   end
   if y == Ytest(i)
       sum = sum + 1;
   end
end
disp(sum);


% y = w' * Xtest(1, :)' + b;