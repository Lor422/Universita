Un programma di messaggistica per cui ogni host poteva comunicare a cerchio con tutti gli altri, avendo solamente l'indirizzo del nodo successivo
con udp
e ogni nodo poteva mandare un messaggio unicast o broadcast
per "a cerchio" intendo:
host 1 vuole mandare messaggio a host 4, manderà il messaggio a host 2, successivamente verrà inoltrato a host 3 fino a host 4 che lo leggerà
in più c'era un logger che era unico, in udp anch'esso e riceveva e stampava informazioni su messaggi inviati/ricevuti dagli host