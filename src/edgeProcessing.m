% edgeProcessing processes edges from given image following steps below.
%
%   * Step 1. Edge detection
% Extracts Edge Map from given image and preprocess it to reduce complexity.
%   * Step 2. Edge Contours extraction 
% TODO
%   * Step 3. Line segment fitting
% TODO
%   * Step 4. Curvature related processing
% TODO
%
% Input     - im : 'jpg' image which taken by normal smart phone.

function edgeProcessing(im)

%% Initialize

% For edge detection
T_low = 0.3;
T_high = 0.4;
sigma = 1;

%% Preprocess image

% Resize if input image is too high resolution.
if size(im,1) * size(im,2) > 1000000
    im = imresize(im, 0.1);
end

% Convert RGB to gray.
im = rgb2gray(im);

%% Step 1. Edge detection

% Implement Canny edge detection.
EdgeMap = edge(im, 'canny', [T_low, T_high], sigma);

% Apply 'thin' operation to ignore unnecessary parts.
EdgeMap = bwmorph(EdgeMap,'thin',Inf);

% Remove junctions.
[ROW, COL] = size(EdgeMap);
for i = 2:ROW-1
    for j = 2:COL-1
        if EdgeMap(i,j) == 1 && sum(sum(EdgeMap(i-1:i+1,j-1:j+1))) >= 4
            EdgeMap(i-1:i+1,j-1:j+1) = 0;
        end
    end
end

% Remove isolated pixels.
EdgeMap = bwmorph(EdgeMap,'clean');

end
