# Analysis Index

[Project overview](README.md) · [Experimental workflow](workflow.md) · [Representational analysis and statistical methods](1.RSA/methods-and-statistics.md) · [Supplementary-analysis methods](2.Supplementary/Supplementary.md)

The study starts with two forms of goal nonattainment. It moves from behavioral performance and feedback responses to pattern organization, candidate variables, and interregional relationships, then examines sensitivity to analysis choices and acquisition factors. The index connects each research question to its inputs, software, and outputs.

RSA methods and core code are presented separately. The supplementary analyses follow the scientific questions, with links to the relevant computations and model configurations.

## 1. Grounding the question in experience and performance

Behavioral performance and subjective experience establish the context for interpreting neural activity.

<table align="center">
<thead><tr><th align="left">ID / analysis</th><th align="left">Research question</th><th align="left">Input → output</th><th align="left">Software / materials</th></tr></thead>
<tbody>
<tr><td align="left">BEH-01 · Behavioral performance</td><td align="left">How do frame and feedback influence actual performance?</td><td align="left">E-Prime trial records → accuracy, RT, and repeated-measures comparisons</td><td align="left">MATLAB / R / Python; <a href="2.Supplementary/Supplementary.md#behavior">Methods</a></td></tr>
<tr><td align="left">BEH-02 · Subjective ratings</td><td align="left">What subjective experiences arise from the four feedback conditions?</td><td align="left">Individual ratings → condition descriptions, rating comparisons, and behavioral RDM inputs</td><td align="left">MATLAB; <a href="2.Supplementary/Supplementary.md#behavior">Methods</a></td></tr>
</tbody></table>

## 2. Mapping feedback responses in space and time

GLMs map feedback responses, while ROI and FIR analyses characterize local response amplitude and timing. Conjunction analysis identifies effects shared by specified contrasts.

<table align="center">
<thead><tr><th align="left">ID / analysis</th><th align="left">Research question</th><th align="left">Input → output</th><th align="left">Software / materials</th></tr></thead>
<tbody>
<tr><td align="left">GLM-01 · Feedback GLM</td><td align="left">Which regions show responses related to feedback, frame, and their combination?</td><td align="left">Images, events, and motion parameters → condition betas, contrast images, and group statistical maps</td><td align="left">SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#responses">Methods</a></td></tr>
<tr><td align="left">ROI-01 · ROIs and time courses</td><td align="left">How do local response amplitude and time course vary?</td><td align="left">Atlas ROIs, condition estimates, and time series → ROI parameters and FIR curves</td><td align="left">SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#responses">Methods</a></td></tr>
<tr><td align="left">CONJ-01 · Conjunction analysis</td><td align="left">Which regions respond jointly in specified feedback contrasts?</td><td align="left">Component contrast images → conjunction-null inference maps and spatial summaries</td><td align="left">SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#responses">Methods</a>; <a href="2.Supplementary/conjunction_core.m">Core code</a></td></tr>
</tbody></table>

**Condition beta images provide the input to subsequent RSA**: they connect univariate estimation to the multivoxel representational analysis.

## 3. Moving from response amplitude to representational organization

Core RSA compares between-condition distances with theoretical structures. Decoding tests generalization across frames, while behavioral–neural RSA relates pattern structure to subjective experience. Geometry and individual-difference analyses extend this exploratory work.

<table align="center">
<thead><tr><th align="left">ID / analysis</th><th align="left">Research question</th><th align="left">Input → output</th><th align="left">Software / materials</th></tr></thead>
<tbody>
<tr><td align="left">RSA-01 · Neural RDMs</td><td align="left">How are multivoxel pattern distances arranged across four conditions?</td><td align="left">Condition betas + ROI → individual neural RDMs</td><td align="left">MATLAB; <a href="1.RSA/methods-and-statistics.md">Construction methods</a>; <a href="assets/representational-geometry.png">Core Figure 2</a></td></tr>
<tr><td align="left">RSA-02 · Candidate-model comparison</td><td align="left">Which candidate structure better fits the observed matrices?</td><td align="left">Neural RDMs + theoretical models → individual fits, paired comparisons, and figures</td><td align="left">MATLAB; <a href="1.RSA/rsa_core.m">Core code</a>; <a href="1.RSA/methods-and-statistics.md#statistics">Statistical methods</a>; <a href="assets/model-comparison.png">Core Figure 3</a></td></tr>
<tr><td align="left">DEC-01 · Cross-frame decoding</td><td align="left">Can feedback discrimination in one frame generalize to another?</td><td align="left">LSS single-trial betas + labels → bidirectional decoding, balanced accuracy, and randomization tests</td><td align="left">SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#representations">Methods</a></td></tr>
<tr><td align="left">RSA-03 · Behavioral–neural correspondence</td><td align="left">How do experiential and neural structures correspond?</td><td align="left">Individual ratings and neural RDMs → individual correlations and group-level tests</td><td align="left">MATLAB; <a href="1.RSA/methods-and-statistics.md">Methods</a>; <a href="assets/representational-geometry.png">Core Figure 2</a></td></tr>
<tr><td align="left">GEO-01 · Geometry and model specifications</td><td align="left">How do geometric descriptions and model specifications characterize representational structure?</td><td align="left">RDMs and models → geometric illustrations, model specifications, and low-dimensional plots</td><td align="left">MATLAB; exploratory <a href="2.Supplementary/Supplementary.md#representations">methods</a></td></tr>
<tr><td align="left">IND-01 · Individual differences</td><td align="left">How are individual representational differences related to experience?</td><td align="left">Individual model fits and behavioral measures → association plots and summaries</td><td align="left">MATLAB; exploratory <a href="2.Supplementary/Supplementary.md#representations">methods</a></td></tr>
</tbody></table>

