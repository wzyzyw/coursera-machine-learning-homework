function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
temp_h=sigmoid(X*theta);
temp=ones(m,1);
temp1=(-1).*(y'*log(temp_h));
temp2=(-1).*((temp-y)'*log(temp-temp_h));
J1=(temp1+temp2)/m;
r_theta=theta(2:end);
J2=lambda/(2*m)*(r_theta'*r_theta);
J=J1+J2;
temp_grad=1/m.*(X'*(temp_h-y));
grad(1)=temp_grad(1);
grad(2:end)=temp_grad(2:end)+lambda/m.*theta(2:end);





% =============================================================

end
