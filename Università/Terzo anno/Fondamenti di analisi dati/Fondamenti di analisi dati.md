Link sito Furnari:
- https://antoninofurnari.github.io/fad-2627/
Python Tutorial:
- [[lab_02_python_crash_course.pdf]]
- [[lab_03_python_for_data_science.pdf]]
Teoria:
Prima itinere
- [[01_key_concepts.pdf]]
- [[02_describing_visualizing.pdf]]
- [[03_probability.pdf]]
- [[04_association.pdf]]
- [[05_distributions.pdf]]
- [[06_statistical_inference.pdf]]
- [[08_linear_regression.pdf]]
- [[09_logistic_regression.pdf]]
- [[10_extending_regression.pdf]]
- [[11_causal_analysis.pdf]]
Seconda itinere
## 06/10/2026 Lecture 1

Dati= Sono una collezione di valori ottenuti rispetto a determinate variabili che descrivono un determinato fenomeno  

Variabili= dimensioni che vogliamo misurare

Osservazioni= Unità fondamentale attraverso la quale si fa lo studio
Da considerare come entità astratte, per esempio potremmo leggere "Consideriamo una persona $w$"

Popolazione= Il set completo dei dati da studiare, l’intero “universo”
Solitamente indicato con il simbolo "$\Omega$"

TUTTE le osservazione seguono la proprietà $w\in\Omega$

Sample, campione= Sottoinsieme della popolazione
{$w^{(1)},w^{(2)},\dots,w^{(n)}$}$\text{~}\subseteq\Omega$

La popolazione potrebbe essere anche un concetto leggermente astratto, un esempio teorico, “Tutte le persone vive al momento e in futuro per testare un farmaco” è un buon esempio, una popolazione teoricamente infinita

Il campione è ciò che va utilizzato quando la popolazione è inottenibile nella sua totalità. Non tutti i campioni sono buoni però, ci sono metodi per migliorarli e “pulirli”


Definizione formale di variabile= Una variabile è una funzione, che in generale indico con una lettera maiuscola, definita in un insieme Omega e ha valori S, dove Omega è la popolazione ed S sono tutti i possibili risultati. 
$$
X : \Omega \rightarrow S
$$
Una piccola osservazione presa da Omega la chiamiamo omega piccolo, e un valore preso da S con una lettera piccola, la stessa che ho scelto per la variabile. Omega piccolo non è necessariamente un numero, possiamo anche definirlo come vogliamo, anche come una tupla.
Osservazione: $w\rightarrow x$

Le variabili possono essere:
	Qualitative: Rappresentano proprietà non rappresentabili con un valore numerico 
	Quantitative: Valori rappresentabili con valori numerici

Variabili discrete: Assumono un valore finito di possibili valori

Variabili continue: Assume un valore continuo di valori in un intervallo ben definito

Variabili scalari: descritta da un singolo valore con associata una specifica unita di misura

Variabili multidimensionali: Una tupla o una matrice per esempio

Variabili discrete scalari: Contiene il risultato di un esperimento nello specifico, nel caso del lancio di una moneta potremmo avere $X=tail$

Concetto di scala: preferiremo usare una scala nominale quando i valori non sono numerabili

Nella scala ordinale, i valori li possiamo ordinare, ma la differenza fra questi valori non ha necessariamente un significato. Posso definirli in modo tale che ce l’abbiano, ma non è necessariamente cosi. Es, qualcosa che è caldo 20 gradi non caldo il doppio di 10 gradi perchè lo zero non è definito

Un dataset è un insieme di dati, non per forza una tabella, un design matrix è una formattazione di questi dati in modo tale che su tali dati sia facile lavorarci.

Ci sono vari modi per collezionare i dati:

Sondaggi, Esperimenti in ambienti controllati, Approcci osservazionali (Registriamo i dati cosi arrivano, esempio meteo o l’effetto del fumo sulle persone), Fonti online (Quindi dati già acquisiti da qualcun’altro)

Matrice sparsa: normalmente le matrici sono rappresentate in modo denso, se però una matrice ha molti valori nulli, posso andare a conservare in una tabella solo gli indici dei valori non nulli

Data frame=design matrix

Data Wrangling: tecniche per trasformare i dati e usarli in analisi più complesse

## 08/10/2026 Lecture 2

Descrivere i dati ci aiuta a:
	Raccogliere informazioni dai dataset
	Capire le caratteristiche principali di ogni variabile
	Individuare valori mancanti o anomali
	Identificare le relazioni fra le variabili
	Scoprire dei trend o dei cluster di dati simili

Frequenze assolute:
Un primo modo di descrivere i dati è calcolare il numero di volte che ogni valore appare. Questo numero è chiamato "frequenza assoluta". Solitamente viene calcolato per le variabili discrete, in cui è effettivamente possibile contare tutte le istanze.
Riescono a darci un'idea di come i dati sono distribuiti

