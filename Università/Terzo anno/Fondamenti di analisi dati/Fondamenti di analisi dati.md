![[Screenshot 2026-10-20 172737.png]]Link sito Furnari:
	https://antoninofurnari.github.io/fad-2627/
Python Tutorial:
	[[lab_02_python_crash_course.pdf]]
	[[lab_03_python_for_data_science.pdf]]
Teoria:
	[[01_key_concepts.pdf]]
	[[02_describing_visualizing.pdf]]
	[[03_probability.pdf]]
	[[04_association.pdf]]
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
$P(x,y)$
Le probabilità congiunte sono simmetriche, e x ed y sono considerati come eventi che avvengono in contemporanea

Si fa una tabella di contingenza per calcolare le probabilità congiunte
Casi favorevoli/tutti i casi possibili

Probabilità marginali, derivabili facilmente dalla tabella di contingenza

Regola della somma: Mi permette di derivare delle probabilità marginali a partire dalle probabilità congiunte

Probabilità condizionale o condizionata: La probabilità che accade un evento dando per scontato che un altro evento sia avvenuto

Regola del prodotto: la probabilità condizionale può essere riscritta anche come moltiplicazione

Regola della catena per la probabilità condizionata: La probabilità congiunta è uguale al prodotto della probabilità marginale e condizionale

Teorema di Bayes: Aggiorna la probabilità di un evento basandosi su nuove prove

$P(A|B)$: Probabilità a posteriori, probabilità di A in base a B 
$P(B|A)$: Verosimiglianza, probabilità di osservare B se A è vero
$P(A)$: Probabilità a priori
$P(B)$: Evidenza

P(fever/covid)=Probabilità che chi abbia il covid abbia la febbre

Due variabili sono indipendenti se la conoscenza di una delle due non influenza in alcun modo l'altra

Modi di definire indipendenza:
	Probabilità condizionale: $P(X=x|Y=y)=P(X=x)$
	Probabilità congiunta: $P(X=x,Y=y)=P(X=x)*P(Y=y)$

## 15/10/2026

Associazioni fra variabili

L'analisi multivariata si pone il problema di come mettere in relazione le varie variabili fra di loro
"Questa variabile mi dice qualcosa sull'altra o sono indipendenti?"
Quindi capire se c'è una #correlazione

Due variabili sono associate se osservare i valori di una ci dice qualcosa sui valori dell'altra

Se $P(x,y)\neq P(x) * P(y)$, allora c'è un'associazione

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
Si può fare dividendo l'istogramma in celle e organizzandolo con dei colori che indicano per bene i valori possibili![[Screenshot 2026-10-15 161615.png]]

Utile soprattutto se i dati sono davvero tanti, aiuta molto a visualizzarli per bene.
Rappresentazione simile quella per densità (Density e contour plot)![[Screenshot 2026-10-15 161905.png]]

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

## 20/10/2026 (Lecture 6)

Distribuzione di probabilità

Può essere utile capire con che probabilità può una variabile assumere tutti i suoi possibili valori di output

Quando una variabile random X segue una distribuzione di probabilità P(X), si dice che X segue P:      $X$ ~ $P$

Per le variabili discrete, parliamo di Probability Mass Functions (PMF)

P è una funzione di mapping dei valori di X
$P:\Omega \rightarrow [0,1]$

La PMF deve seguire la seguente proprietà:
$$
\Large \sum_{x\in\Omega}{P(x)}=1
$$

Esempio di rappresentazione con una moneta non truccata:
![[Screenshot 2026-10-20 152802.png]]

ECDF

CDF: Cumulative Distribution of Discrete Variables
La possiamo definire se la variabile è discreta e può essere ordinata
Registra le probabilità cumulative di tutti i valori minori o uguali al valore dato
$$
\huge F(x)=P(X\leq x)=\sum_{y\leq x}P(y)
$$
Per le variabili continue il discorso è più complicato
La PDF, Probability Density Functions, le definisco come integrale di una funzione f, che permette di mappare l'insieme "continuo" dei valori
La funzione è definita:
$$
\Large f:\Omega \rightarrow [0,1]
$$
E deve seguire la seguente proprietà:
$$
\Large\int f(x)dx=1
$$

