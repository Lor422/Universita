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

