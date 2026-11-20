Teoria Riccobene:
- [[1Applications_N.pdf]]
- [[2Transport_N.pdf]]
- [[3Network_N.pdf]]
- [[4DLL.pdf]]
Libro:
- [[Reti_di_calcolatori_e_Internet_Un_approccio_top_down_8th_J_F_Kurose.pdf]]
Slide Laboratorio:
- [[slides_computer_networks_pub.pdf]]
Link utili:
- https://tendto.github.io/Tutorato-Reti-di-Calcolatori/lezioni/5-Esercizi/

Informazioni utili:

Un programma di messaggistica per cui ogni host poteva comunicare a cerchio con tutti gli altri, avendo solamente l'indirizzo del nodo successivo
con udp
e ogni nodo poteva mandare un messaggio unicast o broadcast
per "a cerchio" intendo:
host 1 vuole mandare messaggio a host 4, manderà il messaggio a host 2, successivamente verrà inoltrato a host 3 fino a host 4 che lo leggerà
in più c'era un logger che era unico, in udp anch'esso e riceveva e stampava informazioni su messaggi inviati/ricevuti dagli host

Vedi sempre repository Andrea Ghirlando

Domande Reti:

Domanda 7

All'interno del protocollo TCP, la trasmissione dei dati è regolata da due meccanismi di controllo fondamentali che agiscono sulla dimensione della finestra di invio, ma che rispondono a problemi completamente differenti: il Controllo di Flusso e il Controllo della Congestione.

- Domanda: Spiegami con precisione la differenza strutturale tra questi due meccanismi. Chi determina il valore della variabile rwnd (Receive Window), chi determina il valore della variabile cwnd (Congestion Window) e in che modo il mittente TCP combina matematicamente questi due valori per decidere quanti byte di dati può effettivamente immettere nella rete in un dato istante?


  

Risposta alla domanda 7:

TCP quando riceve dei pacchetti che non hanno errori, li piazza in un buffer di ricezione da cui poi l'applicazione li leggerà quando possibile. Questo però significa che a seconda della velocità di lettura dati dell'applicazione, potrebbe esserci un overflow di pacchetti nel buffer. Il controllo di flusso di TCP risolve questo problema creando e mantenendo nel destinatario una variabile chiamata finestra di ricezione (rwnd, receive window), la cui grandezza è basata sulla dimensione del buffer di ricezione, e delle variabili che registrano l'ultimo byte letto (LastByteRead), l'ultimo byte ricevuto (LastByteRcvd) e la grandezza del buffer (RcvdBuffer), e nel mittente due variabili, LastByteSent e LastByteAcked (In realtà tcp essendo fullduplex, sia mittente che destinatario hanno tutte queste variabili). Per non mandare il buffer in overflow, la variabile rwnd prende il valore dello spazio disponibile nel buffer, quindi rwnd = RcvdBuffer-(LastByteRcvd-LastByteRead). Durante tutta la connessione il mittente si assicura che ci sia spazio nel buffer del destinatario mantenendo vera la disuguaglianza LastByteSent-LastByteAcked <= rwnd

  
  

Il controllo di congestione tcp invece è effettuato tenendo d'occhio la congestione di rete percepita, aggiungendo una nuova variabile che tiene conto di una finestra di congestione chiamata cwnd, e si assicura che ad ogni invio i dati senza acknowledge non superino la soglia di spazio disponibile nel buffer di ricezione grazie alla disequazione LastByteSent-LastByteAcked <= min (cwnd,rwnd)

  

