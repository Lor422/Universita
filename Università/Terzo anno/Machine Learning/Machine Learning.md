Libro:	[[Introduction_to_Machine_Learning_Fourth_Edition_Ethem_Alpaydin_z.pdf]]
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
Ogni coppia di dati $x^i$ e $y^i$ è un #esempio 
E=Algoritmo di apprendimento

Performance: Solitamente le misure relative all'apprendimento sono relative al task
P=Misura apprendimento

Modello: programma che segue la macchina, una funziona matematica parametrizzata

$P_T$: Una performance per il training (La T è un pedice in questo caso)
$P_I$: Performance per l'inferenza
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

## 16/10/2026 (Vedi slide dalle 19 alla 32)

In genere le reti neurali sono un'aggregazione di neuroni (Negli umani sono collegati ai cinque sensi), sono dei semplici propagatori di segnale.

I primi studi di machine learning cercavano di imitare il funzionamento del neurone

Gli input del modello sono binari , e possiamo ricreare sostanzialmente delle porte logiche AND e OR
I limiti di questo modello sono:
	Input binari
	Gli input hanno tutti lo stesso peso
	I parametri sono fissati man mano da noi (Quindi il training non è automatico)
	Tutte le funzioni computabili sono linearmente separabili

Successivamente si passa ad un modello chiamato Percettrone
Caratteristiche:
	Classifica l'input con due etichette
	C'è un metodo automatico di apprendimento che stabilisce i pesi dell'input in maniera opportuna

Il comportamento del percettrone è basato sulla seguente funzione:
	$$
	f(x_{i}\dots x_{n}) =
	\begin{cases}
	1\text{ se }[\sum_{j = 0 }^{d} w_{j}x_{j}\ge w_{0}]\\
	0 \text{ altrimenti}
	\end{cases}
	$$
Dove $x_j$ sono gli input e $w_j$ i pesi

Il processo generale del percettrone si divide in 4 passi:
	1. Inizializzazione casuale dei pesi $w_1,\dots,w_d\in\mathbb{R}$
	2. Computa $\forall{x^\text{(i)}}$ il valore di $\hat{y}^\text{(i)}$
	3. Confronta $\hat{y}^\text{(i)}$ con $y^\text{(i)}$
		Se sono uguali non fa nulla, altrimenti aggiorna i pesi
	4.Aggiorna i pesi

![[Screenshot 2026-10-17 185633.png]]
Questo aggiornamento dei pesi porta man mano a convergere ad un risultato opportuno per il dataset

Formula matematica per l'aggiornamento dei pesi:
$$
\hat{w}_j \leftarrow w_j +\alpha(y^\text{(i)}-\hat{y}^\text{(i)})x_j 
$$

Dove $\hat{w}_j$ è il nuovo peso. Sostanzialmente aggiustiamo il peso calcolando la distanza fra l'output e l'output normalizzato, per trovare una risposta più vicina a quella corretta
Il parametro $\alpha$ è detto Learning Rate, e se scelto in maniera opportuna può migliorare l'apprendimento e la convergenza

Non è possibile rappresentare lo XOR con questo modello

Regressione
Definiamo la regressione come un algoritmo che elabora un esempio in input e produce un valore o un vettore reale di output
È in grado quindi di stabilire relazione fra i dati, individuare trend e fare predizioni



Ci sono vari tipi:
	Single Regression: $\text F: R \rightarrow R$ (Stimare dai metri quadri il prezzo di una casa ad esempio)
	Multiple Regression:  $\text F:R^n\rightarrow R$
	Multivariate regression: $\text F:R^n\rightarrow R^{n_1}$
Nel primo caso, ci permette di avere un'idea di come allenare l'ai

## 23/10/2026 Da slide 33 a

Modello regressione

Funzione di Loss
$$
\huge f(v)=\frac{1}{m}\sum_{i=1}^{m}(I_v(x))
$$
(Da aggiustare)

Un regressore lineare può tracciare solo linee nel grafico, ma potremmo avere la necessità di gestire lo spazio delle feature in modo non lineare. Ci serve quindi la regressione polinomiale, che definiamo:
$$
\huge \Theta:x\rightarrow \text{nuovo spazio polinomiale}
$$
$$
\huge x_1=[x_1,x_1^2]
$$
$$
\huge x_1\rightarrow[x_1,x_2,x_1^2,x_2^2,x_2x_2]
$$
Non trasformiamo il modello in maniera non lineare ma i risultati li diventano.
Come scelgo il mio polinomio?
Se scelgo male e non ho abbastanza parametri allora avrò problema di underfitting, cioè non descrivo bene il problema perché alcune parti del grafico vengono mancate, e viceversa se ho troppi parametri potrei avere overfitting

Siamo a slide 38, 4.4.2 Entropia dell'informazione

## 26/10/2026
