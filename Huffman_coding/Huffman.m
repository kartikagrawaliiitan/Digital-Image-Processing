clc;
clear;
close all;

%% Start measuring time
startCPU = cputime;
tic;

%% Read the image
img = imread('wheat.jpg');

% Convert RGB image to grayscale
if size(img, 3) == 3
    img = rgb2gray(img);
end

%% Image information
[rows, cols] = size(img);
totalPixels = numel(img);
fprintf('\n          HUFFMAN IMAGE COMPRESSION\n');

fprintf('\nImage Information:\n');
fprintf('Image Size       : %d x %d pixels\n', rows, cols);
fprintf('Total Pixels     : %d\n', totalPixels);
fprintf('Bits per Pixel   : 8\n');
fprintf('Original Size    : %d bits\n', totalPixels * 8);

%% Find frequency of each gray level
[counts, grayLevels] = imhist(img);

% Remove gray levels which do not occur
valid = counts > 0;

symbols = grayLevels(valid);
frequency = counts(valid);

%% Calculate probability
probability = frequency / totalPixels;

%% Create Huffman dictionary
huffmanDict = huffmandict(symbols, probability);

%% Display Huffman coding table
fprintf('\nGray Level | Frequency | Probability | Code\n');

for i = 1:length(symbols)

    code = huffmanDict{i, 2};

    % Convert code into readable binary form
    codeString = sprintf('%d', code);

    fprintf('%10d  %9d  %11.5f  %s\n', ...
        symbols(i), frequency(i), probability(i), codeString);

end

%% Calculate code lengths
codeLengths = zeros(length(symbols), 1);

for i = 1:length(symbols)
    codeLengths(i) = length(huffmanDict{i, 2});
end

%% Average Code Length
averageCodeLength = sum(probability .* codeLengths);

%% Entropy
entropyValue = -sum(probability .* log2(probability));

%% Calculate compressed size
compressedBits = sum(frequency .* codeLengths);

%% Original image size
originalBits = totalPixels * 8;

%% Bits saved
bitsSaved = originalBits - compressedBits;

%% Compression ratio
compressionRatio = originalBits / compressedBits;

%% Compression percentage
compressionPercentage = ...
    (bitsSaved / originalBits) * 100;

%% Coding efficiency
efficiency = (entropyValue / averageCodeLength) * 100;

%% Measure computational time
executionTime = toc;

%% CPU time used
cpuTimeUsed = cputime - startCPU;

%% Display final results
fprintf('\n          COMPUTATIONAL RESULTS\n');

fprintf('\nNumber of Symbols      : %d\n', length(symbols));

fprintf('Entropy                : %.5f bits/pixel\n', ...
    entropyValue);

fprintf('Average Code Length    : %.5f bits/pixel\n', ...
    averageCodeLength);

fprintf('Original Size          : %d bits\n', ...
    originalBits);

fprintf('Compressed Size        : %d bits\n', ...
    compressedBits);

fprintf('Bits Saved             : %d bits\n', ...
    bitsSaved);

fprintf('Compression Ratio      : %.5f\n', ...
    compressionRatio);

fprintf('Compression Percentage : %.2f %%\n', ...
    compressionPercentage);

fprintf('Coding Efficiency      : %.2f %%\n', ...
    efficiency);

fprintf('\nExecution Time         : %.6f seconds\n', ...
    executionTime);

fprintf('CPU Time Used          : %.6f seconds\n', ...
    cpuTimeUsed);

