function GSList = grayScaleList(inputImg)
% GRAYSCALELIST     give frequency list of gray scale value of image
% Example:          A = imread('low-contrast-image-lena.ppm');
%                   GSList = grayScaleList(A);

    inputMap = im2uint8(inputImg);
    width = size(inputMap, 1);
    height = size(inputMap, 2);
    totalM = size(inputMap, 3);

    N = 256;

    % initiate frequency list
    GSList = 1:N;
    for i = 1:N
        GSList(i) = 0;
    end
    
    for i = 1:width
        for j = 1:height
            for k = 1:totalM
                GSList(inputMap(i,j,k) + 1) = GSList(inputMap(i,j,k) + 1) + 1;
            end
        end
    end
end