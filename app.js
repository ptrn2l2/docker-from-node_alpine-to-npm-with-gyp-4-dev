const express = require('express');
const app = express();
const listening_port = process.env.PORT || 3080;

app.listen(listening_port, () => console.log('Express app started && listening on port ', listening_port));

app.get('/', function (req, res) {
    res.send('Hello World!!!');
});


