%% Bit Plane Slicing
clc;
clear;
close all;

% Read Image
img = imread('wheat.jpg');

% Convert RGB image to Grayscale
if size(img,3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end


% Extract 8 bit planes
bit_plane = zeros(size(gray_img,1), size(gray_img,2), 8);

for k = 1:8
    bit_plane(:,:,k) = bitget(gray_img, k);
end

% Display original image
figure;

subplot(3,3,1);
imshow(gray_img);
title('Original Grayscale Image');

% Display all 8 bit planes
for k = 1:8
    subplot(3,3,k+1);
    imshow(bit_plane(:,:,k));
    title(['Bit Plane ', num2str(k-1)]);
end
suptitle('Bit Plane Slicing');