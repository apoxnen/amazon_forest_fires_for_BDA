data {
  int<lower=0> N;
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
  //alpha ~ normal(0,10);
  //beta ~ normal(0,10);
  phi ~ cauchy(0, 3);
  
  alpha ~ exponential(0.2); //change this
  beta ~ exponential(0.2); //change this
  y ~ neg_binomial_2(alpha + beta * x, phi);
}

generated quantities {
  real ypred;
  ypred = neg_binomial_2_rng(alpha + beta*xpred, phi);
}





