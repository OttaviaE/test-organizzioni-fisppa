library(readr); library(dplyr); library(ggplot2)
dat <- read_csv("slides/02-StatBase/script/data.csv")
str(dat)

PSQW_item <- colnames(dat)[grep(colnames(dat), pattern = "PSWQ_")]
colint <- c("ResponseId", "Eta", "Q2", PSQW_item)
dat <- dat[-c(1,2,3), colint]

dat <- dat|>
  mutate(id = as.factor(ResponseId),
         eta = factor(Eta, levels = c("18-25","26-40","41-60"),
                      labels = c("18_25", "26_40", "41_60")),
         genere = factor(Q2, labels = c("F","M")))|>
  select(id, eta, genere, all_of(PSQW_item))

str(dat)

invfun <- function(x){
  case_when(x == 1~5,
            x == 2~4,
            x == 3~3,
            x == 4~2,
            x == 5~1)
}

# trasformo a numerico le colonne item
dat[, 4:ncol(dat)] <- sapply(dat[, 4:ncol(dat)], as.numeric)

# inverto il punteggio
dat[,c("PSWQ_1","PSWQ_3","PSWQ_8","PSWQ_10","PSWQ_11")] <- 
  sapply(dat[,c("PSWQ_1","PSWQ_3","PSWQ_8","PSWQ_10","PSWQ_11")],invfun)

# computo la somma
dat$somma = rowSums(dat[, 4:ncol(dat)])

write_csv(dat, file = "data_pswq.csv")

# visualizzo
dat|>ggplot(aes(x = somma, fill = genere))+
  geom_density(alpha = 0.5)+
  theme_classic()




