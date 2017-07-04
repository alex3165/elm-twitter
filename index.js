const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const listen = require('./tweetStreams');
const http = require('http');
const WebSocket = require('ws');

const PORT = 8001;
const app = express();
app.use(cors());
app.use(bodyParser.json());

const server = http.createServer(app);
const wss = new WebSocket.Server({ server, path: '/tweets' });

wss.clients.forEach((client) => {
  client.on('error', (err) => {
    console.error('Client error: ', err);
  });
});

wss.on('connection', function connection(ws, req) {
  listen((data) => {
    ws.send(JSON.stringify(data));
  });
});

server.listen(PORT, () => {
  console.log(`App is running at http://localhost:${PORT}`);
});
