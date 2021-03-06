function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
num_theta = size(theta);
temp = theta;
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    temp(1) = theta(1) - alpha/m*sum(X*theta-y);
    for the = 2:num_theta
        temp(the) = theta(the) - alpha / m * sum((X*theta-y)'*X(:,the));
    end
    theta= temp;
    
% another beautiful implementation found at
% https://github.com/quinnliu/machineLearning/blob/master/supervisedLearnin
% g/linearRegressionInMultipleVariables/gradientDescentMulti.m 

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
