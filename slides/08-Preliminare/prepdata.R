library(readr)
dataB <- read_delim("slides/08-Preliminare/data/dataB.csv", 
                    delim = "\t", escape_double = FALSE, 
                    trim_ws = TRUE)

dataB[, 8:ncol(dataB)] <- apply(dataB[, 8:ncol(dataB)], 2, function(x) ifelse(x == 0, NA, x))
dataB <- na.omit(dataB)

# dopo aver rimosso i casi con NA reali
mat <- dataB[, 8:ncol(dataB)]
dim(mat)  # verifica: 19718 righe x 50 colonne

# converti in matrice numerica PRIMA di usare indici lineari
mat_matrix <- as.matrix(mat)

# campiona 300 posizioni casuali
set.seed(42)
s <- sample(1:length(mat_matrix), size = 200)

# inserisci NA
mat_matrix[s] <- NA

# riconverti in data.frame
mat_miss <- as.data.frame(mat_matrix)

# verifica
sum(is.na(mat_miss))  # 300
colSums(is.na(mat_miss))  # distribuzione per colonna

dim(mat_matrix) 

dataB[, 8:ncol(dataB)] <- mat_matrix

save(dataB, file = "slides/08-Preliminare/data/dataB.RData")