## 4. Defining the comparison before examining candidate variables

Condition groupings describe the overall structure. The next analyses use goal attainment as the reference and examine how trial-level value and surprise relate to feedback responses.

<table align="center">
<thead><tr><th align="left">ID / analysis</th><th align="left">Research question</th><th align="left">Input → output</th><th align="left">Software / materials</th></tr></thead>
<tbody>
<tr><td align="left">REF-01 · Success-referenced coding</td><td align="left">How are within-frame feedback effects expressed relative to successful outcomes?</td><td align="left">Recoded variables, images, and events → coefficients and contrast images</td><td align="left">SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#variables">Methods</a></td></tr>
<tr><td align="left">PM-01 · Value and surprise</td><td align="left">How do responses vary with signed value and model-derived surprise?</td><td align="left">Trial-level variables + feedback GLM → modulation coefficients and frame comparisons</td><td align="left">SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#variables">Methods</a>; <a href="2.Supplementary/pm_core.m">Core code</a></td></tr>
<tr><td align="left">PM-02 · Reference violation</td><td align="left">How is reference violation related to feedback responses?</td><td align="left">Reference-violation variable + feedback GLM → modulation estimates and regional summaries</td><td align="left">SPM / MATLAB; exploratory <a href="2.Supplementary/Supplementary.md#variables">methods</a></td></tr>
</tbody></table>

## 5. From local patterns to interregional coupling

PPI/gPPI examines how relationships between regional time series vary with the task. BSC asks whether trial-level responses covary within each condition. Together, they describe interregional coupling at the time-series and trial-response levels.

<table align="center">
<thead><tr><th align="left">ID / analysis</th><th align="left">Research question</th><th align="left">Input → output</th><th align="left">Software / materials</th></tr></thead>
<tbody>
<tr><td align="left">PPI-01 · PPI/gPPI</td><td align="left">How does interregional connectivity vary with feedback condition?</td><td align="left">Seed time series, task, and confounds → seed-to-voxel / ROI-to-ROI connectivity</td><td align="left">CONN / SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#connectivity">Methods</a>; <a href="2.Supplementary/gppi_core.m">Core configuration</a></td></tr>
<tr><td align="left">BSC-01 · Beta-series correlation</td><td align="left">Do regional responses fluctuate together across trials of the same condition?</td><td align="left">LSS beta series → correlations, Fisher z values, and condition comparisons</td><td align="left">SPM / MATLAB; <a href="2.Supplementary/Supplementary.md#connectivity">Methods</a>; <a href="2.Supplementary/bsc_core.m">Core code</a></td></tr>
</tbody></table>

## 6. Assessing sensitivity to analysis choices and acquisition factors

Sensitivity checks are linked to specific measures, covering rating dimensions, participant influence, model specifications, and acquisition quality.

<table align="center">
<thead><tr><th align="left">ID / analysis</th><th align="left">Research question</th><th align="left">Input → output</th><th align="left">Software / materials</th></tr></thead>
<tbody>
<tr><td align="left">SENS-01 · Rating dimensions</td><td align="left">Does behavioral representation depend on specific rating dimensions?</td><td align="left">Complete and reduced ratings → reconstructed RDMs and corresponding comparisons</td><td align="left">MATLAB; <a href="1.RSA/methods-and-statistics.md">Methods</a></td></tr>
<tr><td align="left">SENS-02 · Participants and models</td><td align="left">How do participant or model choices influence estimates?</td><td align="left">Participant and model specifications → comparison summaries and sensitivity plots</td><td align="left">MATLAB; exploratory <a href="2.Supplementary/Supplementary.md#representations">methods</a></td></tr>
<tr><td align="left">SENS-03 · Order, FD, and tSNR</td><td align="left">How are acquisition order and imaging quality associated with analytical measures?</td><td align="left">Order, quality, and target measures → covariate models and comparisons before and after adjustment</td><td align="left">MATLAB / SPM; <a href="2.Supplementary/Supplementary.md#sensitivity">Methods</a>; <a href="2.Supplementary/sensitivity_core.m">Frame-fit code</a></td></tr>
</tbody></table>

## Navigation and code

- [Experimental workflow](workflow.md): research concept, pilot testing, recruitment, on-site preparation, scanning, and data transfer.
- [Representational analysis and statistical methods](1.RSA/methods-and-statistics.md): condition patterns, RDMs, behavioral–neural correspondence, model comparisons, and sensitivity analyses.
- [Core RSA code](1.RSA/rsa_core.m): multivoxel patterns, neural distances, and candidate-model fits.
- [Supplementary-analysis methods](2.Supplementary/Supplementary.md): six groups of scientific questions and each method's inputs and outputs.
- [PM](2.Supplementary/pm_core.m), [PPI/gPPI](2.Supplementary/gppi_core.m), [BSC](2.Supplementary/bsc_core.m), [sensitivity](2.Supplementary/sensitivity_core.m), and [conjunction analysis](2.Supplementary/conjunction_core.m): separate core computation or configuration files.
