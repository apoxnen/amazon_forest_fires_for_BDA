// USE YEARS AS GROUP INDICATOR!!! NOW x is just a random number!!
// 1/alpha = K(1-(1/beta)) / (1/beta)
data {
  int<lower=0> N;
  int<lower=0> K;           // number of groups
  vector[N] x;        // predictor (year)
  int<lower=0> y[N];  // response (n of fires)
  real xpred;
}
parameters {
  vector<lower=0>[K] alpha;
  vector<lower=0>[K] beta;
  real<lower=0> phi;
}
model {
  //alpha ~ normal(0,10);
  //beta ~ normal(0,10);
  phi ~ cauchy(0, 3);
  
  for (i in 1:K) {
    alpha[i] ~ exponential(0.2); //change this
    beta[i] ~ exponential(0.2); //change this
    y ~ neg_binomial_2(alpha[i] + beta[i] * x, phi);
  }
  
}

generated quantities {
  int<lower=0> ypred[K]; 
  for (i in 1:K) 
    ypred[i] = neg_binomial_2_rng(alpha[i] + beta[i] * xpred, phi); // Now mu = alpha + beta*x*xpred???
}











