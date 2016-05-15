% Dataset Information
% 1 : cyan (1,300 won)
% 2 : purple (1,700 won)
% 3 : green (2,100 won)
% 4 : yellow (2,600 won)
% 5 : brown (3,000 won)
% 6 : red (3,500 won)
% 7 : blue (4,000 won)
% 8 : black (6,000 won)
%
% images.data (101 x 101 x 3 x n) / labels (1xn) / set (1 x n) (n is dataset size)
% 1: train , 2: val , 3: test

function [result, labels, set] = makeDataSet()
    dirname = '../../Set1';
    d = dir(dirname);
    result = [];
    labels = [];
    tot_cnt = 0;
    for i = 3:length(d)    
        if strcmp(d(i).name,'Thumbs.db') ~= 1
            fname = sprintf('%s\\%s',dirname,d(i).name);
            im = imread(fname);
            display(sprintf('Processing : %s\n',fname));
            im_re = imresize(im,0.1);
            % Detects Ellipses from image
            el = detectEllipses(im);            
            loop_cnt = numel(el);
            for j=1:loop_cnt
               feature = extractFeatureImage(im_re,el,j);
               close all;
               imshow(feature);
               x = input('Save feature? Yes 1 / No 0 :\n');               
               if x
                  % Update result
                  lab = input('Label of feature? :\n');
                  labels = [labels ; lab];
                  result = cat(4,result,feature);
                  tot_cnt = tot_cnt + 1;
                  close;
               end             
            end            
        end
    end    
    set = ones(1,tot_cnt);    
end