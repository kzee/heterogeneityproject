* Encoding: UTF-8.

*Valence (Dataset 1); read in sav file and carry out mixed model analysis.

GET FILE='C:\Users\Niall\Dropbox\Documents\GitHub\heterogeneityproject\HeterogeneityDataset1Traitvalence.sav'.
DATASET NAME Traitvalence WINDOW=FRONT.

MIXED logRT WITH valenceE 
  /FIXED=valenceE
  /RANDOM=INTERCEPT valenceE | SUBJECT(id) COVTYPE(UN) SOLUTION
  /PRINT=SOLUTION TESTCOV.

*Read in aggregated version of Dataset 1 that is structured for a repeated-measures ANOVA in SPSS.

GET FILE='C:\Users\Niall\Dropbox\Documents\GitHub\heterogeneityproject\HeterogeneityDataset1TraitvalenceANOVA.sav'.
DATASET NAME TraitvalenceANOVA WINDOW=FRONT.

GLM logrtneg logrtpos
 /WSFACTOR=valence 2
  /METHOD=SSTYPE(3)
  /WSDESIGN=valence
  /PRINT=DESCRIPTIVE.

*Face Orientation (Dataset 2).

GET FILE='C:\Users\Niall\Dropbox\Documents\GitHub\heterogeneityproject\HeterogeneityDataset2Faceorient.sav'.
DATASET NAME Faceorient WINDOW=FRONT.

MIXED logrt WITH fo
  /FIXED=fo| SSTYPE(3)
 /METHOD=REML
  /PRINT=TESTCOV G  SOLUTION TESTCOV 
  /RANDOM=INTERCEPT fo | SUBJECT(id) COVTYPE(UN) SOLUTION.

*Math priming (Dataset 3).

GET FILE='C:\Users\Niall\Dropbox\Documents\GitHub\heterogeneityproject\HeterogeneityDataset3Mathprime.sav'.
DATASET NAME Mathprime WINDOW=FRONT.

MIXED logrt  WITH congr
  /FIXED=congr | SSTYPE(3)
  /METHOD=REML
  /PRINT=DESCRIPTIVES G  SOLUTION TESTCOV
 /RANDOM=INTERCEPT congr| SUBJECT(id) COVTYPE(UN) SOLUTION.

*Explaining the valence heterogeneity (Dataset 1)

DATASET ACTIVATE Traitvalence WINDOW=FRONT.

MIXED logrt WITH valenceE prom.c
  /FIXED=valenceE prom.c  valenceE*prom.c | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT valenceE | SUBJECT(id) COVTYPE(UN) SOLUTION.

