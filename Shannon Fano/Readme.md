
# Shannon-Fano Coding – Digital Image Processing

## 📌 Overview

**Shannon-Fano Coding** is a **lossless data compression technique** used in Digital Image Processing. It assigns shorter binary codes to frequently occurring pixel intensity values and longer codes to less frequent values.

## ⚙️ Working

1. Read the input image.
2. Calculate the frequency of each gray-level intensity.
3. Calculate the probability of each intensity.
4. Sort the symbols in decreasing order of probability.
5. Divide the symbols into two groups with nearly equal total probability.
6. Assign `0` to one group and `1` to the other.
7. Repeat the process recursively until every symbol has a unique code.

## 📐 Important Equations

### Entropy

$$
H = -\sum p_i \log_2(p_i)
$$

### Average Code Length

$$
L = \sum p_i l_i
$$

### Compression Ratio

$$
CR = \frac{\text{Original Bits}}{\text{Compressed Bits}}
$$

## 🖼️ MATLAB Implementation

The MATLAB program:

* Reads a grayscale image
* Generates the image histogram
* Calculates pixel probabilities
* Generates Shannon-Fano codes
* Calculates entropy and average code length
* Calculates compressed size and compression ratio
* Displays execution time


## 🎯 Key Point

Shannon-Fano coding is **lossless**, meaning the original image information can be recovered without losing pixel data.

> **DIP Topic:** Image Compression / Entropy Coding