A questo punto l’algoritmo di controllo di congestione di TCP ha 3 fasi: Slow start, Congestion Avoidance e Fast Recovery

 cwnd di base è impostato ad 1 MSS (Maximum Segment Size) all’inizio della fase di slow start e viene raddoppiato ogni volta che TCP riceve un ACK, e quindi viene raddoppiata la velocità di trasmissione ad ogni RTT. Se c’è un evento di perdita (3 ACK duplicati oppure un timeout) cwnd viene rimesso a 1 e inizia di nuovo la fase di slow start, e una variabile chiamata ssthresh (Slow Start Threshold) viene messa a cwnd/2, con cwnd ovviamente prima di essere riportato a 1. Quando cwnd == ssthresh, allora lo slow start finisce e si entra in congestion avoidance. Qui, cwnd viene aumentato di 1 MSS ad ogni RTT fino a quando non c’è un evento di perdita, qui viene fatta la stessa cosa dello slow start, però quando l’evento di perdita è nello specifico 3 ack duplicati cwnd viene dimezzato e ssthresh viene messo alla metà del valore che c’è in quel momento di cwnd, e si passa poi alla fase di fast recovery.

In questa fase cwnd viene incrementato di 1 MSS per ogni ACK duplicato ricevuto in relazione al segmento che ha fatto entrare TCP in fast recovery

# Simulazione d'Esame: Reti di Calcolatori (Kurose-Ross Cap. 1-6)

Documento di allenamento intensivo per l'esame orale/scritto.

## LIVELLO DI APPLICAZIONE (Cap. 2)

Domanda 1: DNS e Architettura Il DNS utilizza principalmente il protocollo di trasporto UDP. Tuttavia, l'UDP è un protocollo inaffidabile, che non garantisce la consegna.

- Perché i progettisti di Internet hanno scelto l'UDP per il DNS anziché il TCP?
    
- Cosa succede a livello di applicazione se una query DNS via UDP va persa nella rete? Chi si occupa di ritrasmetterla e come?
    

