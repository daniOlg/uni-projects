import cors from 'cors';
import express from 'express';
import router from "./routes";

const API_VERSION = 'v1';
const SERVER_PORT = 3000;
const SERVER_HOSTNAME = 'localhost';

const app = express();

app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(cors())

app.use(`/api/${API_VERSION}`, router);

app.listen(SERVER_PORT, SERVER_HOSTNAME, () => {
    console.log(`Server is running on http://${SERVER_HOSTNAME}:${SERVER_PORT}`);
})