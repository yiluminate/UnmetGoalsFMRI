% Conjunction analysis: identify locations significant in both directional feedback contrasts.
% T maps share a whole-brain grid; critical values come from each component's SPM whole-brain FWE correction.
% criticalT holds reward and loss thresholds; alpha is allocated across directional comparisons.
% Intersect the thresholded component maps and retain the minimum t value within the intersection.
function [conjunctionMask, thresholdedMinT] = conjunction_core(tReward,tLoss,criticalT)
assert(isequal(size(tReward),size(tLoss)), 'Component maps must share a voxel grid.');
validateattributes(criticalT, {'numeric'}, {'real','finite','positive','numel',2});
valid = isfinite(tReward) & isfinite(tLoss);
conjunctionMask = valid & tReward>=criticalT(1) & tLoss>=criticalT(2);

minimumT = min(tReward,tLoss);
thresholdedMinT = zeros(size(minimumT));
thresholdedMinT(conjunctionMask) = minimumT(conjunctionMask);
end