Domanda 2: Cookie e HTTP L'HTTP è un protocollo "stateless" (senza stato). Spiega esattamente come l'introduzione dei Cookie (tramite l'header Set-Cookie e Cookie) permetta a un sito web di mantenere lo stato dell'utente. A quale livello dello stack TCP/IP vengono generati e interpretati i cookie?

## LIVELLO DI TRASPORTO (Cap. 3)

Domanda 3: TCP e Gestione dei Timer Nel protocollo TCP, la determinazione del Timeout per le ritrasmissioni è dinamica. Spiega a cosa servono l'EstimatedRTT e il DevRTT nel calcolo del TimeoutInterval. Perché è matematicamente disastroso utilizzare un timer di timeout fisso (es. sempre 500ms) per tutte le connessioni su Internet?

Domanda 4: UDP e Checksum Sebbene l'UDP sia "senza fronzoli" e non offra affidabilità, include comunque un campo Checksum nel suo header. Spiega come viene calcolato il checksum UDP. Se il checksum fallisce al ricevitore, l'UDP invia forse un messaggio di errore al mittente? Cosa fa esattamente con il pacchetto corrotto?

## LIVELLO DI RETE: PIANO DEI DATI (Cap. 4)

Domanda 5: NAT (Network Address Translation) Questa è la domanda 8 che avevamo lasciato in sospeso. Descrivi in modo dettagliato come avviene la traduzione dei pacchetti (IP e porte) all'interno della tabella di traduzione NAT quando un host della rete locale (es. 192.168.1.5) invia una richiesta a un server esterno. Inoltre, cita un motivo architetturale per cui i puristi delle reti ritengono che il NAT sia una "violazione" dei principi fondamentali del modello TCP/IP.

Domanda 6: Indirizzamento IPv4 (CIDR) Un ISP ti ha assegnato il blocco di indirizzi CIDR 130.50.64.0/22. Qual è il numero massimo di indirizzi IP utili (host) che puoi assegnare all'interno di questa sottorete? Spiega matematicamente come ottieni questo numero partendo dal suffisso /22.

## LIVELLO DI RETE: PIANO DI CONTROLLO (Cap. 5)

Domanda 7: ICMP (Internet Control Message Protocol) L'ICMP è considerato a livello di rete, eppure i suoi messaggi sono incapsulati all'interno dei datagrammi IP (come se fosse un protocollo di livello superiore). Spiega il ruolo principale dell'ICMP. Inoltre, descrivi esattamente come lo strumento Traceroute sfrutta "furbescamente" il campo TTL (Time to Live) dell'IP e i messaggi di errore ICMP per mappare i router intermedi.

  

## LIVELLO DI COLLEGAMENTO (Cap. 6)

Domanda 9: Ethernet vs Wi-Fi (CSMA/CD vs CSMA/CA) Questa è la domanda 9 che avevamo in sospeso. Nel cavo Ethernet (802.3) si usa CSMA/CD, mentre nel Wi-Fi (802.11) si usa CSMA/CA. Perché nel Wi-Fi è strutturalmente impossibile o inefficace utilizzare il "Collision Detection" (CD) tipico di Ethernet? Spiega i problemi fisici del mezzo radio, citando esplicitamente l'attenuazione e il problema del "nodo nascosto".

Domanda 10: Switch e Tabelle MAC Gli Switch operano "plug-and-play" tramite auto-apprendimento. Immagina che il Nodo A invii un frame al Nodo B, ma il MAC del Nodo B non è presente nella tabella dello switch. Cosa fa fisicamente lo switch con questo frame? Come e quando riuscirà finalmente ad associare il MAC del Nodo B alla porta corretta nella sua tabella?

ESERCIZIO DI RETI

Testo: Un'applicazione trasferisce 120 MiB attraverso un percorso con collo di bottiglia a 50 Mbit/s. Ogni pacchetto contiene 1000 byte di payload e 60 byte di overhead complessivo, l'RTT è 80 ms.

1. Calcola la banda utile usando solo l'overhead
    
2. Calcola il bandwidth-delay product del percorso in byte e KiB
    
3. Per il messaggio M = 10110010 e generatore G = 10011 calcolare il CRC. Si riceve R = 101100101111, sapendo che c'è al massimo un errore di bit, individuare e correggere il bit errato
    

SOLUZIONE E SPIEGAZIONE DETTAGLIATA

1. Calcolo della Banda Utile (Useful Bandwidth) La banda nominale (collo di bottiglia) è la velocità fisica del canale, ovvero R = 50 Mbit/s. Tuttavia, non tutti questi bit trasportano i dati dell'applicazione, perché ogni pacchetto ha un "peso morto" chiamato overhead (le intestazioni aggiunte dai vari livelli TCP, IP, Ethernet).
    

- Dimensione totale del pacchetto: 1000 byte (payload) + 60 byte (overhead) = 1060 byte.
    
- Efficienza del pacchetto: È il rapporto tra i dati utili e la dimensione totale. 1000 / 1060 = 0.9434 (cioè il 94.34%)
    
- Banda Utile: Moltiplichiamo la banda nominale per l'efficienza. 50 Mbit/s * 0.9434 = 47.17 Mbit/s
    

2. Calcolo del Bandwidth-Delay Product (BDP) Il BDP rappresenta la quantità massima di dati "in volo" (non ancora confermati) che possono riempire fisicamente il canale da un estremo all'altro in un dato istante.
    

- Banda (R): 50 Mbit/s = 50.000.000 bit/s
    
- Ritardo (RTT): 80 ms = 0.080 s
    
- Calcolo BDP in bit: 50.000.000 bit/s * 0.080 s = 4.000.000 bit
    
- Conversione in Byte: 4.000.000 bit / 8 = 500.000 Byte
    
- Conversione in KiB: Sapendo che 1 KiB = 1024 Byte 500.000 / 1024 = 488.28 KiB
    

3. Calcolo e Correzione del CRC Questa è un'operazione hardware del Livello di Collegamento basata sulla divisione polinomiale modulo 2 (che equivale all'operazione logica XOR bit a bit).
    

Fase A: Calcolo del CRC corretto

- Messaggio (M): 10110010
    
- Generatore (G): 10011 (Essendo lungo 5 bit, il grado "r" è 4. Dobbiamo aggiungere 4 zeri al messaggio).
    
- Dividendo: 101100100000
    

