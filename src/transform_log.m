%{
  Description: Fix image quality using log transformation with formula s = c * log(1 + r)
  Output: Transformed matrix using log transformation formula
  Input: 2D Matrix with x dimension; x in range (0, 3], c
%}
function mat = log_transform(matrix, c)
  [~, ~, dim] = size(matrix);
  mat = matrix;
  for d = 1:dim
    mat(:,:,d) = uint8(log10(double(1 + matrix(:,:,d))) * c);
  end
end
