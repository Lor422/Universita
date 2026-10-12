## 05/10/2026

18 lezioni, 9 teoria 9 lab, c’è un esame e un progetto da fare

Lab prende le presenze che danno punti

2 prove in itinere, 18 dicembre 2026 e 11 gennaio 2027

Materiale didattico: [http://www.dmi.unict.it/farinella/ML](http://www.dmi.unict.it/farinella/ML)

Credenziali: studente, corsoml

## 12/10/2026

A. Samuel (1959)
Machine Learning:"Imparare senza essere esplicitamente programmati"
Dovrebbe riuscire a risolvere problemi che non hanno necessariamente un set di regole ben preciso
"Imparare da un set di #dati a risolvere un #task"
Dati->Programma->Output
Dati Input ed Output-> Learning Algorithm -> Programma che risolve uno specifico task ( #Fase_Learning)
Se aggiungo nuovi dati al programma che risolve uno specifico task, dovrebbe uscire comunque un output corretto (Quest'ultima fase si chiama #inferenza)

Esempio problema semplice per un umano ma complicato per una macchina: "Distinguere una email genuina da una spam"
"Colorazione di un'immagine da scala di grigio"
(Questi sono task)

Nel primo esempio, testo dell'email è l'input, l'output è un'etichetta con scritto "Spam" o "Non spam", il set di queste etichette è chiamato set di classi. Solitamente si usano numeri per indicare le classi, non stringhe

Mitchel (1997) 
Problema del learning: "Un computer impara da un' #esperienza E rispetto ad un task T e ad un #performance P, se le performance risultate sul task T mediante P migliorano con l'esperienza E"

Esperienza: i dati, sia input che output, un set che contiene entrambi (Vedi formula e aggiungila)
Ogni coppia di dati x^i e Y^i è un #esempio 
E=Algoritmo di apprendimento

Performance: Solitamente le misure relative all'apprendimento sono relative al task
P=Misura apprendimento

Modello: programma che segue la macchina, una funziona matematica parametrizzata

P_T: Una performance per il training (La T è un pedice in questo caso)
P_I: Performance per l'inferenza
Servono entrambi

Una singola istanza di un dato in input è un #campione , solitamente dei vettori monodimensionali che racchiudono tutte le qualità dell'istanza (Possono essere anche multi-dimensionali). Questo vettore lo possiamo chiamare anche #vettore_di_feature 