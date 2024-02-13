// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');

// IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');

// INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://dottdj:dini123@cluster0.y28gz2s.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(authRouter);

// Connections
mongoose.connect(DB)
    .then(() => {
        console.log("Connection Successfull");
    })
    .catch((e) => {
        console.log(e);
    });


app.listen(PORT, () => {
    console.log(`connected at port ${PORT} hello`)
});