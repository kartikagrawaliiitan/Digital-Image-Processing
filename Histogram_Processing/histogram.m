clc;
clear;
close all;

%% Read Image
img = imread('car.jpg');

%% Convert RGB image to Grayscale
if size(img,3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

%% Display Original Image
figure;

subplot(2,3,1);
imshow(gray_img);
title('Original Grayscale Image');

%% Display Histogram
subplot(2,3,4);
imhist(gray_img);
title('Histogram of Original Image');

%% Find Minimum and Maximum Intensity
min_intensity = double(min(gray_img(:)));
max_intensity = double(max(gray_img(:)));

%% Histogram Stretching
stretched_img = uint8( ...
    ((double(gray_img) - min_intensity) / ...
    (max_intensity - min_intensity)) * 255);

%% Display Stretched Image
subplot(2,3,2);
imshow(stretched_img);
title('Histogram Stretched Image');

%% Histogram after Stretching
subplot(2,3,5);
imhist(stretched_img);
title('Histogram after Stretching');
%% Histogram Equalization

equalized_img = histeq(gray_img);

subplot(2,3,3);
imshow(equalized_img);
title('Histogram Equalized Image');

% Display histogram of equalized image
subplot(2,3,6);
imhist(equalized_img);
title('Histogram after Equalization');

%% Histogram Specification / Matching

% Read reference image
ref_img = imread('wheat.jpg');

% Convert reference image to grayscale
if size(ref_img,3) == 3
    ref_img = rgb2gray(ref_img);
end

% Perform histogram specification
matched_img = imhistmatch(gray_img, ref_img);

% Display results
figure;

subplot(3,2,1);
imshow(gray_img);
title('Input Image');

subplot(3,2,2);
imhist(gray_img);
title('Input Histogram');

subplot(3,2,3);
imshow(ref_img);
title('Reference Image');

subplot(3,2,4);
imhist(ref_img);
title('Reference Histogram');

subplot(3,2,5);
imshow(matched_img);
title('Specified Image');

subplot(3,2,6);
imhist(matched_img);
title('Specified Histogram');