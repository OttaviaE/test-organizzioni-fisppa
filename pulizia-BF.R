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
colnames(data) = gsub("item", "I", colnames(data))

corrplot(cor(data[,-1]))
df <- data.frame(
  dimension = c(
    "E","E","E","E","E","E","E","E",
    "G","G","G","G","G","G","G","G","G",
    "C","C","C","C","C","C","C","C","C",
    "S","S","S","S","S","S","S","S",
    "A","A","A","A","A","A","A","A","A","A"
  ),
  item = c(
    "I01","I06","I11","I16","I21","I26","I31","I36",
    "I02","I07","I12","I17","I22","I27","I32","I37","I42",
    "I03","I08","I13","I18","I23","I28","I33","I38","I43",
    "I04","I09","I14","I19","I24","I29","I34","I39",
    "I05","I10","I15","I20","I25","I30","I35","I40","I41","I44"
  ),
  reverse = c(
    0,1,0,0,1,0,1,0,
    1,0,1,0,0,1,0,1,0,
    0,1,0,1,1,0,0,0,1,
    0,1,0,0,1,0,1,0,
    0,0,0,0,0,0,1,0,1,0
  )
)
ordine_dimensioni <- unique(df$dimension)
for (i in 1: length(unique(df$dimension))) {
  corrplot(cor(data[, colnames(data) %in% df[df$dimension == unique(df$dimension)[i], 
                                             "item"]]), 
           title = unique(df$dimension)[i], type = "lower")
}

df$dimension = factor(df$dimension, levels = ordine_dimensioni)
revdata = data 
# giro tutti i reverse
dimension_lab = unique(df$dimension)
for (i in 1:length(dimension_lab)) {
  revdata[, colnames(revdata) %in% df[df$dimension == dimension_lab[i]  & df$reverse == 1, "item"]] = 6 - revdata[, colnames(revdata) %in% df[df$dimension == dimension_lab[i] & df$reverse == 1, "item"]]
}

# salvo i dati 
write.table(data, 
            "C:/Users/Ottavia/Documents/GitHub/test-organizzioni-fisppa/slides/04-Dimensioni/data/bfq.csv", 
            row.names = FALSE, sep =",")
write.table(revdata, 
            "C:/Users/Ottavia/Documents/GitHub/test-organizzioni-fisppa/slides/04-Dimensioni/data/bfqR.csv", 
            row.names = FALSE, sep =",")


# nella mia fantasia vorrei fare che metto ihsieme con ggplot i due dataset, rev and and not rev
# e che faccio vedere p'er ogni dimensione il confrotno. 
# lo voglio fare direttamente sulla matrice di correlazione 
# per cui poi devo ottenere un dataset long dove ho l'item1, l'item2 e via discorrendo
# l'ampiezza della correlazioner

df_order = df[order(df$dimension, df$item), ]
item_order = df$item

corstart = cor(data[,-1])
corstart = corstart[item_order, item_order]
corstart[upper.tri(corstart, diag = FALSE)] = NA
corstart <- as.data.frame(as.table(corstart))
corstart = corstart[!is.na(corstart$Freq), ]
corstart$Var1 <- factor(corstart$Var1, levels = item_order)
corstart$Var2 <- factor(corstart$Var2, levels = item_order)
corstart <- corstart[as.numeric(corstart$Var1) >= as.numeric(corstart$Var2), ]
table(as.numeric(corstart$Var1) < as.numeric(corstart$Var2))

ggplot(corstart, 
       aes(x = Var1, y = Var2, fill = Freq))+ geom_tile() +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal()


df <- corstart
diag_df <- df[df$Var1 == df$Var2, ]
lower_df <- df[df$Var1 != df$Var2, ]
ggplot() +   geom_tile(data = diag_df,
                       aes(x = Var1, y = Var2, fill = Freq),
                       color = "grey80") +   geom_point(data = lower_df,
                                                        aes(x = Var1, y = Var2,
                                                            color = Freq,
                                                            size = abs(Freq))) + scale_fill_gradient2(
                                                              low = "firebrick", 
                                                              mid = "white", high = "#191970",
                                                              midpoint = 0,
                                                              limits = c(-1, 1)
                                                            ) +
  scale_color_gradient2(
    low = "firebrick", mid = "white", high = "#191970",
    midpoint = 0,
    limits = c(-1, 1)
  ) +   scale_size(range = c(1, 6)) + theme_light() + theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

  

# tutto insieme ---- 
cor_data    <- cor(data[,-1])
cor_revdata <- cor(revdata[,-1])

df1 <- as.data.frame(as.table(cor_data))
df2 <- as.data.frame(as.table(cor_revdata))

colnames(df1) <- c("Var1", "Var2", "cor")
colnames(df2) <- c("Var1", "Var2", "cor")

df1$dataset <- "data"
df2$dataset <- "revdata"
df_all <- rbind(df1, df2)
df_all$Var1 <- factor(df_all$Var1, levels = item_order)
df_all$Var2 <- factor(df_all$Var2, levels = item_order)

df_all$pos1 <- as.numeric(df_all$Var1)
df_all$pos2 <- as.numeric(df_all$Var2)

df_plot <- df_all[
  (df_all$dataset == "data"    & df_all$pos1 > df_all$pos2) |  # sopra (visivo)
    (df_all$dataset == "revdata" & df_all$pos1 < df_all$pos2) |  # sotto (visivo)
    (df_all$pos1 == df_all$pos2),
]

other_df <- df_plot[df_plot$pos1 != df_plot$pos2, ]
diag_df  <- df_plot[df_plot$pos1 == df_plot$pos2, ]


ggplot() +
  # diagonale (tile)
  geom_tile(data = diag_df,
            aes(x = Var1, y = Var2, fill = cor),
            color = "grey80") +
  
  # triangoli (punti)
  geom_point(data = other_df,
             aes(x = Var1, y = Var2,
                 color = cor,
                 size = abs(cor),
                 shape = dataset)) +
  scale_color_gradient2(
    low = "firebrick", mid = "white", high = "#191970",
    midpoint = 0,
    limits = c(-1, 1)
  )+
  
  scale_fill_gradient2(
    "firebrick", mid = "white", high = "#191970",
    midpoint = 0, limits = c(-1, 1)
  ) +
  
  scale_size(range = c(2, 6)) +
  
  scale_shape_manual(values = c(16, 17)) +  # ● vs ▲ (esempio)
  
  coord_fixed() +
  
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid = element_blank()
  )
