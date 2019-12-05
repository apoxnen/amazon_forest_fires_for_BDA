// USE YEARS AS GROUP INDICATOR!!! NOW x is just a random number!!
// 1/alpha = K(1-(1/beta)) / (1/beta)
data {
  int<lower=0> N;
  int<lower=0> K;           // number of groups
  int  xx[N];        // predictor (year)
  vector[N] x;        // predictor (year)
  int<lower=0> y[N];  // response (n of fires)
  real xpred;
}
parameters {
  vector[K] alpha;
  vector[K] beta;

}

model {
  //phi ~ exponential(0.1);
  alpha ~ normal(0,100);
  beta ~ normal(0,100);
  
  for( i in 1:N) {
    //mu[i] = exp(alpha[xx[i]] + beta[xx[i]] * x[i]);
    y[i] ~ poisson_log(alpha[xx[i]] + beta[xx[i]] * x[i]);  
  }
}

generated quantities {
  int<lower=0> ypred[K];
  vector[N] log_lik;
  // posterioir predictive checking here : lightspeed example
  // use eg. means
  for (i in 1:K)
    ypred[i] = poisson_log_rng(alpha[i] + beta[i] * xpred);
    //ypred[i] = neg_binomial_2_rng(alpha[i] + beta[i] * xpred, phi); // Now mu = alpha + beta*x*xpred???
  
  for (i in 1:N) 
    log_lik[i] = poisson_log_lpmf(y[i] | alpha[xx[i]] + beta[xx[i]]);
    //log_lik[i] = neg_binomial_lpmf(y[i] | alpha[xx[i]], beta[xx[i]]);
}