Frequenze relative:
$$
f_j=f(a_j)=\frac{n_j}{N},j=1,2,\dots,k
$$
Dove $n_j$ sono le frequenze assolute
Le frequenze relative sono indipendenti dalla grandezza del campione

Grazie a questa definizione possiamo descrivere le proprietà:
$$
\huge n_j\leq n \implies f_j\leq1\text{~} \forall j
$$
$$
\huge \sum_jf_j=\sum_j \frac{n_j}{N}=\frac{1}{N}\sum_j n_j=\frac{N}{N}=1
$$
Graficando su un'istogramma le frequenze relative dopo averle normalizzate otteniamo un istogramma simile a quello delle frequenze assolute, ma con una scala diversa sull'asse delle y

L'istogramma delle frequenze relative è utile per confrontare diversi campioni, in quanto riusciamo a fare delle osservazioni qualitative che potrebbero essere utili.
Un esempio possono essere le altezze di varie persone relative ad età e sesso:
![[Screenshot 2026-10-23 173652.png]]
Da questo grafico possiamo vedere che generalmente le donne sono più basse degli uomini

I grafici a torta solitamente funzionano solo quando gli elementi da rappresentare sono pochi, è meglio evitarli in quanto è difficile usarli efficacemente

Funzione di Distribuzione Cumulativa Empirica (ECDF)
Quando i valori unici nel nostro dataset sono numerosi, le frequenze relative diventano difficili da rappresentare, in quanto si va a creare del rumore nel grafico e visivamente diventa difficile da leggere.
Uno dei modi per risolvere questo problema è la ECDF, che calcola per un valore x la somma delle frequenze relative di tutti i valori y $\leq$ x
$$
\huge ECDF(x)=\sum_{a_j:a_j\leq x}f(a_j)
$$
I valori dell'ECDF sono sempre crescenti e l'ultimo valore è sempre uguale ad 1

La definizione di ECDF ci dice quindi che dato un punto di coordinate (x,y), la somma delle frequenze degli elementi minori o uguali di x è uguale a y. SI può dire anche che y% degli elementi hanno un valore minore di x

Il numero di pin in un istogramma può essere deciso arbitrariamente in base al grafico che vuoi come risultato. Ci sono due modi euristici che sono ampiamente utilizzati:
	Metodo Sturges: # di pins=$\Large 3.3\log{n}$
	Metodo Rice: # di pins=$\Large 2*n^{\frac{1}{3}}$
Dove $n$ è il numero di elementi che sto considerando

Uno svantaggio degli istogrammi è la loro categorizzazione arbitraria di dati continui in "scatole". 
La stima di densità cerca di risolvere questo problema dando una versione "continua" di un istogramma calcolando per ogni valore un punto di coordinate (x,y) da posizionare su un grafico.
A queste stime è anche associato solitamente un valore chiamato "banda" che va ad identificare il valore di precisione con cui stimiamo queste densità.

La grandezza di un campione è determinata dal numero di valori che contiene effettivamente, dettaglio importante da attenzionare in quanto potrebbero esserci colonne con dati mancanti, solitamente indicati con NA o NaN, che ci dice che la grandezza della colonna non corrisponde alla grandezza effettiva del campione

Quantili, percentili e quartili generalizzano il concetto di mediana.

Quantili: un quantile di ordine $\alpha$ è un valore $q_\alpha$ che divide il campione in 2 parte proporzionate, una di grandezza $\alpha$ e l'altra $1-\alpha$ . Per esempio, con $\alpha = 0.25$ , e usando come campione tutti i numeri da 1 a 100 $\in N$ , avremmo nel $q_{0.25}$ tutti i numeri da 1 a 25	
Un quantile non può essere di ordine inferiore a 0, e superiore ad 1. La mediana è un quantile con ordine 0.5 (Con ordine intendiamo $\alpha$)

I percentili sono modi di esprimere i quantili in percentuali, quindi come siamo abituati a dire nella vita quotidiana.

I quartili sono quantili specifici che dividono il campione in quattro parti

La moda di un campione è il valore che appare più frequentemente all'interno dei dati e rappresenta l'osservazione più comune

La misure di dispersione servono a quantificare quanto ogni valore si distanzia l'uno dall'altro, e sono Massimo, minimo e range

