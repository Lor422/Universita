Libro:
	[[Introduction_to_Machine_Learning_Fourth_Edition_Ethem_Alpaydin_z.pdf]]
Slides:
	[[Machine Learning.pdf]]
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

Design Matrix, in cui vado a registrare le feature ed i campioni corrispondenti oppure i risultati

Possono esserci diversi tipi di apprendimento

#Apprendimento_supervisionato: l'algoritmo ha a disposizione sia i dati di input che le etichette di output. Algoritmi di classificazione o di regressione, per risolvere problemi classici.
Classificazione=Etichette, spam/non spam ad esempio
Regressione=Stabilire prezzo di una casa a partire dai metri quadri, un set di risposte "reali" nel senso matematico, un set non definito ma che dipende molto dall'input dato.

#Apprendimento_non_supervisionato: L'algoritmo ha a disposizione solamente i dati in input.
Si pretende che l'algoritmo sia in gradi di carpire la struttura dei dati.
Ad esempio, voglio regalare magliette ad una grande mole di clienti di cui so altezza e peso. Grafico i dati input, e in base a questi dati riesco a capire la distribuzione, la "struttura", e quindi come distribuire per bene questi dati e quante sono le magliette da stampare. Questo è un problema di Clustering


Le feature possono essere:
	Categoriche, che a loro volta si dividono in:
		Ordinali: Abbiamo ordine nelle categorie (Basse, media e alta temperatura)
		Non ordinali: Non abbiamo ordine nelle categorie (Colori)
	Continue

#Apprendimento_rinforzativo (reinforced learning):
Osserviamo il mondo e vogliamo apprendere una policy ben specifica. Genero tanti episodi e ad ogni episodio assegno una ricompensa, negativa o positiva. Pesano di più quelle positive rispetto a quelle negative


#Accuracy: lo usiamo per allenare, e anche per valutare. Si cerca l'algoritmo con l'accuracy migliore

I modelli oltre ai parametri possono avere #iperparametri , qualcosa che inserisco a mano io, anche cambiare modello potrebbe essere un iperparametro

3 tipi di set di dati:
	Train (Per allenare)
	Test (Per testare) (L'unione fra test e Train deve essere la totalità dei dati, l'intersezione deve essere vuota)
	Valid (Per validare quale modello sia migliore, dati diversi dai precedenti)

Come fare split dei dati:
	Li separiamo in maniera randomica, cercando però di mantenere un certo rapporto fra le caratteristiche simile a quello che ci interessa.
	Random fino ad un certo punto, devo comunque essere in grado di fare un confronto

## 16/10/2026 (Vedi slide e fai prima)

In genere le reti neurali sono un'aggregazione di neuroni (Negli umani sono collegati ai cinque sensi), sono dei semplici propagatori di segnale.

I primi studi di machine learning cercavano di imitare il funzionamento del neurone

Gli input del modello sono binari , e cosi andiamo a ricreare sostanzialmente delle porte logiche
I limiti di questo modello sono:
	Input binari
	I parametri sono fissati man mano da noi
	Lavora con uno spazio limitato

Successivamente si passa ad un modello chiamato Percettrone
Caratteristiche:
	Input binario, e possono essere n dati
	Classifica l'input con due etichette
	Possiede parametri
	Basato sulla seguente funzione:
	$$hw(x_{i}\dots x_{n} = [\Sigma_{i =1 }^n w_{i}x_{i}\ge w_{0}])$$

Graficamente la retta che separa due etichette è chiamata Decision boundary
Non è possibile rappresentare lo XOR con questo modello

Regressione
È una funzione parametrizzata

Ci sono vari casi:
	Single Regression: F: R->R (Stimare dai metri quadri il prezzo di una casa ad esempio)
	Multiple Regression:  $$\inline F:R^n-> R$$
Nel primo caso, ci permette di avere un'idea di come allenare l'ai

Discesa del gradiente (Bello probabilmente, bho)

ALL IN HIS MIND?

555