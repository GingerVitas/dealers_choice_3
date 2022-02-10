const express = require('express');
const volleyball = require('volleyball');
const client = require('./db');
const app = express();
const seed = require('./seed');
const router = require('./routes/routes')
const path = require('path');
app.use(volleyball);
app.use(express.static(path.join(__dirname, 'public')));
app.use('/', router);

const setup = async () => {
   try{
    await client.connect();
    console.log('Connected to db');
    await client.query(seed());
    console.log('Database has been seeded')

    const port = process.env.PORT || 3000;
    app.listen(port, () => {
        console.log(`Listening on port ${port}.`)
    })
   }
   catch(e) {
       console.log(e)
   }
}

setup();


