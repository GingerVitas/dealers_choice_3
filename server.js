const { application } = require('express');
const express = require('express');
const app = express();
const volleyball = require('volleyball');
const client = require('/db.js');
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`Listening on port ${port}.`)
})

app.get('/', async (req, res, next) => {
    const list = await client.query();
    const presenterProdList = list.map(post => `
        <div class='pressQuotes'>
        <p>
            <h2><span class='quoteHeader'><a href='/quotes/${post.id}'>${post.presenter} - ${post.production}</a></h2> <blockquote><a href='/quotes/${post.id}'>${post.preview}</a></blockquote> <small>${post.author}, ${post.publication}</small></span>
        </p>
    </div>
    `
    ).join('')
    const html = `
    <html>
        <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bridgette Gan, Soprano - Press</title>
        <link rel='stylesheet' href='./press.css'>
        <link href="https://fonts.googleapis.com/css2?family=Carattere&family=Playfair+Display&display=swap" rel="stylesheet">
        </head>
        <body>
            <header>Bridgette Gan, Soprano</header>
            <section>
                <div>
                    <h1>Singer | Actress | Educator</h1>
                    <div id='nav'><nav>
                        <ul>
                            <li><a href='index.html'>Home</a></li>
                            <li><a href='photos.html'>Photos</a></li>
                            <li><a href='press.html'>Press</a></li>
                            <li><a href='contact.html'>Contact</a></li>
                        </ul>
                    </nav></div>
                </div>
                <div>
                ${presenterProdList}
                </div>
            </section>
        </body>   
    </html>
    `;
    res.send(html)
})