La varianza, conosciuta anche come Mean Squared Deviation, ci da una stima di quanto i dati osservati differiscono dalla media. La varianza calcolala media dei quadrati delle deviazioni dei valori dalla media, penalizzando grande deviazioni più di quelle piccole:
$$
\huge s_{n}^{2}=\frac{\sum_{i=1}^{n}(x_i-\overline x)^2}{n}
$$
La varianza però potrebbe risultare in valori con bias quando si lavora con campioni piccoli, quindi in questi casi si tende ad utilizzare la formula della varianza con n-1 al denominatore:
$$
\huge s_{n-1}^{2}=\frac{\sum_{i=1}^{n}(x_i-\overline x)^2}{n-1}
$$
In questo caso si usa $s$ come simbolo al posto di $\sigma$ come nel campo delle probabilità perché $s$ è solo una stima. Nella pratica però non c'è nessuna convenzione universale e i due simboli spesso sono intercambiati.

La varianza cosi com'è però non usa la stessa unità di misura dei dati in input, e quindi per risolvere facciamo la radice della varianza ottenendo cosi la deviazione standard:

$$
\huge \sqrt {s_{n-1}^{2}}=\sqrt{\frac{\sum_{i=1}^{n}(x_i-\overline x)^2}{n-1}}
$$

Standardizzazione (z-scoring)

In molti casi è utile normalizzare i dati in modo che abbiano una media uguale a 0 e una deviazione standard unitaria. Questa normalizzazione è chiamata z-scoring e si ottiene sottraendo la media dai dati e dividendo per la deviazione standard
$$
\huge z_i=\frac{x_i-\overline x}{s_x}
$$
Dove $s_x$ è la deviazione standard della popolazione a cui appartiene X. I z-scores sono senza unità di misura
## 13/10/2026 Lecture 3
In certi casi è possibile predirre i valori di output degli esperimenti perfettamente. È possibile solo se si parla di sistemi deterministici, dove il risultato segue direttamente le condizioni iniziali e non esistono interferenze

I sistemi possono essere:
	Deterministici: Prevedibilità perfetta dei dati
	Incerti o Stocastici: Non è facile predirre con certezza i risultati, richiede ragionamenti statistici e probabilistici

Nella vita reale però non esistono i sistemi totalmente deterministici e siamo quindi esposti all'incertezza. L'incertezza può scaturire da vari fattori:

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

## 15/10/2026 Lecture 4

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

## 20/10/2026 Lecture 5

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

Ho presa la distanza fra x ed $\mu$, e ho normalizzato per la varianza
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

# 22/10/2026 Lecture 6

Inferenza statistica: Trarre conclusioni affidabili sulle popolazioni a partire da campioni ben scelti, che ci restituisce dati pratici su una quantità reale piuttosto che una astratta.

Analizzare i dati prendendo campioni rappresentativi della popolazione è chiamata analisi inferenziale

L'arte del campionamento:

La regola d'oro è di estrarre i campioni randomicamente, rimanendo senza bias (quindi ogni elemento ha la stessa probabilità di essere selezionato) e mantenendo la selezione indipendente (Cioè la selezione di un elemento non influisce su quella degli altri). E ci deve essere pure una sufficiente numerosità

Certe volte il campionamento può andare male:
	Durante un sondaggio chiedo solo ad una certa demografica (Selection Bias)
	In un sondaggio raccolgo solo le risposte molto motivate e ignoro le mancate risposte (Response Bias)
	Un sondaggio telefono manca chiunque non possegga un telefono (Coverage Bias)

La grandezza del campione conta
Più campioni ho, più è difficile cadere nel "sotto-campionamento", ma aumenta anche il rischio di prendere troppi dati

Le popolazioni sono complesse, e per semplificarle si ricorre al campionamento stratificato, che consiste nel dividere la popolazione in sottogruppi omogenei basandosi su una variabile rilevante. Nel caso di persone per esempio questa variabile potrebbe essere il Lavoro. E successivamente si fa un campionamento random per ogni strato, per assicurare una rappresentazione proporzionata

Ovviamente è un processo possibile solo quando ho informazioni che rispettano certe proprietà a mia disposizione

La media di un campionamento random può essere utile a capire se c'è qualche problema all'interno dei dati. Nel caso di un panificio, se generalmente ho una produzione di biscotti stimata di $\hat\mu=1000g$ , se in genere ho una media $\hat\mu_1=999.7g$ va bene, se invece dovesse discostare troppo come $\hat\mu_2=400g$ chiaramente c'è stato un problema nel giorno 2

Posso capire la media totale della popolazione anche a partire dalla media dei sottoinsiemi, che generalmente dovrebbe essere vicina al valore effettivo:
$$
\huge \overline X=\frac{X_1+X_2+\dots+X_n}{n}
$$
E secondo il teorema centrale del limite sappiamo che la distribuzione della media campionaria dovrebbe prendere la forma di una Gaussiana

