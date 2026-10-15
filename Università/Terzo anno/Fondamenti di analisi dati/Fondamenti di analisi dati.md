Link sito Furnari:
	https://antoninofurnari.github.io/fad-2627/
Python Tutorial:
	[[lab_02_python_crash_course.pdf]]
	[[lab_03_python_for_data_science.pdf]]
Teoria:
	[[01_key_concepts.pdf]]
	[[02_describing_visualizing.pdf]]
	[[03_probability.pdf]]
## 06/10/2026

Dati= Sono una collezione di valori ottenuti rispetto a determinate variabili che descrivono un determinato fenomeno  
Variabili= dimensioni che vogliamo misurare  
Osservazioni= Unità fondamentale attraverso la quale si fa lo studio  
Popolazione= Il set completo dei dati da studiare, l’intero “universo”  
Sample, campione= Sottoinsieme della popolazione

La popolazione potrebbe essere anche un concetto leggermente astratto, un esempio teorico, “Tutte le persone vive al momento e in futuro per testare un farmaco” è un buon esempio, una popolazione teoricamente infinita

Il campione è ciò che va utilizzato quando la popolazione è inottenibile nella sua totalità. Non tutti i campioni sono buoni però, ci sono metodi per migliorarli e “pulirli”


Definizione formale di variabile= Una variabile è una funzione, che in generale indico con una lettera maiuscola, definita in un insieme Omega e ha valori S, dove Omega è la popolazione ed S sono tutti i possibili risultati. Una piccola osservazione presa da Omega la chiamiamo omega piccolo, e un valore preso da S con una lettera piccola, la stessa che ho scelto per la variabile. Omega piccolo non è necessariamente un numero, possiamo anche definirlo come vogliamo, anche come una tupla.

Variabili discrete: numeri interi

Variabili continue: Valori continui

Variabili scalari: descritta da un singolo valore con associata una specifica unita di misura

Variabili multidimensionali: Una tupla per esempio

Variabili discrete scalari: Tipo il lancio di una moneta

Concetto di scala: preferiremo usare una scala nominale quando i valori non sono numerabili

Nella scala ordinale, i valori li possiamo ordianare, ma la differenza fra questi valori non ha necessariamente un significato. Posso definirli in modo tale che ce l’abbiano, ma non è necessariamente cosi. Es, qualcosa che è caldo 20 gradi non caldo il doppio di 10 gradi perchè lo zero non è definito

Un dataset è un insieme di dati, non per forza una tabella, un design matrix è una formattazione di questi dati in modo tale che su tali dati sia facile lavorarci.

Ci sono vari modi per collezionare i dati:

Sondaggi, Esperimenti in ambienti controllati, Approcci osservazionali (Registriamo i dati cosi arrivano, esempio meteo o l’effetto del fumo sulle persone), Fonti online (Quindi dati già acquisiti da qualcun’altro)

Matrice sparsa: normalmente le matrici sono rappresentate in modo denso, se però una matrice ha molti valori nulli, posso andare a conservare in una tabella solo gli indici dei valori non nulli

Data frame=design matrix

Data Wrangling: tecniche per trasformare i dati e usarli in analisi più complesse

## 08/10/2026

Lezione 3 sul sito

## 13/10/2026

Quali valori le variabili assumeranno?
Questa è la domanda che ci interessa 
I sistemi possono essere:
	Deterministici: Prevedibilità perfetta dei dati
	Incerti o Stocastici: Non è facile predirre con certezza i risultati, richiede ragionamenti statistici e probabilistici

Le fonti della mancanza di certezza sono svariate:
Principalmente è la casualità intrinseca in tutto ciò che esiste, poi c'è anche
l'osservabilità incompleta, cioè la mancanza di informazioni, e la mancanza di un modello accurato che riassume per bene il problema alla mano (Robot con telecamera RGB)

La teoria delle probabilità ci permette di:
Quantificare eventi
derivare delle regole formali
combinare informazioni
e fare predizioni

Esperimento casuale: Un esperimento che può essere ripetuto più volte e che potenzialmente da risultati diversi

Spazio campionario: L'insieme di tutti i possibili risultati
Evento semplice: Un singolo dei possibili risultati dell'esperimento
Evento A sottoinsieme o coincidente allo spazio campionario(evento composto): Un sottoinsieme dello spazio campionario

variabile random: Una funzione definita nello spazio campionario che ha valori in E, dove E è uno spazio misurabile

Dati: Valori assunti dalle variabili random

La notazione della probabilità è un numero compreso fra 0 e 1

Probabilità di Laplace: Se in un esperimento casuale tutti i risultati possibili sono ugualmente probabili, è chiamato esperimento di Laplace

Le probabilità si possono stimare anche dalle osservazioni
Approccio frequentista: Numero di volte volte con outcome favorevole/i tentativi che ho visto

Approccio Bayesano alla probabilità:
Incorpora conoscenze esterne all'esperimento

Frequenze relative normalizzate: Probabilità

Posso calcolare una probabilità congiunta fra più variabili
P(x,y)
Le probabilità congiunte sono simmetriche, e x ed y sono considerati come eventi che avvengono in contemporanea

Si fa una tabella di contingenza per calcolare le probabilità congiunte
Casi favorevoli/tutti i casi possibili

Probabilità marginali, derivabili facilmente dalla tabella di contingenza

Regola della somma: Mi permette di derivare delle probabilità marginali a partire dalle probabilità congiunte

Probabilità condizionale o condizionata: La probabilità che accade un evento dando per scontato che un altro evento sia avvenuto

Regola del prodotto: la probabilità condizionale può essere riscritta anche come moltiplicazione

