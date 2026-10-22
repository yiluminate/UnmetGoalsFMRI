% BSC: calculate Pearson correlations between two ROI beta series within each feedback condition.
% Columns of betaSeries are two ROIs; each row corresponds to the same LSS target trial.
% Fisher z-transformed condition coefficients support group-level within-participant comparisons.
% difference is the within-loss feedback difference minus the within-reward feedback difference.
function [summary, difference] = bsc_core(betaSeries, trialCondition)
validateattributes(betaSeries, {'numeric'}, {'2d','real','finite','ncols',2});
trialCondition = string(trialCondition(:));
assert(size(betaSeries,1)==numel(trialCondition), 'Trial labels must match rows.');
conditions = ["Reward-obtained";"Reward-omission"; ...
              "Loss-avoidance";"Loss-incurrence"];
assert(all(ismember(trialCondition,conditions)), 'Unknown condition label.');
r = zeros(4,1);
nTrials = zeros(4,1);
for c = 1:4
    values = betaSeries(trialCondition==conditions(c),:);
    nTrials(c) = size(values,1);
    assert(nTrials(c)>=3 && all(std(values,0,1)>0), 'Check matched trial series.');
    r(c) = corr(values(:,1),values(:,2),'Type','Pearson');
end
assert(all(isfinite(r) & abs(r)<1), 'Fisher z requires finite non-unit correlations.');
z = atanh(r);
summary = table(conditions,nTrials,r,z, ...
    'VariableNames',{'Condition','Trials','PearsonR','FisherZ'});
difference = (z(4)-z(3)) - (z(2)-z(1));
end
