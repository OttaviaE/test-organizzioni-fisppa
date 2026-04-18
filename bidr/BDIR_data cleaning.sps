rename variables (bidr01 to bidr16 = item01 to item16).
execute.

*ricodifica le variabili togliendo qualunque carattere strano.
RECODE item01 to item16 (1=1) (2=2) (3=3) (4=4) (5=5) (6=6) (Else=999).
missing values item01 to item16 (999).
execute.

*inverti i reverse.
RECODE item02 item04 item08 item12 item14 item16 
(1=6) (2=5) (3=4) (4=3) (5=2) (6=1) (Else=999).
execute.

compute SDE = mean(item01,item03,item05,item07,item09,item11,item13,item15).
compute IM = mean(item02,item04,item06,item08,item10,item12,item14,item16).
Execute.

compute bidr01=rnd(SDE).
compute bidr02=rnd(IM).
compute bidr03=rnd(SDE).
compute bidr04=rnd(IM).
compute bidr05=rnd(SDE).
compute bidr06=rnd(IM).
compute bidr07=rnd(SDE).
compute bidr08=rnd(IM).
compute bidr09=rnd(SDE).
compute bidr10=rnd(IM).
compute bidr11=rnd(SDE).
compute bidr12=rnd(IM).
compute bidr13=rnd(SDE).
compute bidr14=rnd(IM).
compute bidr15=rnd(SDE).
compute bidr16=rnd(IM).
execute.

if item01=1 bidr01=1.
if item02=1 bidr02=1.
if item03=1 bidr03=1.
if item04=1 bidr04=1.
if item05=1 bidr05=1.
if item06=1 bidr06=1.
if item07=1 bidr07=1.
if item08=1 bidr08=1.
if item09=1 bidr09=1.
if item10=1 bidr10=1.
if item11=1 bidr11=1.
if item12=1 bidr12=1.
if item13=1 bidr13=1.
if item14=1 bidr14=1.
if item15=1 bidr15=1.
if item16=1 bidr16=1.
if item01=2 bidr01=2.
if item02=2 bidr02=2.
if item03=2 bidr03=2.
if item04=2 bidr04=2.
if item05=2 bidr05=2.
if item06=2 bidr06=2.
if item07=2 bidr07=2.
if item08=2 bidr08=2.
if item09=2 bidr09=2.
if item10=2 bidr10=2.
if item11=2 bidr11=2.
if item12=2 bidr12=2.
if item13=2 bidr13=2.
if item14=2 bidr14=2.
if item15=2 bidr15=2.
if item16=2 bidr16=2.
if item01=3 bidr01=3.
if item02=3 bidr02=3.
if item03=3 bidr03=3.
if item04=3 bidr04=3.
if item05=3 bidr05=3.
if item06=3 bidr06=3.
if item07=3 bidr07=3.
if item08=3 bidr08=3.
if item09=3 bidr09=3.
if item10=3 bidr10=3.
if item11=3 bidr11=3.
if item12=3 bidr12=3.
if item13=3 bidr13=3.
if item14=3 bidr14=3.
if item15=3 bidr15=3.
if item16=3 bidr16=3.
if item01=4 bidr01=4.
if item02=4 bidr02=4.
if item03=4 bidr03=4.
if item04=4 bidr04=4.
if item05=4 bidr05=4.
if item06=4 bidr06=4.
if item07=4 bidr07=4.
if item08=4 bidr08=4.
if item09=4 bidr09=4.
if item10=4 bidr10=4.
if item11=4 bidr11=4.
if item12=4 bidr12=4.
if item13=4 bidr13=4.
if item14=4 bidr14=4.
if item15=4 bidr15=4.
if item16=4 bidr16=4.
if item01=5 bidr01=5.
if item02=5 bidr02=5.
if item03=5 bidr03=5.
if item04=5 bidr04=5.
if item05=5 bidr05=5.
if item06=5 bidr06=5.
if item07=5 bidr07=5.
if item08=5 bidr08=5.
if item09=5 bidr09=5.
if item10=5 bidr10=5.
if item11=5 bidr11=5.
if item12=5 bidr12=5.
if item13=5 bidr13=5.
if item14=5 bidr14=5.
if item15=5 bidr15=5.
if item16=5 bidr16=5.
if item01=6 bidr01=6.
if item02=6 bidr02=6.
if item03=6 bidr03=6.
if item04=6 bidr04=6.
if item05=6 bidr05=6.
if item06=6 bidr06=6.
if item07=6 bidr07=6.
if item08=6 bidr08=6.
if item09=6 bidr09=6.
if item10=6 bidr10=6.
if item11=6 bidr11=6.
if item12=6 bidr12=6.
if item13=6 bidr13=6.
if item14=6 bidr14=6.
if item15=6 bidr15=6.
if item16=6 bidr16=6.
execute.

delete variables IM SDE item01 to item16.
execute.

compute SDE = bidr01+bidr03+bidr05+bidr07+bidr09+bidr11+bidr13+bidr15.
compute IM  = bidr02+bidr04+bidr06+bidr08+bidr10+bidr12+bidr14+bidr16.
Execute.

VARIABLE LABELS SDE 'BIDR6 - Self-Deceptive Enhancement'
/IM 'BIDR6 - Impression Management'.
Execute.

TITLE 'BIDR6 - Self-Deceptive Enhancement'.
RELIABILITY
  /VARIABLES=bidr01 bidr03 bidr05 bidr07 bidr09 bidr11 bidr13 bidr15
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /SUMMARY=TOTAL CORR .
FACTOR
  /VARIABLES bidr01 bidr03 bidr05 bidr07 bidr09 bidr11 bidr13 bidr15
  /MISSING LISTWISE 
  /ANALYSIS bidr01 bidr03 bidr05 bidr07 bidr09 bidr11 bidr13 bidr15
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION .

TITLE 'BIDR6 - Impression Management'.
RELIABILITY
  /VARIABLES=bidr02 bidr04 bidr06 bidr08 bidr10 bidr12 bidr14 bidr16
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /SUMMARY=TOTAL CORR .
FACTOR
  /VARIABLES bidr02 bidr04 bidr06 bidr08 bidr10 bidr12 bidr14 bidr16
  /MISSING LISTWISE 
  /ANALYSIS bidr02 bidr04 bidr06 bidr08 bidr10 bidr12 bidr14 bidr16
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION .