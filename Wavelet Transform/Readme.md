# 2-D Discrete Wavelet Transform

## Overview

The **Discrete Wavelet Transform (DWT)** is a Digital Image Processing technique used to analyze an image at different frequency levels.

This practical implements a **2-D Haar Wavelet Transform** in MATLAB.

## Method

The input image is decomposed into four sub-bands:

* **LL** – Approximation coefficients
* **LH** – Horizontal detail coefficients
* **HL** – Vertical detail coefficients
* **HH** – Diagonal detail coefficients

The image is then reconstructed using the **Inverse DWT (IDWT)**.

## MATLAB Functions

```matlab
dwt2()
idwt2()
```

## Input

`cameraman.tif`

## Output

* Original image
* Four DWT sub-bands
* Reconstructed image
* Mean Squared Error (MSE)

## Applications

* Image compression
* Image denoising
* Feature extraction
* Image analysis

## Files

```text
Wavelet-Transform/
├── wavelet_transform.m
└── README.md
```

