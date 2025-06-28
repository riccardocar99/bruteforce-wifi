# Brute-Force WiFi Handshake Capture

Script Bash per automatizzare la cattura dell’handshake WiFi e l’attacco di brute-force.  
In questo progetto useremo il **Flipper Zero** per effettuare lo sniffing (poiché non disponiamo di un’antenna WiFi esterna), ma forniamo anche i comandi per replicare l’intero workflow su Kali Linux.

---

## 📋 Contenuti

- `comandi.sh` – script Bash con tutti i comandi e le descrizioni commentate  
- `rockyou.txt` – wordlist con le password più comuni  
- `sniffraw_0.pcap` – file di prova esportato dal Flipper Zero (o da Kali) dopo la scansione  
- `powerpoint.pptx` – slide PowerPoint con immagini esplicative dell'attacco
- `README.md` – documentazione e guida all’uso  

---

## 🚀 Panoramica

Questo tool guida l’utente attraverso le fasi principali di un attacco di tipo **brute-force** sul handshake WiFi:

1. **Modalità monitor**  
2. **Scansione** (enumerazione di reti e client)  
3. **Deauthentication** (forzatura del disconnect per generare handshake)  
4. **Cattura** dell’handshake e salvataggio in file `.pcap`  
5. **Brute-force** su wordlist (es. `rockyou.txt`)  

Grazie al Flipper Zero, la cattura può essere eseguita direttamente da dispositivo e poi esportata come `.pcap`.

---

## ⚙️ Prerequisiti

- **Flipper Zero** con modulo WiFi e microSD  
- (opzionale) Kali Linux o altra distro con la suite **aircrack-ng**  
- Strumenti installati:
  - `airmon-ng`  
  - `airodump-ng`  
  - `aireplay-ng`  
  - `aircrack-ng`  
- Wordlist di password (in repo: `rockyou.txt`)  

---

## 🛠️ Installazione

```bash
git clone https://github.com/riccardocar99/bruteforce-wifi.git
cd bruteforce-wifi
chmod +x comandi.sh