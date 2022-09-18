img_color = imread('img/fig_0241_a_einstetin_low_contrast.tif');
figure, imshow(img_color);
transformed_img = power_transform(img_color, 1.1, 1.25);
figure, imshow(transformed_img);

%{
  Description: Fix image quality using power transformation with formula s = cr^γ
  Output: Transformed matrix using power transformation formula
  Input: 2D Matrix with x dimension; x in range (0, 3], c, and γ (gamma)
  *γ = Gamma
%}
function mat = power_transform(matrix, c, gamma)
  [~, ~, dim] = size(matrix);
  mat = matrix;
  for d = 1:dim
    mat(:,:,d) = uint8(power(double(matrix(:,:,d)), gamma) * c);
  end
end
