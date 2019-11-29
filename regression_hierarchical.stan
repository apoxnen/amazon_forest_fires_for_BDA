data {
  int<lower=0> N;           // number of data points
  int<lower=0> K;           // number of groups
  vector[N] x;              // group indicator
  //int<lower=1,upper=K> x[N]; // group indicator
  int<lower=0> y[N];
  real xpred;
}

parameters {
  real alpha;
  real beta;
  //vector[K] alpha; 
  //vector[K] beta;
  real phi;
}

transformed parameters {
  vector[N] mu ;
  mu = alpha + beta * x ;
  
}

model {
  alpha ~ exponential(0.2); //change this
  beta ~ exponential(0.2); //change this
  phi ~ cauchy(0,3);
  
  
  
  y ~ neg_binomial_2(mu, phi);
}

generated quantities {
  int<lower=0> ypred[K]; 
  for (i in 1:K) 
    ypred[i] = neg_binomial_rng(mu[ x[i] ]*xpred, phi); // Now mu = alpha + beta*x*xpred???
}




