function GSList = histogramEqualization(inputImg)
% HISTOGRAMEQUALIZATION     
% Example:                  A = imread('low-contrast-image-lena.ppm');
%                           GSList = histogramEqualization(A);

    GSList = cumulationGrayScaleList(inputImg);

    for i = 1:256
        GSList(i) = GSList(i) * 255;
    end
end