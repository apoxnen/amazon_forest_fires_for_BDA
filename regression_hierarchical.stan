data {
  int<lower=0> N;     // number of datapoints
  int<lower=0> K;     // number of groups
  int  xx[N];        // predictor (year)
  vector[N] x;        // predictor (year)
  int<lower=0> y[N];  // response (n of fires)
  real xpred;         // predictor
}
parameters {
  vector[K] alpha;
  vector[K] beta;
  real phi;
}

model {
  phi ~ exponential(0.1);
  alpha ~ normal(0,100);
  beta ~ normal(0,100);
  
  for( i in 1:N) {
    y[i] ~ neg_binomial_2(alpha[xx[i]] + beta[xx[i]] * x[i], phi);  
  }
}

generated quantities {
  int<lower=0> ypred[K];
  vector[N] log_lik;
  for (i in 1:K)
    ypred[i] = neg_binomial_2_rng(alpha[i] + beta[i] * xpred, phi);
  
  for (i in 1:N) 
    log_lik[i] = poisson_log_lpmf(y[i] | alpha[xx[i]] + beta[xx[i]]);
}



