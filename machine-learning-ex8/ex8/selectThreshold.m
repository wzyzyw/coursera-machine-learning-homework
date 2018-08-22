function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions\
    %matlab中关系、逻辑运算都是对矩阵元素进行操作，返回相同size的0，1构成的矩阵或矢量
    %通过关系逻辑运算代替循环，简化算法
    predict_anomalous=zeros(size(pval));
    predict_anomalous(find(pval<epsilon))=1;
    tp=sum((predict_anomalous==1)&(yval==1));
    all_predict_anomalous=sum(predict_anomalous==1);
    precise=tp/all_predict_anomalous;
    all_actual_anomalous=sum(yval==1);
    recall=tp/all_actual_anomalous;
    F1=2*precise*recall/(precise+recall);
        













    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