$$
\huge E[\overline X]= E[\frac{1}{n}\sum_{i=1}^n X_i]=\frac{1}{n}\sum_{i=1}^{n} E[X_i]=\mu
$$
$$
\huge Var[\overline X]= Var[\frac{1}{n}\sum_{i=1}^n X_i]=\frac{1}{n^2}\sum_{i=1}^{n} Var[X_i]=\frac{\sigma^2}{n}
$$$$
\huge Std[\overline X]=\frac{\sigma}{\sqrt n}
$$
Errore Standard:
La deviazione standard comunque dipende dalla varianza della popolazione, che non posso calcolare.
In genere quindi vado ad usare la deviazione standard del campione:
$$
\huge s_{n-1}=\sqrt{\frac{1}{n-1}\sum_{i=1}^n (x_i-\overline x)^2}
$$
E definisco l'errore standard (SE) come:
$$
	\huge SE(\overline x)= \frac{s_n -1}{\sqrt n}
$$
Queste formule però non sono sempre vere, in genere negli esempio pratici troveremo che l'SE =$\Large \frac{1}{\sqrt n}$

Quando ho campioni piccoli, ho divergenze dalla gaussiana sostanziali che mi costringono a cambiare distribuzione. In questi casi si usa la "T-distribution". Ha una formula simile allo z-scoring, e questo perché effettivamente stiamo normalizzando per far "somigliare" questa distribuzione ad una gaussiana

$$
\huge T_{n-1}=\frac{\overline X -\mu}{s_{n-1}/\sqrt n}
$$
Intervalli di confidenza:
Ho un modo per stimare un $\overline x$, ma con campioni molto grandi queste stime medie potrebbero differire. Quindi andiamo a definire dei limiti per queste differenze, per capire dove la vera media $\mu$ probabilmente si trova.

$$
\huge P(\mu-\sigma\leq\overline x \leq \mu+\sigma)=0.683
$$

E troviamo conferma della validità di questo intorno anche nel teorema centrale del limite.

E possiamo quindi scrivere la formula come:
$$
\huge P(\overline x-\sigma\leq\mu \leq \overline x+\sigma)=0.683
$$
In generale, scelta una percentuale $p$, che chiamiamo livello di confidenza, possiamo ottenere un numero $\beta$ tale che:
$$
\huge [\overline x-\beta SE(\overline x),\overline x+\beta SE(\overline x)]
$$
Oppure possiamo scegliere un livello di significanza $\alpha$ che quantifica quante volte il valore della vera media ricade al di fuori dell'intervallo da noi scelto

Solitamente si sceglie $\alpha=0.05$

Quando si imposta un livello di significatività $\alpha = 0.05$ (ovvero un livello di confidenza del 95%), il valore critico $\beta$ corrispondente nella distribuzione normale è circa $1.96$. L'intervallo di confidenza per la media diventa quindi:

$$\huge[\overline x - 1.96 \cdot SE(\overline x), \overline x + 1.96 \cdot SE(\overline x)]$$

In pratica, per calcolare gli intervalli di confidenza di altre grandezze si usano distribuzioni diverse: la distribuzione $t$-Student per le medie (quando $n$ è piccolo), e la distribuzione $\chi^2$ per stimare gli intervalli di confidenza della varianza.

Bootstraping:
Per trovare un intervallo di confidenza con campioni in cui non esiste una formula ben precisa

È un metodo molto più flessibile ma più fragile, cioè potrebbe essere meno affidabile

Prendiamo il campione originale di grandezza $n$
Vado a creare dei sotto-campioni della stessa grandezza con dei rimpiazzi, prendendo più volte dei valori
Calcolo la statistica che mi serve da ciascun campione
Creo una rappresentazione empirica di questi dati e la osservo

Dopo aver calcolato la statistica per migliaia di sotto-campioni e aver costruito la distribuzione empirica, l'intervallo di confidenza al 95% si ottiene semplicemente estraendo il 2.5-esimo percentile (limite inferiore) e il 97.5-esimo percentile (limite superiore) della distribuzione ottenuta.

BIAS:
Definiamo $T(X)$ come un generico stimatore (ad esempio, la media campionaria) di un parametro reale della popolazione $\phi$ (ad esempio, la vera media $\mu$). Essendo basato su un campione casuale, $T(X)$ è esso stesso una variabile casuale.

- **Bias di uno stimatore:** Misura se lo stimatore sovrastima o sottostima sistematicamente il vero valore.
$$\huge Bias_\phi(T(X)) = E[T(X)] - \phi$$

Se $E[T(X)] = \phi$, lo stimatore si dice **non distorto** (unbiased). La media campionaria $\overline X$ è uno stimatore non distorto della media della popolazione $\mu$. Al contrario, la varianza campionaria standard $s_n^2 = \frac{1}{n}\sum (x_i - \overline x)^2$ è distorta (tende a sottostimare). Per questo si utilizza lo stimatore non distorto dividendo per $n-1$:
  
 $$\huge s_{n-1}^2 = \frac{1}{n-1}\sum_{i=1}^n (x_i - \overline x)^2$$
  
