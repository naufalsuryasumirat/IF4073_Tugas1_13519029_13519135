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
