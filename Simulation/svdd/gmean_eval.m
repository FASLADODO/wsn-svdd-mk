function J=gmean_eval(ocSVM,trainData,trainLabel,normalData,abnormalData,x)

% Training
ocSVM.C=[x(1) 0];
ocSVM.sigma=x(2);
ocSVM=svdd_optimize(ocSVM,trainData,trainLabel);

% Evaluation
normalLabel=svdd_classify(ocSVM,normalData);
Acc_positive=length(find(normalLabel==1))/length(normalLabel)*100;
abnormalLabel=svdd_classify(ocSVM,abnormalData);
Acc_negative=length(find(abnormalLabel==-1))/length(abnormalLabel)*100;
J=sqrt(Acc_positive*Acc_negative);