# Supplementary Analysis Methods

[Project overview](../README.md) · [Analysis index](../analysis-index.md) · [Core RSA code](../1.RSA/rsa_core.m) · [Experimental workflow](../workflow.md)

The analyses move from participants' experiences to feedback responses, representational organization, candidate variables, interregional coupling, and sensitivity checks. Each entry describes its purpose, inputs, methods, software, outputs, and my contribution. This sequence connects the research questions across analysis approaches.

<a id="behavior"></a>

## 1. How do the two forms of goal nonattainment differ in performance and experience?

Actual performance and subjective experience are characterized separately before examining feedback-related brain activity.

### Behavioral performance and subjective ratings

- **Purpose:** Describe performance and subjective experience under different task frames and feedback conditions, providing behavioral measures for imaging analyses.
- **Input data types:** E-Prime trial records containing condition labels, responses, actual response accuracy, and reaction times; postscan subjective ratings.
- **Methods:** Participant and condition records were matched, and behavioral measures were summarized by condition. Actual accuracy, reaction time, and frustration ratings were analyzed with frame × feedback repeated-measures ANOVAs. The other rating dimensions were prepared for behavioral RDM construction.
- **Software:** E-Prime for task presentation and recording; MATLAB for analysis, with R and Python supporting data preparation and additional statistics.
- **Outputs:** Trial tables, participant × condition summaries, statistical-test tables, and plots of behavior and ratings.
- **My contribution:** Administered the task, collected behavioral and rating data, matched files, organized the data, performed statistical analyses, and prepared figures.

<a id="responses"></a>

## 2. Where do feedback responses differ, and which responses are shared?

Whole-brain GLMs map feedback responses. ROI and FIR analyses characterize local response amplitude and timing, while conjunction analysis identifies regions showing effects in both specified contrasts.

### Imaging preprocessing and feedback GLMs

- **Purpose:** Estimate feedback-related BOLD responses, examine task frame, feedback type, and their interaction, and generate parameter images for subsequent ROI and multivoxel analyses.
- **Input data types:** Individual functional and structural images, experimental event times, condition labels, and head-motion parameters.
- **Methods:** Preprocessing comprised slice-timing correction, motion correction, spatial normalization, and smoothing. Reward and loss scanning sessions were modeled separately, with regressors for feedback conditions, calculation, and response periods, alongside motion parameters. Models used a hemodynamic response function, high-pass filtering, and temporal autocorrelation modeling. Participant-level contrast images were carried forward to group-level tests.
- **Software:** MATLAB and SPM.
- **Outputs:** Preprocessed images, design matrices, beta images, individual contrast images, and group-level statistical maps.
- **My contribution:** Organized images and event files, configured and ran preprocessing and statistical models, specified contrasts, checked outputs, and prepared inputs for subsequent analyses.

### Atlas ROIs and time-course analysis

- **Purpose:** Estimate and test condition effects within fixed anatomical regions and describe postfeedback time courses.
- **Input data types:** Atlas ROI masks, first-level GLM parameter and contrast images, individual functional time series, and event times.
- **Methods:** Condition estimates were extracted using fixed atlas masks. Small-volume correction (SVC) was applied within predefined search volumes, with additional correction for multiple comparisons across ROIs. Finite impulse response (FIR) models characterized time courses. Further analyses assessed hemispheric effects and the influence of individual participants.
- **Software:** MATLAB and SPM.
- **Outputs:** ROI masks, individual condition-estimate tables, ROI test tables, FIR curves, and sensitivity figures and tables.
- **My contribution:** Configured atlas masks, extracted individual values, ran regional statistics and time-course models, and organized participant- and condition-level outputs.

### Conjunction analysis of shared feedback effects

[Core code: conjunction analysis](conjunction_core.m)

- **Purpose:** Identify univariate effects present in both the reward-frame and loss-frame feedback contrasts.
- **Input data types:** Individual feedback contrast images for the two frames and their corresponding group-level models.
- **Methods:** Conjunction-null inference was used to identify locations where both component contrasts met the statistical criteria. Spatial summaries documented these locations and the multiple-comparison correction applied to the component tests.
- **Software:** MATLAB and SPM.
- **Outputs:** Component statistical maps, conjunction maps, localization tables, and visualizations.
- **My contribution:** Organized component contrasts, ran conjunction tests, and prepared spatial outputs and associated method records.

<a id="representations"></a>

## 3. From shared responses to representational organization

After identifying shared responses, the next question concerns the organization of patterns within regions. Core RSA compares candidate structures, decoding tests generalization across frames, and behavioral–neural RSA relates neural patterns to subjective experience. Geometry and individual differences provide further exploratory perspectives.