Regola della catena per la probabilità condizionata: La probabilità congiunta è uguale al prodotto della probabilità marginale e condizionale

Teorema di Bayes: Aggiorna la probabilità di un evento basandosi su nuove prove

P(A|B): Probabilità a posteriori, probabilità di A in base a B 
P(B|A): Verosimiglianza, probabilità di osservare B se A è vero
P(A): Probabilità a priori
P(B): Evidenza

P(fever/covid)=Probabilità che chi abbia il covid abbia la febbre

Due variabili sono indipendenti se la conoscenza di una delle due non influenza in alcun modo l'altra

Modi di definire indipendenza:
	Probabilità condizionale: P(X=x|Y=y)=P(X=x)
	Probabilità congiunta: P(X=x,Y=y)=P(X=x)*P(Y=y)

## 15/10/2026

Associazioni fra variabili

L'analisi multivariata si pone il problema di come mettere in relazione le varie variabili fra di loro
"Questa variabile mi dice qualcosa sull'altra o sono indipendenti?"
Quindi capire se c'è una #correlazione

Due variabili sono associate se osservare i valori di una ci dice qualcosa sui valori dell'altra

Se P(x,y)=!P(x) * P(y), allora c'è un'associazione

CORRELATION IS NOT CAUSATION
Correlazione non significa necessariamente causazione, cioè rapporto di causa-effetto 

Correlazione spuria: non c'è realmente un rapporto di causa-effetto nonostante sembra ci sia un collegamento fra le cose

$P(X=x_i​,Y=y_j​)=P(X=x_i​)P(Y=y_j​$)

Le frequenza attese possono essere ricostruite dai valori marginali se le variabili sono indipendenti, l'essere indipendenti assicura di poter fare i calcoli in modo analitico

Segnamo il risultato di queste ricostruzioni con delle tilde, e confrontiamo con i risultati veri per vedere se la nostra "dimostrazione per assurdo" è vera, cioè se le variabili sono veramente indipendenti. Lo sono nel caso n e N~ sono veramente simili

Statistica di Person $T^2$
(Simile al Mean Square Error di interazione e multimedia)

Serve a vedere, normalizzando per il numero stimato, quanto sono dipendenti le variabili. Se il valore è molto alto significa che lo sono, se è vicino a 0 significa le variabili sono abbastanza indipendenti

Statistica di Cramér
La statistica di Person normalizzata al contrario, cioè 1 significa che le variabili sono indipendenti e 0 sono dipendenti (Simile a PSNR sempre di interazione e multimedia)

Un valore di circa 30% uscente da Cramér, significa che l'associazione è debole per convenzione

Adesso parliamo di associazione fra variabili continue (Prima si parlava di variabili discrete)

Scatterplot, tabella in cui si prendono 2 variabili e si considerano come coordinate su un piano cartesiano, utile per vedere se c'è una correlazione positiva, negativa, lineare o non-lineare fra le due variabili

Se i dati sono VERAMENTE non correlati, in questo grafico i dati sembrano una nube.
Una linea retta orizzontale o verticale significa solo che non c'è una correlazione apparente, ma potrebbe comunque esserci

La matrice di scatter è molto utile per visualizzare tutti i possibili grafici di correlazione delle variabili, e si possono pure ordinare i dati in base alla loro appartenenza a particolari gruppi nel caso ci siano

Un'altra rappresentazione utilizzata spesso sono gli istogrammi 2D (Hexbin Plots), quindi una sorta di istogramma con 3 variabili.
Si può fare dividendo l'istogramma in celle e organizzandolo con dei colori che indicano per bene i valori possibili![[Pasted image 20261015161706.png]]

Utile soprattutto se i dati sono davvero tanti, aiuta molto a visualizzarli per bene.
Rappresentazione simile quella per densità (Density e contour plot)![[Pasted image 20261015161921.png]]

Covarianza: Variabile che determina precisamente quanto sono distribuite similarmente intorno alla loro media

Ci chiediamo quanti i dati variano insieme sostanzialmente

Se la formula della covarianza risulta:
	Positiva: gli elementi sono concordanti, entrambi sopra o sotto la loro media
	Negativa: gli elementi sono discordanti, uno sopra la sua media e l'altro sotto
	Zero o vicino a zero: gli elementi sono vicino alla loro media

La covarianza si può usare anche in modo "unbiased", usiamo $\frac{1}{n-1}$ per la correzione anziché $n$

La covarianza però non ha un range, e per risolvere si usa il coefficiente di correlazione di Pearson che cerca di provvedere una normalizzazione, che si ottiene dicidendo per la deviazione standard di entrambe le variabili

La covarianza può essere "falsificata" facilmente moltiplicandola per $\alpha^2$

Come si legge la correlazione di perason?

0-0.3 Correlazione debole
0.7-1 correlazione forte
Numero negativo significa "Anticorrelazione"

Pearson non misura come si orienta la retta
Dice sostanzialmente solo quanto è forte la relazione lineare

Coefficiente di Spearman, correlazione per Rango
Si utilizza quando la relazione non è lineare

Trasforma ogni punto del grafico in ranghi, e inserisce i dati in base a quelli piuttosto che i numeri effettivi e poi li confronta su questa nuova base

Indice ci correlazione di Kendall, considera il livello di associazione delle variabili considerando il rango

Matrice di correlazione, spesso associata ad una mappa di calore, contiene tutti i possibili coefficienti di correlazione e infatti si può calcolare con uno qualsiasi dei precedenti coefficienti

La covarianza è una relazione binaria *simmetrica*

Ci sono note sul rischio relativo sul sito, Lecture 5

## 20/10/2026

