function fig = imgSpecification(inputImg, specImg)
% IMGSPECIFICATION
% Example:                  A = imread('low-contrast-image-lena.ppm');
%                           B = imread('peppers512warna.bmp');
%                           GSList = imgSpecification(A, B);

    fig = figure;
    inputMap = im2uint8(inputImg);
    width = size(inputMap, 1);
    height = size(inputMap, 2);
    totalM = size(inputMap, 3);

    % Display input image:
    subplot(2,2,1);
    imshow(inputMap);
    title('Citra Input');

    GSListInput = histogramEqualization(inputImg);
    GSListSpec = histogramEqualization(specImg);

    inputSize = size(GSListInput, 2);

    for i = 1:inputSize
        GSListInput(1, i) = searchNearestValue(GSListInput(1, i), GSListSpec);
    end

    disp(GSListInput);

    outputMap = inputMap;
    for i = 1:width
        for j = 1:height
            for k = 1:totalM
                outputMap(i,j,k) = uint8(GSListInput(outputMap(i,j,k) + 1)) - 1; 
            end
        end
    end

     % Display input image:
    subplot(2,2,3);
    imshow(outputMap);
    title('Citra Output');
end