# Esericizi dataframe

# 1. Costruisci un dataframe denominato studenti formato da:
# - Cognome (fattore): "Rossi", "Bianchi", "Verdi", "Neri", "Gialli", "Blu", "Viola", "Rosa", "Grigi", "Marroni"
# - Voto (numerico): 28, 24, 30, 22, 27, 25, 29, 23, 26, 30
# - Crediti (numerico): 45, 60, 55, 38, 72, 50, 68, 42, 58, 65

studenti=data.frame(
  Cognome = factor(c("Rossi", "Bianchi", "Verdi", "Neri", "Gialli",
                     "Blu", "Viola", "Rosa", "Grigi", "Marroni")),
  Voto = c(28, 24, 30, 22, 27, 25, 29, 23, 26, 30),
  Crediti = c(45, 60, 55, 38, 72, 50, 68, 42, 58, 65)
)


# 2. Recupera:
# 2.1 La colonna Voto utilizzando la notazione con $ 
studenti$Voto

# 2.2 La seconda colonna tramite indicizzazione numerica
studenti[,2]
# oppure
studenti[2] #dataframe con solo la seconda colonna

# 2.3 I cognomi degli studenti che hanno più di 50 crediti
# (impiega sia subset() che la notazione [ ])
# Qual è la differenza nell'output restituito?
subset(studenti,
       subset = Crediti > 50, select = Cognome) # dataframe

studenti[studenti$Crediti>50, "Cognome"] #fattore


# 3. Inserisci nel dataframe studenti una colonna aggiuntiva denominata 
# Corso contenente il nome del corso di laurea di ciascuno studente
# "Psicologia", "Medicina", "Psicologia", "Ingegneria", "Medicina", 
# "Psicologia", "Medicina", "Ingegneria", "Psicologia", "Medicina"


studenti$Corso=c("Psicologia", "Medicina", "Psicologia", "Ingegneria",
                   "Medicina", "Psicologia", "Medicina", "Ingegneria",
                   "Psicologia", "Medicina")
str(studenti)
