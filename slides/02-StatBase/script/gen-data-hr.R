library(dplyr)
set.seed(555)
n <- 20

data_hr <- data.frame(
  id            = 1:n,
  reparto       = sample(c("Produzione", "Commerciale", "HR", "IT"),
                         n, replace = TRUE, prob = c(.35, .30, .15, .20)))

data_hr$accordo = case_when(data_hr$reparto == "Produzione" ~ pmax(round(runif(n,3,4))),
                            data_hr$reparto == "Commerciale" ~ pmax(round(runif(n,2,4))),
                            data_hr$reparto == "HR" ~ pmax(round(runif(n,1,4))),
                            data_hr$reparto == "IT" ~ pmax(round(runif(n,1,2))))
  
         
save(data_hr,file = "slides/02-StatBase/data/data_hr.rda")


# problem solving
load("slides/02-StatBase/data/data_hr.rda")

data_hr <- data_hr |>
  mutate(
    # abilità "latente" più alta -> più risposte corrette attese
    ps_lat = case_when(
      reparto == "Produzione"  ~ 0.72,
      reparto == "Commerciale" ~ 0.70,
      reparto == "HR"          ~ 0.75,
      reparto == "IT"          ~ 0.78
    ) + 0.08 * (accordo - 2.5),
    ps_lat = pmin(0.95, pmax(0.20, ps_lat))
  ) |>
  mutate(
    p1  = rbinom(n, 1, ps_lat),
    p2  = rbinom(n, 1, ps_lat),
    p3  = rbinom(n, 1, ps_lat),
    p4  = rbinom(n, 1, ps_lat),
    p5  = rbinom(n, 1, ps_lat),
    p6  = rbinom(n, 1, ps_lat),
    p7  = rbinom(n, 1, ps_lat),
    p8  = rbinom(n, 1, ps_lat),
    p9  = rbinom(n, 1, ps_lat),
    p10 = rbinom(n, 1, ps_lat)
  ) |>
  mutate(
    problem_solving_0_10 = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + p10,
    fascia_ps = case_when(
      problem_solving_0_10 <= 4  ~ "Intervento immediato (D)",
      problem_solving_0_10 <= 6  ~ "Richiesta di attenzione (C)",
      problem_solving_0_10 <= 9  ~ "Sufficiente (B)",
      problem_solving_0_10 == 10 ~ "Criterio raggiunto (A)"
    )
  ) |>
  select(-ps_lat)


data_ps = data_hr
save(data_ps,file = "slides/02-StatBase/data/data_ps.rda")
