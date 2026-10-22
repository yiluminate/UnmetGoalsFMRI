% Parametric modulation: jointly specify signed value and model-derived surprise at feedback.
% Inputs follow feedback trials within one session; onsets and durations are in seconds.
% Standardize each modulator within the session; set SPM serial orthogonalization to 0.
% Output: a feedback-condition structure for a first-level GLM.
function feedback = pm_core(onsets, duration, signedValue, surprise)
onsets = double(onsets(:));
signedValue = double(signedValue(:));
surprise = double(surprise(:));
assert(numel(onsets)==numel(signedValue) && ...
       numel(onsets)==numel(surprise), 'Event vectors must have equal lengths.');
assert(all(isfinite([onsets;signedValue;surprise])) && ...
       std(signedValue)>0 && std(surprise)>0, 'PM vectors must be finite and variable.');
assert(isscalar(duration) || numel(duration)==numel(onsets), 'Check durations.');
validateattributes(duration, {'numeric'}, {'real','finite','nonnegative'});

feedback.name = 'Feedback';
feedback.onset = onsets;
feedback.duration = duration(:);
feedback.tmod = 0;
feedback.pmod(1) = struct('name','SignedValue', ...
    'param',zscore(signedValue,0),'poly',1);
feedback.pmod(2) = struct('name','Surprise', ...
    'param',zscore(surprise,0),'poly',1);
feedback.orth = 0;
end