In termini probabilistici parleremo comunque dei valori in termini discreti
Infatti per l'integrazione si usa il metodo dei trapezi

Possiamo definire il concetto di probabilità basato sulla densità come:
$$
\Large P(a\leq x \leq b)=\int_a^b f(x)dx
$$

Distribuzione uniforme: assegna la stessa probabilità a tutti i valori in un intervallo

Approssimare una PDF dai dati
Verso fine corso lo faremo con una funzione, per ora lo possiamo fare attraverso gli istogrammi

![[Screenshot 2026-10-20 155606.png]]

Ormai si usa solo quellò di densità per non confondersi coi due istogrammi

CDF c'è anche nelle variabili continue, faccio integrale invece di somma

Distribuzioni di probabilità comuni:
Per lo più discrete

Distribuzione Uniforme Discreta:
$$
\Large P(X=a_i)=\frac{1}{k}
$$

Distribuzione di Bernoulli:
Distribuzione parametrica, una famiglia di funzione con dei parametri che definiti quelli, vado a definire lo scopo specifico
Quella di bernulli è su una singola variabile binaria $\phi$
$P(X=1)=\phi$

Distribuzione Binomiale:
Ha più parametri, risponde alla domanda "Qual è la probabilità di k successi in n tentativi indipendenti?"
$$
\Large P(k)=\binom{n}{k}p^k(1-p)^n-k
$$
k è il numero di successi
n sono il numero di esperimenti indipendenti
p è la probabilità di successo in un esperimento singolo

Distribuzione categorica:
Una generalizzazione di quella di Bernoulli
"Qual è la probabilità di ottenere esattamente l'esito i con k possibili esiti?"
Ci sono vari parametri, la cui somma fa 1

Distribuzione multinomiale:
Generalizzazione di quella categorica
"Qual è la probabilità, lanciando n dadi, di ottenere un certo numero di 4, un certo numero di 6, ecc?"

Distribuzione Gaussiana
È una PDF, conosciuta anche come distribuzione normale
Dipende da due variabili:
	La media
	La varianza
$$
\huge N(x;\mu,\sigma^2)=\sqrt{\frac{1}{2\pi\sigma^2}}e^{-\frac{1}{2\sigma^2}(x-\mu)^2}
$$

Ho presa la distanza fra x ed m, e ho normalizzato per la varianza
Primo pezzo della formula normalizza, il secondo la "abbassa" e "allarga" o viceversa, fa cioè in modo che l'integrale della funzione sia sempre uguale a 1 per mantenere giusto il concetto di probabilità

La gaussiana è importante, e lo capiamo grazie al teorema del limite centrale (Vedi meglio).

La gaussiana appare ovunque in natura.

Se io ho un numero n di variabili che sono indipendenti e ognuna con la propria distribuzione, la somma di queste distribuzioni di probabilità tende alla distribuzione di Gauss, indipendentemente dalla distribuzione originale

La gaussiana può esistere anche su più dimensioni
In questo caso la matrice ha 3 gradi di libertà

Gaussiana isotropica: varianza di x e y = 1, covarianza = 0, non ci trovo un trend

Con la covarianza presente, la gaussiana si "appiattisce"
![[Screenshot 2026-10-20 172737.png]]

Stima dei parametri di una gaussiana
Ci sono delle formule per trovare i parametri migliori
Matrice covarianza:

$$
\huge \frac{1}{N-1}\sum_{i=1}^{N}(x_i-\hat\mu)(x_i-\hat\mu)^T
$$

Il valore atteso: Il valore che mi aspetto che sia più frequente, una sorta di media

Per variabili continue:
$$
\huge E_{X\text{~}P}[X]=\int_{x\in\Omega}xf(x)dx
$$
Teoria dell'informazione:
Gli eventi rari potenzialmente sono più informativi, nel caso del tempo metereologico una temperatura anomala mai registrata prima implica qualche avvenimento degno di nota
Due eventi indipendenti sono additivi


Entropia:
Misura l'incertezza media associata ai possibili output di una variabile random