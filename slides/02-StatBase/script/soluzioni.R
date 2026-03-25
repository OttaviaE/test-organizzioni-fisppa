mu <- 50
sigma <- 12

pnorm(mu, mean = mu, sd = sigma, lower.tail = FALSE)           # 1

pnorm(mu + sigma/2, mean = mu, sd = sigma) -
  pnorm(mu - sigma/2, mean = mu, sd = sigma)                   # 2

pnorm(mu + sigma, mean = mu, sd = sigma) -
  pnorm(mu, mean = mu, sd = sigma)                             # 3

pnorm(mu + 1.5 * sigma, mean = mu, sd = sigma,
      lower.tail = FALSE)                                      # 4

1 - (pnorm(mu + 2*sigma, mean = mu, sd = sigma) -
       pnorm(mu - 2*sigma, mean = mu, sd = sigma))             # 5

qnorm(0.95, mean = mu, sd = sigma)                             # 6

qnorm(0.10, mean = mu, sd = sigma)                             # 7

c(qnorm(0.25, mean = mu, sd = sigma),
  qnorm(0.75, mean = mu, sd = sigma))                          # 8

round(pnorm(35, mean = mu, sd = sigma) * 100, 2)               # 9a
round(pnorm(70, mean = mu, sd = sigma) * 100, 2)               # 9b

round(pnorm(80, mean = mu, sd = sigma,
            lower.tail = FALSE) * 1000, 1)  