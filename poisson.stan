
data {
  int<lower=0> N;
  int<lower=0> K;           // number of groups
  int  xx[N];        // predictor (year)
  vector[N] x;        // predictor (year)
  int<lower=0> y[N];  // response (n of fires)
}
parameters {
  vector[K] alpha;
}

model {
  for (i in 1:K) {
    alpha[i] ~ normal(0,100); // Bad prior    
  }
  
  for( i in 1:N) {
    y[i] ~ poisson(alpha[xx[i]]);
  }
}

generated quantities {
  int<lower=0> ypred[K];
  vector[N] log_lik;
  for (i in 1:K)
    ypred[i] = poisson_rng(alpha[i]);
  
  for (i in 1:N)
    log_lik[i] = poisson_lpmf(y[i] | alpha[xx[i]]);
}












