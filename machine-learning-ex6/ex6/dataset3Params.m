function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

candidates = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; % possible values for C and sigma
minError = 100000.0; % the min prediction error initialized
Error = 100000.0; % the prediction error initialized

for C_value = candidates
    for sigma_value = candidates
        % train the model corresponding to the parameters specified
        model = svmTrain(X, y, C_value, @(x1, x2) gaussianKernel(x1, x2, sigma_value)); 
        % make predictions based on the model trained
        predictions = svmPredict(model, Xval);
        % prediction error
        Error = mean(double(predictions ~= yval));
        if Error < minError % smaller error, better parameters setting
            C = C_value;
            sigma = sigma_value;
            minError = Error;
        end
    end
end





% =========================================================================

end
