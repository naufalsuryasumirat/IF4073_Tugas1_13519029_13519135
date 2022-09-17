img_color = imread('img/fig_0241_a_einstetin_low_contrast.tif');
figure, imshow(img_color);
brightened_img = brightening(img_color, 1.5, 50);
% disp(brightened_img);
disp(size(brightened_img));
disp(size(img_color));
disp(uint8(-8));
figure, imshow(brightened_img);

%{
  Description: Fix image quality using image brightening using formula s = c * log(1 + r)
  Output: Transformed 2D matrix using the image brightening formula
  Input: 2D Matrix with x dimension; x in range (0, 3], a, b
%}
function mat = brightening(matrix, a, b)
  [~, ~, dim] = size(matrix);
  mat = matrix;
  for d = 1:dim
    mat(:,:,d) = uint8((matrix(:,:,d) * a) + b);
  end
end