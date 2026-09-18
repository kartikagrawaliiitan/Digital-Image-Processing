clc;
clear;
close all;
startCPU = cputime;
tic;
% Read the input image
img = imread('cameraman.tif');

% Convert to grayscale if image is RGB
if size(img,3) == 3
    img = rgb2gray(img);
end

% Convert image to double
img = double(img);

% Perform 2-D Haar Wavelet Transform
[LL, LH, HL, HH] = dwt2(img, 'haar');

% Display original image
figure;
imshow(uint8(img));
title('Original Image');

% Display Wavelet Sub-bands
figure;

subplot(2,2,1);
imshow(uint8(LL));
title('LL - Approximation');

subplot(2,2,2);
imshow(uint8(abs(LH)));
title('LH - Horizontal Details');

subplot(2,2,3);
imshow(uint8(abs(HL)));
title('HL - Vertical Details');

subplot(2,2,4);
imshow(uint8(abs(HH)));
title('HH - Diagonal Details');

% Reconstruct the image using inverse DWT
reconstructed = idwt2(LL, LH, HL, HH, 'haar');

% Display reconstructed image
figure;
imshow(uint8(reconstructed));
title('Reconstructed Image');

% Calculate reconstruction error
error = img - reconstructed;
MSE = mean(error(:).^2);
executionTime = toc;
cpuTimeUsed = cputime - startCPU;

fprintf('\n----- Wavelet Transform Results -----\n');
fprintf('Image Size : %d x %d\n', size(img,1), size(img,2));
fprintf('Wavelet Used : Haar\n');
fprintf('Execution Time : %.6f seconds\n',executionTime);
fprintf('CPU Time Used : %.6f seconds\n', cpuTimeUsed);
fprintf('MSE : %.10f\n', MSE);
fprintf('Maximum Error : %.10f\n', max(abs(error(:))));
