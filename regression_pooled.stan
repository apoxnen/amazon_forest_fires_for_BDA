data {
  int<lower=0> N;
  int<lower=0> K;           // number of groups
  vector[N] x;        // predictor (year)
  int<lower=0> y[N];  // response (n of fires)
  real xpred;
}

parameters {
  real<lower=0> alpha;
  real<lower=0> beta;
  real<lower=0> phi;
}
model {
  //phi ~ normal(3000, 6000);
  phi ~ normal(0,30); // <- so far the best phi dist
  
  alpha ~ exponential(0.00002); //change this
  beta ~ exponential(0.00002); //change this
  y ~ neg_binomial(alpha + beta * x, phi);
}

generated quantities {
  int<lower=0> ypred[K];
  vector[N] log_lik;
  
  for (i in 1:K) 
    ypred[i] = neg_binomial_rng(alpha + beta * xpred, phi); // Now mu = alpha + beta*x*xpred???
  
  for (i in 1:N) 
    log_lik[i] = neg_binomial_lpmf(y[i] | alpha, beta);
}



