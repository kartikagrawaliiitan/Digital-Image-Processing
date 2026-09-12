# Huffman Coding for Image Compression

## Overview

Huffman Coding is a **lossless data compression technique** used in Digital Image Processing (DIP).

It assigns **shorter binary codes to frequently occurring pixels** and longer codes to less frequent pixels. Since the coding is lossless, the original image can be reconstructed without losing information.

## Working

The Huffman coding process is:

1. Read the input image.
2. Convert the image to grayscale if required.
3. Calculate the frequency of each gray-level value.
4. Calculate the probability of each symbol.
5. Create the Huffman dictionary.
6. Assign binary codes based on symbol probabilities.
7. Calculate the compressed size and compression performance.
8. Display computational results.

### Basic Principle

High-frequency symbols → **Shorter codes**

Low-frequency symbols → **Longer codes**

## Mathematical Parameters

### Entropy

Entropy represents the average information content of the image.

$$
H = -\sum_{i=1}^{n} p_i \log_2(p_i)
$$

where \(p_i\) is the probability of the \(i^{th}\) symbol.

### Average Code Length

$$
L = \sum_{i=1}^{n} p_i l_i
$$

where \(l_i\) is the length of the Huffman code.

### Compression Ratio

$$
CR = \frac{\text{Original Bits}}{\text{Compressed Bits}}
$$

### Compression Percentage

$$
\text{Compression \%} =
\left(1-\frac{\text{Compressed Bits}}
{\text{Original Bits}}\right)\times100
$$

### Coding Efficiency

$$
\eta = \frac{H}{L}\times100
$$


### Computational Results

The program displays:

```text
Image Size
Total Pixels
Bits per Pixel
Original Size
Number of Symbols
Entropy
Average Code Length
Compressed Size
Bits Saved
Compression Ratio
Compression Percentage
Coding Efficiency
Execution Time
CPU Time Used
```

## Key Point

Huffman Coding is a **lossless compression method**. It reduces the number of bits required to represent an image by using variable-length prefix codes based on symbol frequency.

It is widely used in data and image compression because frequently occurring symbols receive shorter codes.
