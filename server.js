//--tutta la gestione dati non ha un interfaccia grafica

//--per i metodi GET è possibile avere un riscontro diretto sul localhost con l'output di un JSON

//--per i metodi POST e PUT il riscontro si può vedere con l'utilizzo della collection su POSTMAN


//i dati nel db sono stati scelti in modo casuale rispecchiando comunque un ristorante.



var express = require('express');
var app = express();
var mysql = require('mysql');
var bodyParser = require('body-parser');
app.use(bodyParser.json({ type: 'application/json' }));
app.use(bodyParser.urlencoded({ extended: true }));
var con = mysql.createConnection({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: '', //empty for window
    database: 'Syn_db'
});
con.connect(function (error) {
    if (error) console.log(error);
    else console.log("connected");
});
app.get('/Syn_db/utenti', function (req, res) {
    con.query('Select * from Utenti order by id', function (error, rows, fields) {
        if (error) console.log(error);

        else {

            console.log(rows);
            res.send(rows);


        }
    });

});
//Calcolo media voti ristorante

app.get('/Syn_db/media', function (req, res) {
    con.query('Select AVG(v.`voto`) media From Utenti v', function (error, rows, fields) {
        if (error) console.log(error);

        else {

            console.log(rows);
            res.send(rows);
        }
    });



});
//Get di tutte le recensioni presenti nel db relativo al ristorante

app.get('/Syn_db/recensioni', function (req, res) {
    con.query('Select u.`Nome` username, u.`Recensione` recensione From Utenti u', function (error, rows, fields) {
        if (error) console.log(error);

        else {

            console.log(rows);
            res.send(rows);
        }
    });
});


// Get di tutti i piatti con reltivo prezzo

app.get('/Syn_db/piatti', function (req, res) {
    con.query('Select p1.`Nome_Piatto` nome, p2.`Prezzo` prezzo from Piatti p1, Prezzo p2 where p1.`id`= p2.`id`', function (error, rows, fields) {
        if (error) console.log(error);

        else {

            console.log(rows);
            res.send(rows);
        }
    });
});

//Get del menù

app.get('/Syn_db/menu', function (req, res) {
    con.query('Select m.`Nome_menu` Menu, p.`Prezzo` prezzo from Menù m, Prezzo p where p.`id` = m.`id`', function (error, rows, fields) {
        if (error) console.log(error);

        else {

            console.log(rows);
            res.send(rows);
        }
    });
});
//Aggiornamento delle recensioni (cambio recensione di un singolo utente)

app.put('/Syn_db/utenti', function (req, res) {
    let user = req.body;
    con.query('UPDATE Utenti u SET u.`Recensione` = ? WHERE u.`id`=?', [user.Recensione, user.id], function (error, rows, fields) {
        if (error) console.log(error);

        else {

            console.log(user);
            res.send('Recensione Aggiornata');

        }
    });
});
//Aggiornamento dei voti (cambio del voto di un singolo utente)

app.put('/Syn_db/voti', function (req, res) {
    let vote = req.body;
    con.query('UPDATE Utenti v SET v.`voto` = ? WHERE v.`id`=?', [vote.voto, vote.id], function (error, rows, fields) {
        if (error) console.log(error);

        else {
            console.log(vote);
            res.send('Voto Aggiornato');
        }
    });
});
//Totale delle recensioni relative al ristorante

app.get('/Syn_db/numero&recensioni', function (req, res) {

    con.query('Select count(u.`Recensione`) as tot from Utenti u', function (error, rows, fields) {
        if (error) console.log(error);

        else {
            console.log(rows);
            res.send(rows);
        }
    });
});
//Inserimento di una recensione di un utente nuovo(con proprio nome e voto)

app.post('/Syn_db/insert', function (req, res) {
    let user = req.body;
    con.query('Insert into Utenti(Nome, Recensione, voto) values(?, ?, ?)', [user.Nome, user.Recensione, user.voto], function (error, rows, fields) {
        if (error) console.log(error);

        else {
            console.log('Aggiunto:' + user);
            res.send('Aggiunto');
        }
    });
});
app.get('/Syn_db/delete/:id', function (req, res) {
    con.query('Delete from Utenti where id=?', [req.params.id], function (error, rows, fields) {
        if (error) console.log(error);

        else {
            console.log('Eliminato');
            res.send('Eliminato');
        }
    });
});


app.listen((8082));