- **Varianza di uno stimatore:** Indica quanto la stima fluttua al variare del campione estratto. Una varianza bassa indica stime stabili e coerenti.

$$\huge Var(T(X)) = E[(T(X) - E[T(X)])^2]$$

**Trade-off Bias-Varianza** L'obiettivo ideale è avere uno stimatore con basso bias e bassa varianza (paragonabile a lanciare delle freccette che colpiscono tutte il centro del bersaglio in modo molto ravvicinato). Esistono quattro scenari:

- **Basso bias, bassa varianza:** Tutte le stime sono vicine tra loro e concentrate sul vero valore.

- **Basso bias, alta varianza:** In media le stime centrano il valore reale, ma i singoli risultati sono molto sparpagliati.

- **Alto bias, bassa varianza:** Le stime sono molto coerenti e vicine tra loro, ma sistematicamente lontane dal vero valore.

- **Alto bias, alta varianza:** Le stime sono completamente sparpagliate e distanti dal bersaglio.

I test di ipotesi vengono usati per sfidare una specifica affermazione su un parametro della popolazione. Ogni test si basa su due ipotesi contrapposte:

- **Ipotesi Nulla ($H_0$):** L'ipotesi predefinita che stiamo cercando di confutare (es. "La media della popolazione è esattamente 1000g").

- **Ipotesi Alternativa ($H_a$):** L'ipotesi che abbracciamo se rifiutiamo $H_0$ (es. "La media della popolazione è diversa da 1000g").


**Metriche decisionali:**

- **Livello di significatività ($\alpha$):** La soglia di errore che siamo disposti ad accettare (tipicamente 0.05, ovvero il 5%).

- **p-value:** La probabilità di osservare una statistica di test estrema (o più estrema) di quella calcolata, _assumendo che l'ipotesi nulla $H_0$ sia vera_. Se il p-value è minore di $\alpha$, si rifiuta $H_0$.


**Tipi di Errore nei Test Statistici:** Siccome la decisione è basata su un campione, ci sono due tipi di errori possibili:

1. **Errore di Tipo I (Falso Positivo):** Si rifiuta l'ipotesi nulla $H_0$ quando in realtà è vera. La probabilità di commettere questo errore è pari ad $\alpha$.

2. **Errore di Tipo II (Falso Negativo):** Non si rifiuta l'ipotesi nulla $H_0$ quando in realtà è falsa (ci si lascia sfuggire un effetto reale).


**Test a una o due code (One-tailed vs Two-tailed):** Dipende da come è formulata l'ipotesi alternativa $H_a$:

- **A due code:** Se $H_a$ ipotizza una semplice differenza ($\mu \neq \mu_0$), si analizza la probabilità su entrambe le code della distribuzione ($P(\vert{}x\vert{} > \vert{}z\vert{})$).

- **A una coda:** Se $H_a$ ipotizza una direzione precisa, maggiore o minore ($\mu > \mu_0$ oppure $\mu < \mu_0$), si calcola l'area di una singola coda.

A seconda del tipo di dati (medie, distribuzioni categoriche, correlazioni), si usano test specifici:

**Test per le Medie (T-Test):**

- **One Sample T-Test:** Determina se la media di un singolo campione è significativamente diversa da un valore noto o ipotizzato.

- **Two Sample T-Test:** Verifica se c'è una differenza significativa tra le medie di due campioni completamente indipendenti (es. per capire se due popolazioni differiscono o derivano dalla stessa distribuzione).


**Test per Variabili Categoriche (Chi-Quadro / $\chi^2$):**

- **Chi-Square Test for Independence:** Determina se esiste un'associazione (o se sono indipendenti) tra due variabili categoriche. Spesso si usa una tabella di contingenza per confrontare le frequenze osservate con le frequenze attese in caso di indipendenza.

- **Chi-Square Goodness-of-Fit Test:** Verifica se un set di dati categorici osservati segue una specifica distribuzione teorica attesa. Se il p-value è grande, non possiamo scartare l'ipotesi che i dati seguano la distribuzione ipotizzata.


**Test di Correlazione:**

- **Test di Pearson / Spearman:** Valutano se un piccolo coefficiente di correlazione osservato (es. $0.10$) sia statisticamente significativo o se sia emerso solo per puro caso. L'ipotesi nulla stabilisce che nella popolazione il vero coefficiente di correlazione è pari a zero.


**Test di Normalità (Verificare se un campione è Gaussiano):**

- **Q-Q Plots (Quantile-Quantile):** Metodo visivo. Confronta i quantili dei dati empirici standardizzati con quelli della distribuzione normale teorica. Se il campione è gaussiano, i punti si allineano sulla diagonale $y=x$. Una curva che devia verso l'alto o verso il basso indica asimmetria (skewness), mentre pattern a "S" indicano code troppo pesanti o troppo leggere.

