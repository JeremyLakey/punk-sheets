const express = require('express');
const connectDB = require('./config/db');


const app = express();

//middleware
app.use(express.json({ extended: false}));
connectDB();


//routes
app.use('/api/user', require('./routes/user'));
app.use('/api/sheet', require('./routes/sheet'));

//uses enviroment variable for PORT
const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log('listening on port ' + PORT));