let express = require('express');
let path = require('path');
let app = express();
let listeninPort = process.env.PORT || 3080;

app.use(express.static(__dirname + '/assets'));

app.listen(listeninPort, function() {
    console.log('Express app started && listening on port ', listeninPort);
});

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, 'assets/index.html'));
});