- **Test di Shapiro-Wilk:** Test formale per stabilire se un campione deriva da una distribuzione normale, indicato principalmente per campioni di piccole dimensioni ($n \le 2000$).

- **D'Agostino's K-squared Test:** Metodo preferito per campioni grandi ($n \ge 50$); stabilisce la normalità del campione basandosi sul calcolo formale di Skewness (asimmetria) e Kurtosis (schiacciamento).
# 27/10/2026 Lecture 7

Lezione di laboratorio, vedi il dataset scaricato e il notebook

# 29/10/2026 Lecture 8
La regressione lineare è uno strumento potente e fondamentale usato per modellare e definire le relazioni fra variabili e fare predizioni su dati nuovi non visti precedentemente. Alla radice la regressione lineare è una relazione lineare fra una variabile dipendente (Quella che voglio predirre) e una o più variabili indipendenti (Quelle che uso per predirre)

Questa tecnica ci permette di predirre, dedurre associazioni e approfondire come i cambiamenti alle variabili indipendenti influenzano la variabile target. In questi appunti per le regressioni verrà usato come esempio un dataset con dati su delle auto chiamato "Auto MPG Dataset", riferirsi ai pdf per vederlo.

I modelli di regressione in generale mirano a studiare la relazione fra 2 variabili, $X$ e $Y$, definendo un modello matematico $f$ tale che:
$$
\huge Y=f(X)+\epsilon
$$
$\huge\epsilon$ è un termine di errore, una variabile che cattura tutto ciò che non viene mappato dalla funzione deterministica $f$. La funzione $f$ potrebbe non catturare alcuni tipi di valori per varie motivi, di cui i principali:
- $f$ non è una funzione deterministica accurata del processo. Noi non sappiamo la "vera" $f$ e la stiamo solo stimando, in questo caso $\huge\epsilon$ cattura la differenza fra i valori reali e quelli predetti
- $Y$ non può essere predetto solo grazie ad $X$, ma sono necessarie anche altre variabili
- Il problema analizzato ha una stocasticità intrinseca che non può essere modellata nella sua interezza. Ad esempio, volessimo analizzare il rateo di vittoria a poker basandoci sulla competenza del giocatore, sarebbe complicato perché comunque ci sono fattori di casualità esterni come ad esempio il modo in cui è stato mescolato il mazzo

La semplice regressione lineare punta a modellare la relazione lineare fra due variabili $X$ e $Y$. In base al nostro esempio, considereremo $X= horsepower$ e $Y= mpg$.
Visto che stiamo cercando di modellare la relazione, possiamo immaginare una linea che passa attraverso i dati.

La regressione lineare semplice è definita come:
$$
\huge Y\approx \beta_0+\beta_1X
$$
Che nel nostro esempio sarebbe:
$$
\huge mpg \approx \beta_0+\beta_1horsepower
$$
Spesso viene introdotta una variabile di "rumore" per eliminare l'approssimazione, e la formula diventa:
$$
\huge Y= \beta_0+\beta_1X+\epsilon
$$
Spiegheremo dopo il perché, ma ci aspettiamo che $\huge\epsilon$ sia piccola e distribuita randomicamente.

In base al modello sopra definito, chiameremo:
- $X$ La variabile indipendente o regressore
- $Y$ La variabile dipendente o variabile regressa
- I valori $\beta_0$ o $\beta_1$ sono chiamati coefficienti o parametri

Il modello matematico che abbiamo analizzato ha un'interpretazione geometrica, e per questo tendiamo a stimare dei valori adeguati per $\beta_0$ e $\beta_1$ in modo tale che possano rappresentare bene i nostri dati. Nel caso del nostro esempio, ci aspettiamo un risultato del genere:![[Screenshot 2026-11-07 123042.png]]
Questa linea viene chiamata linea di regressione

Per poter stimare i coefficienti per un modello ottimale, bisogna prima definire cos'è un modello ottimale. Diremo che un buon modello è uno che riesce a predirre bene la variabile $Y$ a partire dalla variabile $X$.

Prendiamo {$\Large (x_i,y_i)$} come set di osservazioni, e prendiamo $\huge \hat Y_i = \hat\beta_0+\hat\beta_1 x_i$ come modello per l'osservazione $\Large x_i$.
Per ogni punto $\Large (x_i,y_i)$ definiamo un valore di deviazione come:
$$
\huge e_i=y_i-\hat y_i
$$
Usiamo il simbolo $\Large e$ per l'errore e chiamiamo questi numeri residui, visto che sono la differenza fra la nostro predizione e il valore effettivo.
Questi numeri saranno uguali a 0 se la predizione è perfetta, anche se è estremamente improbabile.

