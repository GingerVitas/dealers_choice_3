app.get('/', (req, res, next) => {
    try {
        res.sendFile(path.join(__dirname, '..', 'public', 'index.html',));
    }
    catch(e) {next(e)}
})

app.get('/photos', (req, res, next) => {
    try {
        res.sendFile(path.join(__dirname, '..', 'public', 'photos.html',));
    }
    catch(e) {next(e)}
})