### Behavioral and neural representational similarity analysis

- **Purpose:** Describe representational structure across conditions, examine correspondence between subjective-rating structure and neural patterns, and compare candidate representational models.
- **Input data types:** Individual condition beta images, ROI masks, subjective ratings, and candidate-model RDMs.
- **Methods:** Neural RDMs were constructed using 1 − Pearson r, and behavioral RDMs using Euclidean distances between standardized ratings. Spearman correlations assessed behavioral–neural correspondence and model fits. Participant-level estimates entered group comparisons, with sensitivity analyses examining the removal of rating dimensions.
- **Software:** MATLAB, with SPM for the preceding parameter-estimation step.
- **Outputs:** Participant-level RDM arrays, correlation and model-fit tables, model-comparison tables, matrix plots, and participant scatterplots.
- **My contribution:** Organized condition patterns and ratings, calculated RDMs, fitted models, performed statistical comparisons and sensitivity analyses, and prepared figures and tables. Details are provided in [Representational analysis and statistical methods](../1.RSA/methods-and-statistics.md#statistics).

### Cross-frame decoding

- **Purpose:** Examine whether patterns that distinguish feedback types in one task frame generalize to the other frame.
- **Input data types:** LSS single-trial beta images, trial labels, frame labels, and ROI masks.
- **Methods:** Each target feedback trial was estimated with a least-squares-separate (LSS) model. A nearest-centroid classifier was trained in one frame and tested in the other, in both directions. Performance was summarized with balanced accuracy. Statistical inference used label permutations and participant-level sign flipping.
- **Software:** MATLAB and SPM.
- **Outputs:** Single-trial parameter images, individual classification measures, permutation distributions, group-level test tables, and decoding figures.
- **My contribution:** Matched trial estimates to labels, ran cross-frame training and testing, performed permutation tests, summarized participant-level measures, and prepared outputs.

### Further representational analyses

- **Purpose:** Examine representational structure in relation to rating dimensions, participant contributions, and low-dimensional geometry, and explore individual differences.
- **Input data types:** Individual behavioral and neural RDMs, model vectors, subjective ratings, and individual behavioral measures.
- **Methods:** Analyses included removing rating dimensions one at a time, assessing leave-one-participant-out consistency, examining model-orthogonalization settings, and comparing RDMs between ROIs. Multidimensional scaling (MDS) and projections along geometric directions described the structure. Individual-difference analyses related neural model fits to behavioral measures.
- **Software:** MATLAB.
- **Outputs:** Dimension- and participant-sensitivity tables, low-dimensional coordinates, geometric illustrations, and exploratory association plots.
- **My contribution:** Organized inputs, compared representational methods, configured analyses, and prepared figures and tables.

<a id="variables"></a>

## 4. How are condition differences related to goals, value, and surprise?

The comparison is first defined relative to successful outcomes, followed by analyses relating candidate variables to feedback responses. Success-referenced reparameterization sets the comparison baseline, and parametric modulation examines trial-level variables. Signed value, model-derived surprise, and reference violation are documented separately.

### Success-referenced reparameterization of feedback

- **Purpose:** Organize within-frame feedback differences and cross-frame comparisons using the successful outcome in each frame as the reference.
- **Input data types:** Feedback conditions, event times, functional images, and nuisance regressors.
- **Methods:** Successful and goal-nonattainment outcomes were encoded as a binary variable and centered within each frame. Feedback GLMs estimated frame-specific coefficients, averages across frames, and differences between frames.
- **Software:** MATLAB and SPM.
- **Outputs:** Coding and design matrices, individual parameter and contrast images, and whole-brain and ROI summary tables.
- **My contribution:** Prepared the coding, configured models and contrasts, estimated the models, and summarized whole-brain and regional outputs.

### Parametric modulation (PM)

[Core code: parametric modulation](pm_core.m)

- **Purpose:** Examine how feedback-related BOLD signals vary with trial-level value and surprise, and whether these relationships differ between frames.
- **Input data types:** Feedback event times, monetary amounts and outcome sequences, modulation variables generated by a sequence model, functional images, and motion parameters.
- **Methods:** Signed value and model-derived surprise were standardized separately within each frame's scanning session. Both modulators entered the same first-level feedback GLM, with SPM's serial orthogonalization disabled. Analyses estimated modulation within each frame, averages across frames, and direct between-frame contrasts, followed by covariate sensitivity analyses.
- **Related exploration:** A separate exploratory PM used a reference-violation variable, with feedback modulation estimates summarized within ROIs. Reference violation and sequence-model-derived surprise are described separately.
- **Software:** MATLAB and SPM.
- **Outputs:** Trial-level modulators, design matrices, modulation-coefficient maps, contrast images, and whole-brain/ROI summary tables.
- **My contribution:** Organized outcome sequences, generated modulation variables, configured and ran PM models, specified contrasts, and prepared outputs.

<a id="connectivity"></a>

## 5. From local patterns to interregional coupling

Two approaches examine interregional coupling: task-related relationships between regional time series and covariation in trial-level responses within each condition. They address the time-series and trial-amplitude levels, respectively.

### PPI/gPPI connectivity analysis

[Core code: gPPI model configuration](gppi_core.m)

- **Purpose:** Examine whether functional connectivity between a seed region and other regions varies with feedback condition.
- **Input data types:** Functional and structural images, ROI masks, feedback conditions and event times, and confound variables such as head motion.
- **Methods:** Generalized psychophysiological interaction (gPPI) analyses used CONN for data import, denoising, seed-signal extraction, first-level modeling, and group-level contrasts. All four feedback conditions were modeled together to estimate condition-specific connectivity modulation. The analysis scope is specified using named ROI-to-ROI or seed-to-voxel options.
- **Software:** MATLAB, CONN, and SPM.
- **Outputs:** Participant-level connectivity estimates, seed-to-voxel maps, ROI-to-ROI connectivity matrices, group-level models, and execution logs.
- **My contribution:** Organized inputs across scanning sessions, configured seeds, conditions, and connectivity models, ran first- and group-level analyses, and prepared outputs.

### Beta-series correlation (BSC)

[Core code: beta-series correlation](bsc_core.m)

- **Purpose:** Examine covariation in the responses of two ROIs across trials of the same feedback condition, and compare this coupling between conditions. BSC denotes beta-series correlation.
- **Input data types:** LSS single-trial beta images, ROI masks, trial conditions, and participant identifiers.
- **Methods:** Mean ROI estimates were extracted from each target trial's beta image. The two regions' beta series were matched by trial and condition, and Pearson correlations were computed across trials. Fisher z transformation preceded within-frame paired comparisons and difference-of-differences tests.
- **Software:** MATLAB and SPM.
- **Outputs:** Single-trial ROI beta tables, condition connectivity coefficients, paired-test tables, condition-summary figures, and saved analysis structures.
- **My contribution:** Organized single-trial estimates, extracted and matched ROI series, calculated correlations, performed statistical comparisons, and prepared figures, tables, and saved analysis files.

<a id="sensitivity"></a>

## 6. How sensitive are these analyses to analytical choices, participants, and acquisition factors?

Checks of rating dimensions, participant influence, and model specifications are linked to the relevant representational analyses. Acquisition-order and quality checks are tailored to each analysis measure. Some are described above; this section brings together the acquisition and imaging-quality analyses.

### Sensitivity analyses of acquisition order and imaging quality

[Core code: covariate model for Frame fits](sensitivity_core.m)

- **Purpose:** Examine associations between analysis measures and acquisition order, head motion, and between-session signal-quality differences. Compare estimates across model configurations.
- **Input data types:** Acquisition order, motion parameters and FD measures, ROI tSNR, and measures from GLM, ROI, RSA, PM, and decoding analyses.
- **Methods:** Quality measures were compared across frames and acquisition orders. Signed or absolute between-session differences were defined for each analysis target and included in regression or group-level covariate models. Parameter estimates, statistical-test tables, and maps were compared before and after adjustment.
- **Software:** MATLAB and SPM.
- **Outputs:** Quality-measure tables, covariate-model tables, plots of estimates before and after adjustment, and plots of associations with imaging quality.
- **My contribution:** Calculated and organized quality measures, matched participant records, built covariate models, ran different configurations, and prepared comparisons.

## Experimental procedures and data preparation

I carried out the experimental work underlying these analyses: psychophysiological pilot testing, E-Prime task checks, recruitment and scheduling, informed consent and pre-scan preparation, MRI acquisition, and matching behavioral records to imaging files. The pilot recorded skin conductance and other physiological signals to provide an initial check of task procedures and experimental manipulations.

The [core RSA code](../1.RSA/rsa_core.m) connects the representational question to its computation and main figures. The [experimental workflow](../workflow.md) documents the work from pilot testing through MRI acquisition and data preparation.

## Method references

For gPPI task-modulation settings and connectivity types, see the [CONN analysis parameters](https://web.conn-toolbox.org/resources/conn-manual/conn_batch). Conjunction-null inference requires every component to be significant; see [Nichols et al. on conjunction inference](https://www.fil.ion.ucl.ac.uk/spm/doc/papers/NicholsBrett.pdf).
