function split(data_url)
    data = load(data_url);
    data = data.data;
    Xtrain = data(1:40000, 1:6);
    Ytrain = data(1:40000, 7);
    Xtest = data(40001:44224, 1:6);
    Ytest = data(40001:44224, 7);
    save('/home/alvi/Documents/courses/ece503/project/data/Xtrain.mat', 'Xtrain');
    save('/home/alvi/Documents/courses/ece503/project/data/Ytrain.mat', 'Ytrain');
    save('/home/alvi/Documents/courses/ece503/project/data/Xtest.mat', 'Xtest');
    save('/home/alvi/Documents/courses/ece503/project/data/Ytest.mat', 'Ytest');
end

