function fig = contrastStretching(inputImg)
% CONTRASTSTRETCHING  Displays stretched image by finding min and max grayscale
% Example:            A = imread('low-contrast-image-lena.ppm');
%                     fig = contrastStretching(A);
    
    inputMap = im2uint8(inputImg);
    fig = figure;

    % Display input image:
    subplot(2,2,1);
    imshow(inputMap);
    title('Citra Input');

    % Display input hist:
    subplot(2,2,2);
    imhist(inputMap);
    
    width = size(inputMap, 1);
    height = size(inputMap, 2);
    totalM = size(inputMap, 3);

    % Search rMin and rMax
    rMin = 255;
    rMax = 0;
    for i = 1:width
        for j = 1:height
            for k = 1:totalM
                if inputMap(i,j,k) < rMin
                    rMin = inputMap(i,j,k);
                end

                if inputMap(i,j,k) > rMax
                    rMax = inputMap(i,j,k);
                end
            end
        end
    end

    disp(rMin);
    disp(rMax);

    % transform each value to linear constrast stretching
    outputMap = inputMap;
    for i = 1:width
        for j = 1:height
            for k = 1:totalM
                numerator = double(outputMap(i,j,k) - rMin);
                denominator = double(rMax - rMin);
                outputMap(i,j,k) = 255 * numerator / denominator;
            end
        end
    end

    % Display output image:
    subplot(2,2,3);
    imshow(outputMap);
    title('Citra Output');

    % Display output hist:
    subplot(2,2,4);
    imhist(outputMap);
end