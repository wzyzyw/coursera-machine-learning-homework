function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%
mu=mean(X)';
%sigma2=var(X)';直接使用var函数求方差不能通过系统检测，但实际中应该可以用var函数。
temp=[];
for i=1:m
    temp=[temp;mu'];
end
temp_var=(X-temp)'*(X-temp);
for i=1:n
    sigma2(i)=temp_var(i,i);
end
sigma2=sigma2./m;









% =============================================================


end
