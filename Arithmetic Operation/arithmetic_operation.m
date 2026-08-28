clc;
clear;
close all;

%% Read Image

img = imread('wheat.jpg');


%% Convert RGB Image to Grayscale

if size(img,3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end


%% Display Original Images

figure;

suptitle('Arithmetic Operation');
subplot(2,2,1);
imshow(img);
title('Original Color Image');

subplot(2,2,2);
imshow(gray_img);
title('Original Grayscale Image');


%% Select Arithmetic Operation

fprintf('\n===== IMAGE ARITHMETIC OPERATIONS =====\n');
fprintf('1. Addition\n');
fprintf('2. Subtraction\n');
fprintf('3. Multiplication\n');
fprintf('4. Division\n');

choice = input('Enter your choice (1-4): ');


%% Exit

if choice == 5
    fprintf('Program exited successfully.\n');
    return;
end


%% Enter Constant Value

c = input('Enter constant value: ');


%% Convert Images to Double

color_double = double(img);
gray_double = double(gray_img);


%% Perform Selected Operation

switch choice

    case 1

        color_result = color_double + c;
        gray_result = gray_double + c;

        operation_name = 'Addition';


    case 2

        color_result = color_double - c;
        gray_result = gray_double - c;

        operation_name = 'Subtraction';


    case 3

        color_result = color_double * c;
        gray_result = gray_double * c;

        operation_name = 'Multiplication';


    case 4

        if c == 0
            error('Division by zero is not allowed.');
        end

        color_result = color_double / c;
        gray_result = gray_double / c;

        operation_name = 'Division';


    otherwise

        error('Invalid choice. Please enter a number between 1 and 5.');

end


%% Limit Color Image Values

color_result(color_result < 0) = 0;
color_result(color_result > 255) = 255;


%% Limit Grayscale Image Values

gray_result(gray_result < 0) = 0;
gray_result(gray_result > 255) = 255;


%% Convert Results to uint8

color_result = uint8(color_result);
gray_result = uint8(gray_result);


%% Display Changed Images

subplot(2,2,3);
imshow(color_result);
title(['Changed Color : ', operation_name, ...
    ' (Constant = ', num2str(c), ')']);


subplot(2,2,4);
imshow(gray_result);
title(['Changed Grayscale : ', operation_name, ...
    ' (Constant = ', num2str(c), ')']);