Come indicatore globale dell'errore per il modello definiamo la somma quadrata dei residui (RSS Residual Sum of Squares):
$$
\huge RSS=e_{1}^{2}+e_{2}^{2}+\dots+e_{n}^{2}
$$
# 03/11/2026 Lecture 9

Regressione logistica

Cerca di risolvere un problema diverso, ma hanno tanti punti in comune

La regressione lineare ha dei limiti, grafica solo modelli lineari e quindi è abbastanza rigida. In compenso sono veloci e compatti, non devono memorizzare i dati di training e riescono a predirre su nuovi esempi facilmente

Per esempio, nel caso dei casi di cancro al seno presente nelle slide non possiamo usare la regressione lineare in quanto i casi sono binari. La rappresentazione verrebbe cosi in questo caso:![[Screenshot 2026-11-03 152824.png]]

Per modellare un caso del genere potrebbe essere interessante passare ad un modello basato sulle probabilità, invece di modellare direttamente la diagnosi.
$$
\huge P(Diagnosis=1|radius_1)
$$

Prima avevo solo 2 valori possibili, ora ho un range di valori compresi nell'intervallo $[0,1]$

Per dimensioni troppo piccole del tumore sono sicuro sia benigno e viceversa, ma come rappresento i valori di mezzo?
Se la probabilità fosse lineare non avrei mai 0 e 1 come risultati, quindi solitamente la probabilità ha una forma ad S nel grafico

La funzione logistica ha esattamente le proprietà che ci servono
$$
\huge f(x)=\frac{1}{1+e^{-x}}
$$
Ha range $[0,1]$
Approccia 0 e 1 agli estremi
È differenziabile, utile per l'ottimizzazione

Dato un evento binario, le odds di tale evento è una frazione
$$
\huge Odds=\frac{P(event)}{1-P(event)}
$$
E solitamente sono numeri interi.
Se scrivo 3/1, significa che il primo evento è 3 volte più probabile del secondo
Sostanzialmente è il rapporto fra la probabilità che un evento avvenga e che non avvenga

Per definire il regressore logistico posso usare la funzione logistica:

$$
\huge P(Y=1|X)=f(\beta_0+\beta_1X)=\frac{1}{1+e^{-(\beta_0+\beta_1X)}}
$$
Da cui deriva:
$$
\huge e^{\beta_0+\beta_1x_1+\dots+\beta_nx_n}=\frac{P(Y=1|X)}{1-P(Y=1|X)}
$$

Possiamo vedere la regressione logistica come una regressione lineare applicata non direttamente alla probabilità, ma al logaritmo degli odds. Partendo dalla definizione degli odds, se applichiamo il logaritmo a entrambi i membri otteniamo il **Logit** (o log-odd):

$$\huge\log\left(\frac{P(Y=1\vert{}X)}{1-P(Y=1\vert{}X)}\right) = \beta_0 + \beta_1x_1 + \dots + \beta_nx_n$$

Questo dimostra come il modello utilizzi effettivamente una combinazione lineare dei parametri per modellare il logaritmo degli odds

Stima dei parametri per verosimiglianza:
Nella regressione lineare cercavamo di minimizzare la somma dei quadrati dei residui (Metodo dei Minimi Quadrati). Nella regressione logistica questo non è possibile perché il modello prevede probabilità, non valori continui. Utilizziamo invece la **Stima di Massima Verosimiglianza (Maximum Likelihood Estimation - MLE)**.

Per ottimizzare il modello, si trasforma la massimizzazione della verosimiglianza nella _minimizzazione del suo logaritmo negativo_. La funzione di costo risultante prende il nome di **Log-Loss** (o Binary Cross-Entropy):

$$\Large J(\beta) = -\sum_{i=1}^{N} \left[ y^{(i)} \log \sigma(\beta^T x^{(i)}) + (1 - y^{(i)}) \log(1 - \sigma(\beta^T x^{(i)})) \right]$$

Caratteristiche dell'ottimizzazione:

- Non esiste una soluzione in forma chiusa; si utilizzano metodi iterativi come la **Discesa del Gradiente**.

- La funzione di costo $J(\beta)$ è matematicamente **convessa**. Questo significa che il suo grafico ("Loss Landscape") ha la forma di una singola "ciotola" liscia, senza minimi locali. L'algoritmo di discesa del gradiente ha quindi la garanzia matematica di trovare sempre il singolo minimo globale ottimale.

Poiché il modello è lineare rispetto al logaritmo degli odds, l'interpretazione dei coefficienti richiede di usare la funzione esponenziale:

- **Intercetta ($\beta_0$):** Il valore $e^{\beta_0}$ rappresenta gli odds di base, ovvero gli odds che l'evento $Y=1$ si verifichi quando tutte le variabili indipendenti $X$ sono pari a 0.
	(Se $\huge e^{\beta_0}=3$ significa che quando tutti gli input sono uguali a 0 la probabilità che $y = 1$ è 3 volte più probabile che $y = 0$)

