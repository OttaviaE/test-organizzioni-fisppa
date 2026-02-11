set.seed(123)

Paese = c("Singapore","Giappone","Francia","Spagna","Australia",
           "Italia","Stati Uniti","Cina","Turchia",
           "Marocco","Bolivia","Etiopia","Mozambico","Afghanistan")


base = rlnorm(length(Paese), meanlog = log(8), sdlog = 1.0)

moltip = rep(1, length(Paese))
moltip[Paese %in% c("Singapore","Giappone","Francia","Spagna","Australia","Italia")] = 0.45
moltip[Paese %in% c("Etiopia","Mozambico","Afghanistan")] = 2.8

Infortuni_ogni_1000_lavoratori = round(base * moltip, 2)

dwork = data.frame(Paese, Infortuni_ogni_1000_lavoratori)

data_work = dwork

save(data_work, file = "slides/02-StatBase/data/data_work.rda")
