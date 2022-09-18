function fig = imgEqualization(inputImg)
% IMGEQUALIZATION
% Example:                  A = imread('low-contrast-image-lena.ppm');
%                           GSList = imgEqualization(A);

    inputMap = im2uint8(inputImg);
    width = size(inputMap, 1);
    height = size(inputMap, 2);
    totalM = size(inputMap, 3);
    fig = figure;

    % Display input image:
    subplot(2,2,1);
    imshow(inputMap);
    title('Citra Input');

    % Display input hist:
    subplot(2,2,2);
    imhist(inputMap);

    GSList = histogramEqualization(inputImg);
    outputMap = inputMap;
    for i = 1:width
        for j = 1:height
            for k = 1:totalM
                outputMap(i,j,k) = uint8(GSList(outputMap(i,j,k) + 1)) - 1; 
            end
        end
    end

    % Display input image:
    subplot(2,2,3);
    imshow(outputMap);
    title('Citra Output');

    % Display output hist:
    subplot(2,2,4);
    imhist(outputMap);
end