function split(data_url)

%     M = csvread('data/data.csv');
%     data = M(randperm(size(M, 1)), :);
%     save('data/data.mat', 'data');
    
    data = load(data_url);
    data = data.data;
    Xtrain = data(1:40000, 1:5);
    Ytrain = data(1:40000, 6);
    Xtest = data(40001:44224, 1:5);
    Ytest = data(40001:44224, 6);
    save('/home/alvi/Documents/courses/ece503/project/data/Xtrain.mat', 'Xtrain');
    save('/home/alvi/Documents/courses/ece503/project/data/Ytrain.mat', 'Ytrain');
    save('/home/alvi/Documents/courses/ece503/project/data/Xtest.mat', 'Xtest');
    save('/home/alvi/Documents/courses/ece503/project/data/Ytest.mat', 'Ytest');
end

