# Pulire lo spazio di lavoro
rm(list = ls())

# Impostare working directory
setwd('/percorso/cartella')

# Caricare dataset

# Visualizzare struttura
str(data_pswq)

# Definire natura della variabile
dat <- data_pswq
dat$id <- as.factor(dat$id)
dat$eta <- as.factor(dat$eta)
dat$genere <- as.factor(dat$genere)

# Frequenze---------------
dat$PSWQ_1 <- as.ordered(dat$PSWQ_1)
str(dat$PSWQ_1)

## Frequenze Assolute Semplici
table(dat$PSWQ_1)

## Frequenze Assolute Cumulate
cumsum(table(dat$PSWQ_1))

## Frequenze Relative Semplici
n = length(dat$PSWQ_1)
table(dat$PSWQ_1)/n

## Frequenze Relative Cumulate
cumsum(table(dat$PSWQ_1)/n)

# Indici di Tendenza Centrale ---------------

## Moda
  
## Mediana

median(as.numeric(dat$PSWQ_1))

# Indici di Variabilità -----------

## Campo di Variazione (Gamma)

## Differenza Interquartilica (IQR)



# Percentili-------

## Primo, secondo, terzo quartilee

## Rango Percentile


# Indici di Forma--------eeee

## Asimmetria (Skewness)

## Curtosi (Kurtosis)


# Riepilogo Funzioni R--------

## Funzioni Base

# | Funzione | Descrizione |
# |----------|-------------|
# | `rm(list = ls())` | Pulire workspace |
# | `setwd()` | Impostare working directory |
# | `read.csv()` | Caricare dataset CSV |
# | `str()` | Visualizzare struttura |
# | `head()` | Prime righe |
# | `nrow()` | Numero righe |
# | `length()` | Lunghezza vettore |
# 
# ## Trasformazioni Variabili
# 
# | Funzione | Descrizione |
# |----------|-------------|
# | `as.ordered()` | Convertire a ordinale |
# | `as.numeric()` | Convertire a numerico |
# | `as.factor()` | Convertire a fattore |
# 
# ## Frequenze
# 
# | Funzione | Descrizione |
# |----------|-------------|
# | `table()` | Frequenze assolute |
# | `cumsum()` | Somma cumulata |
# 
# ## Tendenza Centrale
# 
# | Funzione | Descrizione |
# |----------|-------------|
# | `mean()` | Media aritmetica |
# | `median()` | Mediana |
# | `sum()` | Somma |
# 
# ## Variabilità
# 
# | Funzione | Descrizione |
# |----------|-------------|
# | `min()` | Valore minimo |
# | `max()` | Valore massimo |
# | `range()` | Range [min, max] |
# | `var()` | Varianza (campionaria, $n-1$) |
# | `sd()` | Deviazione standard (campionaria) |
# | `quantile()` | Percentili/quartili |
# | `IQR()` | Differenza interquartilica |
# | `rank()` | Rango |
# 
# ## Forma (pacchetto psych)
# 
# | Funzione | Descrizione |
# |----------|-------------|
# | `skew()` | Asimmetria |
# | `kurtosi()` | Eccesso di curtosi |
# 
# ## Visualizzazione
# 
# | Funzione | Descrizione |
# |----------|-------------|
# | `barplot()` | Grafico a barre |
# | `boxplot()` | Boxplot |
# | `hist()` | Istogramma |
# 
# ## Manipolazione Dati
# 
# | Funzione | Descrizione |
# |----------|-------------|
# | `subset()` | Filtrare righe/colonne |
# | `data.frame()` | Creare dataframe |
# | `sapply()` | Applicare funzione a colonne |
# | `print()` | Stampare output |
# 