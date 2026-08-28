# Histogram Analysis and Enhancement in MATLAB

## Overview

This project demonstrates various **histogram-based image processing techniques using MATLAB**. The objective is to understand how pixel intensity distributions can be analyzed and modified to improve image contrast and appearance.

## Tasks Performed

1. **Image Reading and Grayscale Conversion**

   * Reads the input image.
   * Converts RGB images into grayscale for histogram analysis.

2. **Histogram Analysis**

   * Displays the histogram of the input image.
   * Shows the distribution of pixel intensity values.

3. **Histogram Stretching**

   * Expands the intensity range of the image.
   * Improves image contrast by mapping the existing intensity range to a wider range.

4. **Histogram Equalization**

   * Redistributes pixel intensity values to improve the overall contrast of the image.
   * Implemented using MATLAB's `histeq()` function.

5. **Histogram Specification**

   * Adjusts the histogram of an input image to approximately match the histogram of a reference image.
   * Implemented using MATLAB's `imhistmatch()` function.

## MATLAB Functions Used

```matlab
imread()       % Reads an image from a file
rgb2gray()     % Converts an RGB image into a grayscale image
imshow()       % Displays an image
imhist()       % Displays the histogram of an image
histeq()       % Performs histogram equalization
imhistmatch()  % Matches the histogram of an image with a reference image
```

## Concepts Covered

* Image histogram
* Pixel intensity distribution
* Dynamic range
* Image contrast
* Histogram stretching
* Histogram equalization
* Histogram specification / matching

## Objective

The main objective of this work is to understand how **histogram-based techniques are used in Digital Image Processing to analyze and enhance images**, and to implement these techniques practically using MATLAB.

