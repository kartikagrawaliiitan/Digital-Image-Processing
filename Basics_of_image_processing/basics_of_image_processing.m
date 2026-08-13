% Basics of  Image Processing 

clc
clear all

% load the image
img = imread('sample_img.jpg'); 
subplot(3,3,2);
op1 = imshow(img);

s = size(img);
image_type = class(img);
title('original image');
xlabel({['Size: ' num2str(s(1)) ' x ' num2str(s(2))], ...
    ['Type: ' image_type] ...
    });

s = size(img);
image_type = class(img);
disp('size of image is: ');
disp(s);

% convert image rgb to gray
subplot(3,3,5);
op2 = imshow(rgb2gray(img));
title('Gray scale image');

% extraction of red image out of RGB image
Ired = img;
Ired(:,:,2) = 0;
Ired(:,:,3) = 0;
subplot(3,3,7);
imshow(Ired)
title('Red Channel Image');

% extraction of green image out of RGB image
Ig = img;
Ig(:,:,1) = 0;
Ig(:,:,3) = 0;
subplot(3,3,8);
imshow(Ig)
title('Green Channel Image');

% extraction of blue image out of RGB image
Ib = img;
Ib(:,:,1) = 0;
Ib(:,:,2) = 0;
subplot(3,3,9);
imshow(Ib)
title('Blue Channel Image');

