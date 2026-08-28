# Bit Plane Slicing of an Image Using MATLAB

## Overview

This project demonstrates **Bit Plane Slicing** of a grayscale image using MATLAB. Bit plane slicing is an image processing technique used to separate an image into individual binary planes based on the bits representing each pixel.

For an 8-bit grayscale image, each pixel is represented using 8 bits, resulting in **8 bit planes ranging from Bit Plane 0 (LSB) to Bit Plane 7 (MSB)**.

## Tasks Performed

1. **Image Reading and Grayscale Conversion**

   * Reads the input image.
   * Converts an RGB image into a grayscale image.

2. **Bit Plane Extraction**

   * Extracts all 8 bit planes of the grayscale image.
   * Bit Plane 0 represents the Least Significant Bit (LSB).
   * Bit Plane 7 represents the Most Significant Bit (MSB).

3. **Bit Plane Visualization**

   * Displays the original grayscale image.
   * Displays all 8 extracted bit planes for visual analysis.

## MATLAB Functions Used

```matlab
imread()       % Reads an image from a file
rgb2gray()     % Converts an RGB image into a grayscale image
imshow()       % Displays an image
uint8()        % Converts image data into 8-bit unsigned integer format
bitget()       % Extracts a specific bit from each pixel
num2str()      % Converts a number into a string
subplot()      % Displays multiple images in a single figure
```

## Concepts Covered

* Digital image representation
* 8-bit grayscale images
* Binary representation of pixels
* Bit Plane Slicing
* Least Significant Bit (LSB)
* Most Significant Bit (MSB)
* Image information in different bit planes

## Objective

The main objective of this work is to understand how an **8-bit grayscale image can be decomposed into individual bit planes** and to analyze the contribution of different bit positions to the visual information present in an image.

