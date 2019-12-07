1) Aprire il progetto

2) Installare l'ultima versione di node: https://nodejs.org/it/

3) npm insatall

4) Importare il Database Syn_db su una applicazione legata alla gestione di db (SequelPro, MariaDB ecc..)

5) Avviare il server (nel mio caso tramite XAMPP)

6) Cambiare le porte in Synesthesia.postman_collection.json

7) Importare Synesthesia.postman_collection.json su Postman

8) Cambiare la connesione in base all propria porta, host, password.


    host:'localhost',
    port:'3306',
    user:'root',
    password:'', //empty for window
    database: 'Syn_db'


9) Avviare il tutto con il comando: node server.js.

10) Se la connessione è attiva (connected sul terminale) verificare prima le chiamate GET sul localhost: http://localhost/Syn_db/utenti e terminale.

11) Verificare le chiamate GET, POST, PUT su Postman.


