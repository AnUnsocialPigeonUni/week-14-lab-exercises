const express = require('express');
const app = express();
const hello = require('./returnHello.js');

app.get('/*', function (req, res) {
    if (req == '/') {
        res.send("Please enter a language into the URL");
        return;
    }
    res.send(hello.generateHelloString(req.url.split('/')[1]));
})

app.listen(process.env?.PORT || 3000);
