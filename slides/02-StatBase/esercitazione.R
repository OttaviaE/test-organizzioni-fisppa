# Pulire lo spazio di lavoro
rm(list = ls())

# Impostare working directory
setwd('/percorso/cartella')

# Caricare dataset

# Visualizzare struttura

# Definire natura della variabile (somma a PSWQ)


# Frequenze---------------

## Frequenze Assolute Semplici

## Frequenze Assolute Cumulate

## Frequenze Relative Semplici

## Frequenze Relative Cumulate


# Indici di Tendenza Centrale ---------------

## Moda
  
## Mediana


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