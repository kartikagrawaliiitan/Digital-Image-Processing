# Image Arithmetic Operations Using MATLAB

## Overview

This project demonstrates different **arithmetic operations on digital images using MATLAB**. The operations are performed on both the **original color image** and its **grayscale version** to observe and compare the effects of arithmetic image processing.

## Tasks Performed

1. **Image Reading**

   * Reads the input image using MATLAB.
   * The original color image is retained for processing.

2. **Grayscale Conversion**

   * Converts the color image into a grayscale image.
   * Both color and grayscale images are used for arithmetic operations.

3. **Arithmetic Operations**

   * Performs the selected arithmetic operation using a user-defined constant:

     * Addition
     * Subtraction
     * Multiplication
     * Division

4. **Pixel Value Limiting**

   * Limits the resulting pixel values to the valid range of **0–255**.
   * Converts the processed image back to `uint8` format.

5. **Result Visualization**

   * Displays:

     * Original Color Image
     * Original Grayscale Image
     * Changed Color Image
     * Changed Grayscale Image
   * The selected operation and constant value are displayed in the result image titles.

## MATLAB Functions Used

```matlab
imread()       % Reads an image from a file
rgb2gray()     % Converts an RGB image into a grayscale image
imshow()       % Displays an image
subplot()      % Displays multiple images in a single figure
size()         % Returns the dimensions of an image
double()       % Converts image data to double precision
uint8()        % Converts image data to 8-bit unsigned integer format
input()        % Takes user input from the Command Window
fprintf()      % Displays formatted text in the Command Window
error()        % Generates an error message
num2str()      % Converts a number into a string
```

## Concepts Covered

* Digital image representation
* RGB and grayscale images
* Pixel-level arithmetic operations
* Image addition
* Image subtraction
* Image multiplication
* Image division
* Pixel value clipping
* Color and grayscale image comparison

## Objective

The main objective of this work is to understand how **arithmetic operations affect image pixel values** and to compare their effects on both **color and grayscale images** using MATLAB.