Eseguiamo lo XOR saltando gli zeri iniziali (Mostrato in formato testuale lineare per Word): 10110 (primi 5 bit) XOR 10011 = 00101 Aggiungiamo uno 0: 10100 XOR 10011 = 00111 Aggiungiamo uno 0: 11100 XOR 10011 = 01111 Aggiungiamo uno 0: 11110 XOR 10011 = 01101 Aggiungiamo l'ultimo 0: 11010 XOR 10011 = 01001 Il resto (saltando l'1 iniziale dell'XOR finale) della divisione completa è 0111. Quindi il CRC è: 0111. Il messaggio corretto da trasmettere è: 10110010 + 0111 = 101100100111.

Fase B: Individuazione dell'errore (Sindrome) Abbiamo ricevuto R = 101100101111. Eseguiamo la divisione di R per G. Il resto di questa nuova divisione modulo 2 (sindrome) risulta essere: 1000. Poiché il resto non è 0000, sappiamo con certezza che c'è un errore.

Come si trova il bit errato matematicamente? Il valore 1000 corrisponde alla terza potenza del generatore in base 2:

- 0001 = errore sull'ultimo bit a destra
    
- 0010 = errore sul penultimo bit
    
- 0100 = errore sul terzultimo bit
    
- 1000 = errore sul quartultimo bit a destra
    

Controlliamo il messaggio ricevuto 101100101111. Il quartultimo bit a destra (il primo bit del CRC) è "1". Essendoci stato un errore, lo invertiamo (flip) a "0". Il messaggio corretto diventa quindi 101100100111, che combacia perfettamente con quello che avevamo calcolato originariamente.

APPROFONDIMENTO TEORICO

Che cosa sono MiB e KiB? (La trappola dei Mega) Questa è una differenza fondamentale in informatica:

- MB (Megabyte) e KB (Kilobyte): Usano la matematica in Base 10 (Sistema decimale, prefissi del Sistema Internazionale). 1 KB = 1000 byte. 1 MB = 1.000.000 byte. Le velocità di rete (Mbit/s) o la capacità degli hard disk usano sempre questa base.
    
- MiB (Mebibyte) e KiB (Kibibyte): Usano la matematica in Base 2 (Sistema binario). 1 KiB = 1024 byte. 1 MiB = 1.048.576 byte. La memoria RAM e la dimensione dei file nei sistemi operativi usano storicamente questa scala. L'esercizio ti fa usare i KiB proprio per costringerti a dividere per 1024 e non per 1000.
    

Quali capitoli del Kurose studiare per questo esercizio?

