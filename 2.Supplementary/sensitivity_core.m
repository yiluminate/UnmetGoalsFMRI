% Sensitivity analysis: relate Frame-model fits to order, motion, and signal-quality differences.
% frameFit contains individual fits for one ROI; order numerically codes acquisition order.
% Columns of fd and tsnr are reward and loss sessions, respectively; rows are participants.
% Use standardized absolute session differences; the intercept estimates fit at the covariate means.
function statistics = sensitivity_core(frameFit, order, fd, tsnr)
y = double(frameFit(:));
assert(size(fd,2)==2 && size(tsnr,2)==2, 'Quality arrays require two sessions.');
covariates = [double(order(:)),abs(fd(:,2)-fd(:,1)),abs(tsnr(:,2)-tsnr(:,1))];
assert(size(covariates,1)==numel(y) && ...
       all(isfinite([y;covariates(:)])), 'Participant rows must match and be finite.');
assert(all(std(covariates,0,1)>0), 'Covariates must vary across participants.');

X = [ones(numel(y),1),zscore(covariates,0,1)];
assert(rank(X)==size(X,2) && size(X,1)>size(X,2), 'Check design rank and sample size.');
beta = X\y;
residual = y-X*beta;
df = size(X,1)-rank(X);
variance = (residual'*residual)/df;
se = sqrt(diag(variance*pinv(X'*X)));
t = beta./se;
p = 2*tcdf(-abs(t),df);
term = ["Intercept";"AcquisitionOrder";"AbsFDdifference";"AbsTSNRdifference"];
statistics = table(term,beta,se,t,repmat(df,4,1),p, ...
    'VariableNames',{'Term','Beta','SE','T','DF','PTwoSided'});
end
