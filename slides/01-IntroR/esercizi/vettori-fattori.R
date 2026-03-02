# Esercizi vettori e fattori

# 0.1) crea l'oggetto x di valore 10
x = 10
# 0.2) crea l'oggetto y di valore 20
y = 20
# 0.3) valuta se x è maggiore di 20
x > 20

# 0.4) crea l'oggetto nome e assegnagli il tuo nome
nome = "Margherita"
# 0.5) crea l'oggetto cognome e assegnali il tuo cognome
cognome = "Calderan"
# 0.6) valuta se nome è minore o uguale a cognome 
nome <= cognome

# 1) Crea il vettore num contenente i conteggi giornalieri di 
# libri venduti (da 15 a 27). (potresti utilizzare la funzione seq(), 
# prova a vedere come funziona lanciando il comando ?seq)
num = 15:27

# 2) Estrai il quarto e il l'ultimo elemento di num
# ?length
num[4]
num[length(num)]
num[c(4,length(num))]

# 3) Calcola la radice quadrata del numero di libri in num 
sqrt(num)

# 4) Crea l'oggetto s il cui valore è dato dalla somma del numero di libri
s = sum(num)

# 5) Assegna il valore s agli elementi di num che hanno 
# minuti compresi tra 16–20
num[num>16 & num < 20] = s
num #controlla

# 6) Crea un fattore colori con i livelli "rosso", "verde", "blu", 
# ciascuno ripetuto 3 volte. ?rep

colori = factor(x = rep(c("rosso", "verde", "blu"), times = 3))

#opzione 2, creo vettore di tipo character
colori = rep(c("rosso", "verde", "blu"), times = 3)
# trasformo a fattore
colori = as.factor(colori)

# 7) Visualizza i livelli del fattore. 
levels(colori)

# 8) Rinomina i livelli in "col_rosso", "col_verde", "col_blu".
levels(colori) = c("col_blu", "col_rosso", "col_verde") #attezione all'ordine!
colori
