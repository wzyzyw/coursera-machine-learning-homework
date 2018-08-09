function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%使用find函数找到1和0的位置，然后画图，该图实际上同一个横纵坐标，引入第三个变量，但这个变量是离散值，可以用不同的符号区分
pos=find(y==1);
neg=find(y==0);
plot(X(pos,1),X(pos,2),'k+','MarkerSize',7);
plot(X(neg,1),X(neg,2),'ko','MarkerSize',7,'MarkerFaceColor','r');









% =========================================================================



hold off;

end
