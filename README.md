1) Aprire il progetto

2)Installare l'ultima versione di node: https://nodejs.org/it/

2) npm insatall
   -express
   -body-parser
   -mysql

3) Importare il Database Syn_db su una applicazionedi gestione di db (SequelPro,     MariaDB ecc..)

4) Avviare il server (nel mio caso tramite XAMPP)

5) Cambiare le porte in Synesthesia.postman_collection.json

6)Importare Synesthesia.postman_collection.json su Postman

7) Cambiare la connesione in base all propria porta, host, password.


    host:'localhost',
    port:'3306',
    user:'root',
    password:'', //empty for window
    database: 'Syn_db'


8) Avviare il tutto con il comando: node server.js.

9) Se è partita la connessione (connected sul terminale) verificare prima le chiamate GET sul localhost: http://localhost/Syn_db/utenti e terminale.

10) Verificare le chiamate GET, POST, PUT su Postman.


