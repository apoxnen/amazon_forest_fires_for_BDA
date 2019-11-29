data {
  int<lower=0> N;           // number of data points
  int<lower=0> K;           // number of groups
  vector[N] x;              // group indicator
  int xx[N]; // group indicator
  int<lower=0> y[N];
  real xpred;
}

parameters {
  //real<lower=0> alpha;
  //real<lower=0> beta;
  //vector[K] alpha; 
  //vector[K] beta;
  real<lower=0>phi;
}

// USE YEARS AS GROUP INDICATOR!!! NOW x is just a random number!!
transformed parameters {
  //vector<lower=0>[K] alpha; 
  vector<lower=0>[K] beta;

  vector[K] mu ;
  for (i in 1:N) {
    mu[xx[i]] = beta[xx[i]] * x[i];
  }
}

// 1/alpha = K(1-(1/beta)) / (1/beta)

model {
  //alpha ~ exponential(0.2); //change this
  //beta ~ exponential(0.2); //change this
  phi ~ exponential(0.2);
  
  y ~ neg_binomial_2(mu[xx], phi);
}

generated quantities {
  int<lower=0> ypred[K]; 
  for (i in 1:K) 
    ypred[i] = neg_binomial_2_rng(beta[xx[i]]*xpred, phi); // Now mu = alpha + beta*x*xpred???
}




