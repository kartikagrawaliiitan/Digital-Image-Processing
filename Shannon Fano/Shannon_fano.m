clc;
clear;
close all;

%% Start computational time
tic;

%% Read Image
img = imread('wheat.jpg');

if size(img,3) == 3
    img = rgb2gray(img);
end

[rows, cols] = size(img);
totalPixels = numel(img);

fprintf('       SHANNON-FANO IMAGE COMPRESSION\n');
fprintf('\nImage Information:\n');
fprintf('Image Size       : %d x %d pixels\n', rows, cols);
fprintf('Total Pixels     : %d\n', totalPixels);
fprintf('Bits per Pixel   : 8\n');
fprintf('Original Size    : %d bits\n', totalPixels * 8);

%% Histogram
[counts, grayLevels] = imhist(img);

% Remove zero-frequency gray levels
idx = counts > 0;
symbols = grayLevels(idx);
freq = counts(idx);

%% Calculate probabilities
prob = freq / totalPixels;

%% Sort according to decreasing probability
[prob, order] = sort(prob, 'descend');

symbols = symbols(order);
freq = freq(order);

%% Generate Shannon-Fano codes

codes = cell(length(symbols),1);
codes = shannonFano(prob, codes, 1, length(symbols));

%% Display Table
fprintf('\nGray Level | Frequency | Probability | Code\n');
for i = 1:length(symbols)

    fprintf('%10d  %9d  %11.5f  %s\n', ...
        symbols(i), freq(i), prob(i), codes{i});

end

%% Code Length
codeLength = cellfun(@length, codes);

%% Average Code Length
avgLength = sum(prob .* codeLength);

%% Entropy
entropyValue = -sum(prob .* log2(prob));

%% Original Bits
originalBits = totalPixels * 8;

%% Compressed Bits
compressedBits = sum(freq .* codeLength);

%% Compression Ratio
compressionRatio = originalBits / compressedBits;

%% Percentage Compression
compressionPercentage = ...
    (1 - compressedBits/originalBits) * 100;

%% Redundancy
redundancy = avgLength - entropyValue;

%% Display Computational Results
fprintf('\n        COMPUTATIONAL RESULTS\n');

fprintf('\nNumber of Symbols       : %d\n', length(symbols));

fprintf('Entropy                 : %.5f bits/pixel\n', ...
    entropyValue);

fprintf('Average Code Length     : %.5f bits/pixel\n', ...
    avgLength);

fprintf('Original Bits           : %d bits\n', ...
    originalBits);

fprintf('Compressed Bits         : %d bits\n', ...
    compressedBits);

fprintf('Bits Saved              : %d bits\n', ...
    originalBits - compressedBits);

fprintf('Compression Ratio       : %.5f\n', ...
    compressionRatio);

fprintf('Compression Percentage  : %.2f %%\n', ...
    compressionPercentage);

fprintf('Coding Redundancy       : %.5f bits/pixel\n', ...
    redundancy);

%% Execution Time
executionTime = toc;

fprintf('\nExecution Time          : %.6f seconds\n', ...
    executionTime);


function codes = shannonFano(prob, codes, first, last)

    % If only one symbol is present
    if first == last

        if isempty(codes{first})
            codes{first} = '0';
        end

        return;
    end

    % Total probability of current group
    total = sum(prob(first:last));

    cumulative = 0;
    minDiff = inf;
    split = first;

    % Find division point closest to half
    for i = first:last-1

        cumulative = cumulative + prob(i);

        difference = abs(total/2 - cumulative);

        if difference < minDiff

            minDiff = difference;
            split = i;

        end
    end

    % Assign 0 to first group
    for i = first:split
        codes{i} = [codes{i} '0'];
    end

    % Assign 1 to second group
    for i = split+1:last
        codes{i} = [codes{i} '1'];
    end

    % Recursively divide first group
    codes = shannonFano(prob, codes, first, split);

    % Recursively divide second group
    codes = shannonFano(prob, codes, split+1, last);

end
