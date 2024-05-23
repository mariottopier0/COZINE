### Input ###
  ######### dat :  OTU table with nx p matrix with n samples and p texa
  ######### fixed: data.frame of fixed covariates (to be conditioned upon)
  ######### parallel: parallelize over variables using "mclapply"?
  ######### nlambda: number of lambda values on grid (default 200).
  ######### lambda.min.ratio: minimum lambda ratio (as a function of lambda0, default .5)

### Output: Object from fitHurdle
cozine <- function(dat,fixed = NULL, parallel = TRUE,indices=NULL, nlambda=50, lambda.min.ratio=0.5){
  stopifnot(is.matrix(dat))
  p = ncol(dat)
  n = nrow(dat)
  dat_t = clr(dat)
  dat_trans <- conditionalCenter(dat_t)
  hf = fitHurdle(dat_trans, fixed=fixed, parallel=parallel, keepNodePaths = TRUE, control=list(debug=0), nlambda = nlambda, lambda.min.ratio = lambda.min.ratio)
  return(hf) 
}