- **Coefficienti delle variabili ($\beta_i$):** Un incremento di _una singola unità_ nella variabile $x_i$ (mantenendo costanti tutte le altre) corrisponde a un incremento **moltiplicativo** degli odds pari a $e^{\beta_i}$. Ad esempio, se $e^{\beta_1} = 1.86$, un aumento unitario in $x_1$ fa aumentare le probabilità (odds) dell'evento dell'86%

Non possiamo usare il classico $R^2$ della regressione lineare, perché quest'ultimo penalizza i residui al quadrato, cosa che non ha senso quando si valutano previsioni di probabilità (Log-Loss). Si utilizza invece lo **Pseudo $R^2$ (o $R^2$ di McFadden)**, che segue la stessa logica comparativa:

$$\huge R^2_{McFadden} = 1 - \frac{LL_{Model}}{LL_{Null}}$$

- **$LL_{Null}$ (Log-Likelihood Null):** È la log-verosimiglianza di un modello "stupido" o di base (modello _intercept-only_), che ignora tutte le variabili indipendenti e prevede sempre e solo la media o probabilità a priori (es. prevede sempre che il cancro sia maligno al 35% perché quella è la frequenza nel dataset).

- **$\large LL_{Model}$:** È la log-verosimiglianza del nostro modello addestrato.

- **Interpretazione:** Simile all'$R^2$ classico, ci indica quanta devianza (incertezza nell'outcome) il nostro modello è riuscito a spiegare rispetto al modello di base che tira a indovinare la media. Questo valore è utile solo per confrontare modelli di regressione logistica tra loro, e non è matematicamente equivalente all'$R^2$ dei minimi quadrati

Mentre lo Pseudo $R^2$ serve a valutare la bontà di adattamento del modello rispetto alle probabilità (goodness-of-fit), se utilizziamo il regressore logistico con uno scopo puramente predittivo (ovvero per classificare nuovi dati) possiamo valutare le sue performance usando le metriche classiche di classificazione:

- Accuratezza (Accuracy)
- Precisione (Precision)
- Richiamo (Recall)
- F1-score
- Matrice di confusione (Confusion matrix)

Quando si allena un modello di regressione logistica multipla (ad esempio tramite la libreria *statsmodels* in Python), l'output restituisce i coefficienti stimati per ogni variabile insieme al loro **p-value**. Non tutte le variabili inserite nel modello avranno necessariamente una relazione statisticamente rilevante con la variabile dipendente.

Per ottimizzare il modello si utilizza un processo iterativo chiamato **eliminazione all'indietro** (backward elimination):

1. Si addestra il modello con tutte le variabili.
2. Si individua la variabile con il p-value più alto (sicuramente se $> 0.05$).
3. Si elimina quella variabile e si riaddestra il modello.
4. Si ripete il processo finché tutte le variabili rimaste presentano un p-value accettabile, indicando che sono tutte statisticamente significative.


Solo a questo punto ha senso estrarre gli esponenziali dei coefficienti ($e^{\beta_i}$) per interpretare in modo definitivo l'impatto (gli incrementi moltiplicativi sugli odds) di ciascuna variabile sul risultato finale.
# 05/11/2026 Lecture 10

Tutorato ci sta, figo

Modelli di regressione sono estendibili
Le limitazione dei modelli che abbiamo visto sono:
- Non riescono a gestire pattern non lineari
- Non riescono a gestire la multipla co-linearità

I termini di interazione possiamo usarli per permettere l'interazione fra più variabili che pensiamo siano correlate
Esempio:
$$
\Large mpg=\beta_0+\beta_1horsepower+\beta_2weight+\beta_3(horsepower\text{~} x\text{~} weight)
$$

Stiamo comunque parlando di una relazione lineare in questo caso, quindi posso continuare ad applicare il metodo ols.![[Screenshot 2026-11-05 153407.png]]

Se il valore di $horsepower\text{~} x\text{~} weight$ è quasi 0 si può togliere in quanto non è molto significativo

È molto utile perché in questo modo la variabile non è lineare nel nostro scope, ma è comunque lineare nel caso di $\beta_0,\beta_1$ ecc.

Dall'idea di aggiungere coefficienti di grado superiore per descrivere meglio la curva nasce la regressione polinomiale. Il numero di gradi di una funzione indica quanti flessi è in grado di avere, e quindi teoricamente più è alto il grado più è probabile sia in gradi di mappare un gran numero di funzioni. La presenza di tante variabili però è anche una limitazione in quanto il minimo cambiamento di una condizione del dataset lo cambia totalmente, quindi il modello potrebbe non funzionare più e dovrebbe quindi essere ricalibrato

