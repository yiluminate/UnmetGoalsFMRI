% gPPI: jointly model connectivity modulation by the four feedback conditions.
% seedNames specifies seeds; analysisType selects ROI-to-ROI or seed-to-voxel analysis.
% Core CONN first-level settings: bivariate regression with no extra condition weighting.
function analysis = gppi_core(seedNames, analysisType)
analysisType = validatestring(analysisType, {'ROI-to-ROI','Seed-to-Voxel'});
assert(~isempty(seedNames), 'Specify at least one seed.');

analysis.name = 'Feedback_gPPI';
analysis.type = analysisType;
analysis.measure = 'regression (bivariate)';
analysis.weight = 'none';
analysis.modulation = 1;
sources = cellstr(string(seedNames));
analysis.sources = sources(:)';
analysis.conditions = {'Reward-obtained','Reward-omission', ...
                       'Loss-avoidance','Loss-incurrence'};
analysis.done = 1;
end
