% classify function 
% TO RUN : 1) MatConvNet must be installed.
%          2) Modify variable 'setup_path'
% Input : 101 x 101 x 3 feature image
% Output : class (1~8)

function result = classifyFeature(img)
    setup_path = 'D:\matconvnet\matlab';
    cur_dir = 'C:\Users\son\Desktop\Sushi-Dish\src';
    % need to be called
    run(fullfile(setup_path, 'vl_setupnn.m'));
    load('imdb.mat');
    load('net-epoch-57.mat');
    
    % 1) Input Normalization : change to 50x100x3 and subtract data_mean
    nor_im = single(img(52:101,1:100,:))- images.data_mean;
    
    % 2) Classify via vl_simplenn
    net.layers{end}.type = 'softmax';
    res = vl_simplenn(net, nor_im) ;
    
    % show the classification result
    scores = squeeze(gather(res(end).x)) ;
    [bestScore, best] = max(scores) ;
    % best is between 1~89
    figure(1) ; clf ; imshow(img) ;
    title(sprintf('The class is %d, score %.1f%%',...
    best, bestScore * 100)) ;

end