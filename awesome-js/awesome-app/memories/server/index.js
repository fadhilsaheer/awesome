import dotenv from "dotenv";
dotenv.config();

import express from "express";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import cors from "cors";

import postRoutes from './routes/posts.js';

const app = express();

app.use('/posts', postRoutes);

app.use(bodyParser.json({ limit: "30mb", extended: true }));
app.use(bodyParser.urlencoded({ limit: "30mb", extended: true }));
app.use(cors());

const CONNECTION_URL = process.env.database;
const PORT = process.env.PORT || 5000;

mongoose.connect(CONNECTION_URL, { useUnifiedTopology: true, useNewUrlParser: true }).then(() => {
    console.log(`[INFO] mongodb connected to ${CONNECTION_URL}`);
    app.listen(PORT, console.log(`[INFO] server started at port ${PORT}`));
});

mongoose.set('useFindAndModify', false);