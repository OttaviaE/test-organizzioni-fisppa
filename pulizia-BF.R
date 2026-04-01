# import datasets and merge them ---- 
library(tidyverse)
library(readxl)
library(corrplot)

# codice windows per cambiare in blocco i nomi alle cartelle e 
# garantire anonimato partecipant*
# PS C:\Users\Ottavia> cd "C:\Users\Ottavia\Documents\GitHub\test-organizzioni-fisppa\BF"
# PS C:\Users\Ottavia\Documents\GitHub\test-organizzioni-fisppa\BF> $i=1
# PS C:\Users\Ottavia\Documents\GitHub\test-organizzioni-fisppa\BF> Get-ChildItem -Directory | ForEach-Object {
#   >>     Rename-Item $_ -NewName ("Cartella_" + $i)
#   >>     $i++
#     >> }
# PS C:\Users\Ottavia\Documents\GitHub\test-organizzioni-fisppa\BF>
# devo recuperare gli scoring 

mywd = paste0(getwd(), "/BF")
setwd(mywd)
filenames = dir()
data = NULL
for (i in 1:length(filenames)) {
  tempfile =dir(paste0(getwd(), "/", filenames[i]))
  temp = as.data.frame(read_excel(paste0(getwd(), "/", filenames[i], "/", tempfile)))
  if (ncol(temp) < 45) {
  assign(paste("temp", i, sep = "_"), temp)
    print(i)
   temp = NULL 
  } else if (all(!is.numeric(unlist(temp[,-1])))) {
    assign(paste("temp", i, sep = "_"), temp)
    print(i)
    temp = NULL 
  }
  data = rbind(data, temp)
}
temp_1
temp_3
temp_5
temp_8
temp_12
temp_24


corrplot(cor(data[,-1]))
df <- data.frame(
  dimension = c(
    "E","E","E","E","E","E","E","E",
    "G","G","G","G","G","G","G","G","G",
    "C","C","C","C","C","C","C","C","C",
    "N","N","N","N","N","N","N","N",
    "A","A","A","A","A","A","A","A","A","A"
  ),
  item = c(
    "item01","item06","item11","item16","item21","item26","item31","item36",
    "item02","item07","item12","item17","item22","item27","item32","item37","item42",
    "item03","item08","item13","item18","item23","item28","item33","item38","item43",
    "item04","item09","item14","item19","item24","item29","item34","item39",
    "item05","item10","item15","item20","item25","item30","item35","item40","item41","item44"
  ),
  reverse = c(
    0,1,0,0,1,0,1,0,
    1,0,1,0,0,1,0,1,0,
    0,1,0,1,1,0,0,0,1,
    0,1,0,0,1,0,1,0,
    0,0,0,0,0,0,1,0,1,0
  )
)

for (i in 1: length(unique(df$dimension))) {
  corrplot(cor(data[, colnames(data) %in% df[df$dimension == unique(df$dimension)[i], 
                                             "item"]]), 
           main = unique(df$dimension)[i], type = "lower")
}

revdata = data 
revdata[, colnames(revdata) %in% df[df$dimension == "E" & df$reverse == 1, "item"]] = 6 - revdata[, colnames(revdata) %in% df[df$dimension == "E" & df$reverse == 1, "item"]]

corrplot(cor(revdata[,-1]), type = "lower")
corrplot(cor(data[,-1]), type = "lower")



long = pivot_longer(data, cols=!codice_personale)
colnames(long)[2] = "item"
long = merge(long, df)
