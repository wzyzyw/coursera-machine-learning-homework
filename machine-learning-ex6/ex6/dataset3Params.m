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
%%C核sigma都会影响最终的优化结果，为了找出最优的C和σ，同时把两个参数可能的结果带入，通过验证误差找出。不能先找一个在找另外一个
%%即共有mxn中组合
temp_C=[0.01,0.03,0.1,0.3,1,3,10,30];
temp_sigma=[0.01,0.03,0.1,0.3,1,3,10,30];
iter=length(temp_C);
error_val=zeros(iter,iter);
for i=1:iter
    for j=1:iter
        model= svmTrain(X, y, temp_C(i), @(x1, x2) gaussianKernel(x1, x2, temp_sigma(j)));
        prediction=svmPredict(model,Xval);
        error_val(i,j)=mean(double(prediction~=yval));
    end
end
[opc,opsigma]=find(error_val==min(min(error_val)));
C=temp_C(opc);
sigma=temp_sigma(opsigma);






% =========================================================================

end
