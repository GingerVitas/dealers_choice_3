const pg = require('pg')
const url = process.env.DATABASE_URL || 'postgres://localhost/reviews';
const client = new pg.Client(url);

module.exports = client;