- Capitolo 1 (Reti di calcolatori e Internet): Paragrafo 1.4 sui Ritardi, Perdita e Throughput (per calcolare l'overhead e il Bandwidth-Delay Product).
    
- Capitolo 6 (Il Livello di Collegamento e le Reti Locali): Paragrafo 6.2 sulle Tecniche di Rilevazione e Correzione degli Errori (per tutta la parte matematica sul CRC).
    

—------------------------------

Domanda 1:

I progettisti hanno preferito usare UDP per le risposte DNS perchè più veloce non avendo il three-way handshake e i controlli di flusso e congestione, e questa velocità permette all’applicazione di avere una connessione veloce, traducendo il nome del sito che si vuole visitare in IP , e rimandare la richiesta velocemente in caso la query vada persa

  

Domanda 2:

Il protocollo HTTP è strutturalmente stateless (senza stato), il che significa che il server non mantiene alcuna memoria delle richieste passate dello stesso client. Per permettere ai siti di riconoscere gli utenti e mantenere una sessione (es. un carrello della spesa), vengono utilizzati i Cookie

  

Quando il client visita un sito per la prima volta inviando una normale richiesta HTTP, il server web genera un numero identificativo univoco per quell'utente e crea una voce corrispondente nel proprio database. A questo punto Il server risponde al client inserendo nel messaggio di risposta HTTP un campo di intestazione speciale chiamato set-cookie.

Il browser del client riceve il messaggio, estrae l'ID dato da set-cookie e lo memorizza in un file di testo e da quel momento in poi, ogni volta che il client invierà una nuova richiesta HTTP a quel server, il browser inserirà automaticamente l'intestazione cookie all'interno del messaggio di richiesta con al suo interno l’id precedentemente generato.

In questo modo, leggendo l'header cookie, il server riconosce immediatamente il client, interroga il proprio database e ripristina lo stato dell'utente 

  

Domanda 3:

Il TCP salva l’RTT (Round-Trip Time) misurato di un segmento come SampleRTT, e corrisponde alla distanza di tempo fra l’invio del pacchetto e la ricezione del suo ACK . Inoltre lo calcola solo per i segmenti trasmessi per la prima volta, non lo calcola per le ritrasmissioni. Questo SampleRTT viene poi usato per fare una stima dell’RTT medio della connessione, e viene registrata in EstimatedRTT, con la formula EstimatedRTT= (1-a) * EstimatedRTT + a * SampleRTT con a= 0.125

  

EstimatedRTT è infatti una media ponderata, per dare una maggiore importanza ai campioni recenti visto che rappresentano più fedelmente lo stato della connessione al momento. TCP tiene anche conto della variabilità dell’RTT con DevRTT. Il valore del timeout in TCP viene calcolato con queste due valori con la formula TimeoutInterval= EstimatedRTT+4*DevRTT

  

Mettere in timer fisso può creare grossi problemi in quanto non tenendo conto dell'effettivo stato della connessione potremmo effettuare troppe ritrasmissioni inviando pacchetti inutilmente, oppure troppo poche allungando enormemente il tempo necessario allo scambio di dati 

  

Domanda 4:

UDP include un campo Checksum nel suo header per permettere un controllo dell’integrità del segmento end-to-end . UDP fa la somma con complemento ad uno di tutte le parole da 16 bit nel segmento, un eventuale riporto lo somma al primo bit e mette il valore risultante nel campo Checksum. Il destinatario, questa somma la fa fra tutte le parole a 16 bit del segmento ed il valore del checksum, e se non ci sono state corruzioni ai dati il risultato dovrebbe essere composto solamente da 1. Nonostante UDP offra questo protocollo per rilevare gli errori, non offre nessun servizio per poterlo effettivamente risolvere, semplicemente scarta il segmento errato.

  

Domanda 5:

Il NAT permette una facilitata gestione delle reti interne.

Le reti interne naturalmente tendono ad avere degli IP simili, solitamente del tipo 10.0.0.0/24 e che hanno significato solo all’interno di una data sottorete. Questo però diventa un problema nel caso volessimo collegarci a reti esterne, in quanto ci sarebbero una gran quantità di IP duplicati, oppure ci sarebbe il problema di assegnare un ip univoco ad ogni singolo dispositivo. Il NAT risolve questo problema, rendendo possibile per il router comportarsi come un unico dispositivo, con un’unico IP, che rappresenta l’intera sottorete, in modo che quando qualcuno di esterno cerca di mandare pacchetti alla nostra sottorete, esso verrà inviato all’IP del router e sarà quello poi ad inoltrarlo al suo interno al giusto dispositivo grazie alla Tabella di traduzione NAT.

Alcuni lo ritengono una violazione del classico modello TCP/IP perchè in questo modo gli host non comunicano direttamente

  

Domanda 6:

Se un ISP assegna un blocco di indirizzi del tipo 130.50.64.0/22, il numero massimo di indirizzi assegnabili è 2^10-2, 1022 (2 vengoni tolti perchè sono riservati per uso speciale). Quando vengono assegnati dei blocchi contigui di ip con il metodo CIDR, viene assegnata alla sottorete una maschera di sottorete, il numero successivo allo slash, e quel numero va a simboleggiare il numero di bit a partire da sinistra che in quella sottorete sono uguali. Un ip ha 32 bit, divisi in 4 parti da 8 bit separate da un punto, quindi se viene assegnato un blocco ip con maschera /22, i bit rimanenti che possono cambiare sono 10, da qui 2^10 per calcolare i possibili ip che ha questa sottorete
