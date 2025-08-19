
column_vector = -2 + 4 * rand(160, 1); % Column vector with 160 random values
row_vector = -2 + 4 * rand(1, 100); % Row vector with 100 random values

matrix = column_vector * row_vector; % Matrix multiplication to create a 160x100 matrix

PlotHist(matrix);

% Step 1: Generate Random Vectors
column_vector = -2 + 4 * rand(160, 1); % Column vector with 160 random values
row_vector = -2 + 4 * rand(1, 100); % Row vector with 100 random values

% Step 2: Create the Matrix
matrix = column_vector * row_vector; % Matrix multiplication to create a 160x100 matrix

% Step 4: Call the Function to Plot the Histogram
PlotHist(matrix);

% Step 3: User-Defined Function PlotHist
function PlotHist(matrix)
    positive_values = [];
    
    % Use for loop to find all positive values in the matrix
    for i = 1:size(matrix, 1)
        for j = 1:size(matrix, 2)
            if matrix(i, j) > 0
                positive_values = [positive_values, matrix(i, j)];
            end
        end
    end
    
    % Plot histogram with 200 bins
    histogram(positive_values, 200);
    xlabel('Value');
    ylabel('Frequency');
    title('Histogram of Positive Values');
end