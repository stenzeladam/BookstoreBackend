require('dotenv').config();
const express = require('express'); // Importing Express.js framework
const { createPool } = require('mysql2'); // Destructuring createPool method from mysql2 module. Importing mqsql didn't work.
const app = express(); 
app.use(express.json()); // Middleware to parse JSON requests
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

const port = process.env.PORT || 3000; 
app.listen(port, () => {
    console.log(`Listening on port ${port}...`)
}); // Starting the server and logging port information

// Creating a MySQL connection pool
const pool = createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    connectionLimit: 10
});

// Route for the root URL
app.get('/', (req, res) => {
    res.send('Bookstore Data'); 
});

// Route to fetch orders from the database
app.get('/api/orders', (req, res) => {
    pool.query(
        `SELECT order_id, title, Authors.name AS author, price, quantity FROM OrderDetails
         JOIN Books ON Books.book_id = OrderDetails.book_id
         JOIN Authors ON Books.author_id = Authors.author_id;`
        , (err, ordersArray) => {
        if (err) {
            console.error(err);
            res.status(500).send('500 Error: Internal Server Error');
            return;
        }
        res.send(ordersArray); // Sending the fetched orders as a response
        console.log('200 OK');
    });
});

// Route to fetch customers from the database
app.get('/api/customers', (req, res) => {
    pool.query(
        `SELECT name, email, address FROM customers
         ORDER BY name;`
        , (err, customersArray) => {
        if (err) {
            console.error(err); 
            res.status(500).send('500 Error: Internal Server Error'); 
            return;
        }
        res.send(customersArray); // Sending the fetched customers as a response
        console.log('200 OK');
    });
});

// Middleware to handle invalid URLs with a 404 error
app.use((req, res) => {
    res.status(404).send('404 Error: Page Not Found');
});
