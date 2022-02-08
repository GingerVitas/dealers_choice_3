const { application } = require('express');
const express = require('express');
const app = express();
const volleyball = require('volleyball');
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`Listening on port ${port}.`)
})

app.get('/', (req, res, next) => {
    res.send('Hello World!')
})

