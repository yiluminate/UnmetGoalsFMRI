% Core RSA: construct a neural RDM from four-condition patterns and fit three candidate models.
% Rows are feedback conditions; columns are matched voxels within an ROI.
% Condition order: Reward-obtained, Reward-omission, Loss-avoidance, Loss-incurrence.
% Outputs: a neural RDM and Spearman fits for the Outcome, Frame, and cross-grouping models.
function [rdm, fits] = rsa_core(patterns)
validateattributes(patterns, {'numeric'}, {'2d','real','finite','nrows',4});

rdm = 1 - corr(patterns');
rdm(1:5:end) = 0;
assert(all(isfinite(rdm(:))), 'Each pattern must vary across voxels.');

models = cat(3, ...
    [0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0], ...
    [0 0 1 1; 0 0 1 1; 1 1 0 0; 1 1 0 0], ...
    [0 1 1 0; 1 0 0 1; 1 0 0 1; 0 1 1 0]);

upper = triu(true(4), 1);
assert(range(rdm(upper)) > 0, 'Off-diagonal distances must vary.');
rho = zeros(1, 3);
for m = 1:3
    model = models(:, :, m);
    rho(m) = corr(rdm(upper), model(upper), 'Type', 'Spearman');
end
fits = array2table(rho, ...
    'VariableNames', {'Outcome','Frame','Interaction'});
end
