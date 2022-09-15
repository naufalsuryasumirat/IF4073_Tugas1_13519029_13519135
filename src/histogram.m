img = imread('img/fig_0241_c_einstein_high_contrast.tif');
img_color = imread('img/fig_0630_01_strawberries_fullcolor.tif');

img_plot(img_color, 1);

%{
  Description: implementation of rgb values to grayscale values
  Output: 2D matrix of size row(matrix), col(matrix), with grayscale
    values using the formula 0.2989 * Red + 0.5870 * Green + 0.1140 * Blue
  Input: 2D Matrix of n dimension n > 0
%}
function grayscale = rgb_to_grayscale(matrix)
  [row, col, dim] = size(matrix);
  if dim == 1 % if image is already in grayscale values
      grayscale = matrix;
      return
  end

  grayscale = zeros(row, col);

  for r = 1:row
    for c = 1:col
      grayscale(r,c) = 0.2989 * matrix(r,c,1) + 0.587 * matrix(r,c,2) + 0.114 * matrix(r,c,3);
    end
  end

  grayscale = uint8(grayscale);
end

%{
  Description: Calculates occurences of each pixel value for a given matrix
  Output: Vector with 256 columns with values [0,255] of occurences
  Input: 2D pixel matrix
%}
function occ = calc_occurences(matrix)
  occ = zeros(1,256);
  [row, col] = size(matrix);
  for r = 1:row
    for c = 1:col
      occ(matrix(r,c)+1) = occ(matrix(r,c)+1) + 1;
    end
  end
end

%{
  Description: Plots occurences of pixel using stem function
  Output: Stem of pixel occurences
  Input: Vector with 256 columns of pixel occurences
%}
function occurences_to_plot(occ)
  figure
  stem(0:255, occ);
end

%{
  Description: Plots stem of image rgb and/or grayscale values, with option to show images
  Output: Figures of plots and images
  Input: image matrix (grayscale/colored)
%}
function img_plot(img, show)
  [~, ~, dim] = size(img);
  if dim == 1 % if image is already in grayscale
    occurences_to_plot(calc_occurences(img))
    return
  end

  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  gr = rgb_to_grayscale(img);
  occurences_to_plot(calc_occurences(r))
  occurences_to_plot(calc_occurences(g))
  occurences_to_plot(calc_occurences(b))
  occurences_to_plot(calc_occurences(gr))

  if show
    red = img;
    red(:,:,2:3) = 0; % clear values except red
    figure
    imshow(red); % show image with only red values

    green = img;
    green(:,:,[1,3]) = 0; % clear values except green
    figure
    imshow(green); % show image with only green values

    blue = img;
    blue(:,:,1:2) = 0; % clear values  except blue
    figure
    imshow(blue); % show image with only blue values

    figure
    imshow(red + green + blue); % show original image
  end
end
