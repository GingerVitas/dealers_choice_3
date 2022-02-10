const express = require('express');
const volleyball = require('volleyball');
const client = require('./db.js');
const app = express();
const seed = require('./seed.js');
const path = require('path');
app.use(volleyball);
app.use(express.static(__dirname + '/public'));


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


app.get('/home', (req, res, next) => {
    try {
        res.sendFile(path.join(__dirname, '.', 'public', 'index.html',));
    }
    catch(e) {next(e)}
})

app.get('/photos', (req, res, next) => {
    try {
        res.sendFile(path.join(__dirname, '.', 'public', 'photos.html',));
    }
    catch(e) {next(e)}
})

app.get('/press', async (req, res, next) => {
   try {
    const data = await client.query(`
    SELECT reviews.id, companies.name AS company, production.name AS production, preview, publication.name AS publication, author.name AS author
    FROM reviews
    JOIN production ON reviews.production_id = production.id
    JOIN companies ON production.company_id = companies.id
    JOIN publication ON reviews.publication_id = publication.id
    JOIN author ON reviews.author_id = author.id
    ;`);
    const list = data.rows;
    const presenterProdList = list.map(post => `
        <div class='pressQuotes'>
        <p>
            <h2><span class='quoteHeader'><a href='/quotes/${post.id}'>${post.company} - ${post.production}</a></h2> <blockquote><a href='/quotes/${post.id}'>${post.preview}</a></blockquote> <small>${post.author}, ${post.publication}</small></span>
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
        <link rel='stylesheet' href='./main.css'>
        <link href="https://fonts.googleapis.com/css2?family=Carattere&family=Playfair+Display&display=swap" rel="stylesheet">
        </head>
        <body>
            <header>Bridgette Gan, Soprano</header>
            <section>
                <div>
                <h1>Singer | Actress | Educator</h1>
                    <div id='nav'><nav>
                        <ul>
                            <li><a href='/home'>Home</a></li>
                            <li><a href='/photos'>Photos</a></li>
                            <li><a href='/press'>Press</a></li>
                            <li><a href='contact.html'>Contact</a></li>
                        </ul>
                    </nav></div>
                </div>
                <div>
                ${presenterProdList}
                </div>
            </section>
            <footer>
            <p><span>
                <a href='https://www.instagram.com/bridgettegan/'><img src='images/Instagram Logo.png'></a> 
                <a href='https://www.youtube.com/channel/UCqM6DgQrXauz5nmylU0iTyQ'><img src='images/Youtube Logo.png' height='30px'></a>
            </span></p>
            <p>&copy 2022 Bridgette Gan</p>
            </footer>
        </body>   
    </html>
    `;
    res.send(html)
}
catch(e) { 
    next(e)
}
});

app.get('/quotes/:id', async (req, res, next) => {
    try {
        const data = await client.query(`
        SELECT reviews.id, companies.name AS company, production.name AS production, content, publication.name AS publication, author.name AS author
        FROM reviews
        JOIN production ON reviews.production_id = production.id
        JOIN companies ON production.company_id = companies.id
        JOIN publication ON reviews.publication_id = publication.id
        JOIN author ON reviews.author_id = author.id
        WHERE reviews.id=$1
        ;`, [req.params.id]);
        const quote = data.rows[0]
        const fullQuote = `
        <p>
            <h2><span class='quoteHeader'><a href='/press'>${quote.company} - ${quote.production}</a></h2>
            <blockquote>${quote.content}</blockquote>
            <small>${quote.author}, ${quote.publication}</small>
        </p>
        `
        const html = `
        <html>
            <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bridgette Gan, Soprano</title>
            <link rel='stylesheet' href='/main.css'>
            <link href="https://fonts.googleapis.com/css2?family=Carattere&family=Playfair+Display&display=swap" rel="stylesheet">
            </head>
            <body>
                <header><a href='/'>Bridgette Gan, Soprano</a></header>
                <section>
                    <div>
                        <div id='nav'><nav>
                            <ul>
                                <li><a href='/home'>Home</a></li>
                                <li><a href='/photos'>Photos</a></li>
                                <li><a href='/press'>Press</a></li>
                                <li><a href='contact.html'>Contact</a></li>
                            </ul>
                        </nav></div>
                    </div>
                    <div class='fullQuote'>
                    ${fullQuote}
                    </div>
                </section>
                <footer>
                <p><span>
                    <a href='https://www.instagram.com/bridgettegan/'><img src='./public/images/Instagram Logo.png'></a> 
                    <a href='https://www.youtube.com/channel/UCqM6DgQrXauz5nmylU0iTyQ'><img src='./public/images/Youtube Logo.png' height='30px'></a>
                </span></p>
                <p>&copy 2022 Bridgette Gan</p>
                </footer>
            </body>   
        </html>
        `
        res.send(html);
    }
    catch(e) {next(e)}
})
