clc;
clear all;
close all;
D = load('/home/alvi/Documents/courses/ece503/labs/2/data/D_iris.mat');
D = D.D_iris(1:4,:);
X1 = D(:,1:50);
X2 = D(:,51:100);
X3 = D(:,101:150);
rand('state',111)
r1 = randperm(50);
Xtr1 = X1(:,r1(1:40));
Xte1 = X1(:,r1(41:50));
rand('state',112)
r2 = randperm(50);
Xtr2 = X2(:,r2(1:40));
Xte2 = X2(:,r2(41:50));
rand('state',113)
r3 = randperm(50);
Xtr3 = X3(:,r3(1:40));
Xte3 = X3(:,r3(41:50));
y = [ones(40, 1); -ones(80, 1)];
ones = ones(120, 1);
% 3.3 (i) calculate w1
Dtrain1 = [Xtr1'; Xtr2'; Xtr3'];
Dtrain1 = [Dtrain1 ones];
w1 = (inv(Dtrain1' * Dtrain1) * Dtrain1') * y;
% 3.3 (ii) calculate w2
Dtrain2 = [Xtr2'; Xtr1'; Xtr3'];
Dtrain2 = [Dtrain2 ones];
w2 = (inv(Dtrain2' * Dtrain2) * Dtrain2') * y;
% 3.3 (iii) calculate w3
Dtrain3 = [Xtr3'; Xtr2'; Xtr1'];
Dtrain3 = [Dtrain3 ones];
w3 = (inv(Dtrain3' * Dtrain3) * Dtrain3') * y;
mis_class = 0;
Yte1(1, 1:10) = 1;
Yte2(1, 1:10) = 2;
Yte3(1, 1:10) = 3;
Xtest = [Xte1 Xte2 Xte3];
Ytest = [Yte1 Yte2 Yte3];
Y = [1 0 0; 0 1 0; 0 0 1];
Yresult = int16.empty;
for i=1:30
   f1 = (w1(1:4, :)' * Xtest(:, i) + w1(5));
   f2 = (w2(1:4, :)' * Xtest(:, i) + w2(5));
   f3 = (w3(1:4, :)' * Xtest(:, i) + w3(5));
   F = [f1 f2 f3];
   [~, I] = max(F);
   Yresult = [Yresult Y(I, :)'];
   if I ~= Ytest(i)
       mis_class = mis_class + 1;
   end
end
error_rate = mis_class / 30;
tp = sum(Yresult(1, 1:10)) + sum(Yresult(2, 11:20)) + sum(Yresult(3, 21:30));
fp = sum(Yresult(1, 11:30)) + sum(Yresult(2, 1:10)) + sum(Yresult(2, 21:30)) + sum(Yresult(3, 1:20));
fn = 30 - tp;
tn = 30 - fp;
confusion_matrix = [tp fp; fn tn];
fprintf("Confusion Matrix : \n");
disp(confusion_matrix);
fprintf("Error Rate: %f\n", error_rate);
disp(Yresult);