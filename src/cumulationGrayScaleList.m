function GSList = cumulationGrayScaleList(inputImg)
% CUMULATIONGRAYSCALELIST     
% Example:                  A = imread('low-contrast-image-lena.ppm');
%                           GSList = cumulationGrayScaleList(A);
    
    GSList = grayScaleList(inputImg);

    inputMap = im2uint8(inputImg);
    width = size(inputMap, 1);
    height = size(inputMap, 2);
    totalM = size(inputMap, 3);
    totalSize = width * height * totalM;

    % count chance for each level of gray scale
    for i = 1:256
        GSList(i) = double(GSList(i)) / totalSize;
    end
    
    % count cumulative value of the list
    total = 0;
    for i = 1:256
        total = total + GSList(i);
        GSList(i) = total;
    end
end