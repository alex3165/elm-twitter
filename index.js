const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { listen, listeners } = require('./server/tweetStreams');
const normalizer = require('./server/normalizer');
const http = require('http');
const WebSocket = require('ws');

const PORT = 8002;
const app = express();
app.use(cors());
app.use(bodyParser.json());

app.get('/test', (req, res) => {
  const testTweet = require('./server/tweet.json');
  listeners.forEach((listener) => listener(testTweet));

  res.json({ message: 'Sent test tweet trough websocket' });
});

const server = http.createServer(app);
const wss = new WebSocket.Server({ server, path: '/tweets' });
const clients = [];

wss.on('connection', function(ws) {
  clients.push(ws);
  console.log('New client joined');
});

clients.forEach((client) => {
  client.on('error', (err) => {
    console.error('Client error: ', err);
  });
});

listen((data) => {
  const normalizedData = normalizer(data);

  clients.forEach((client) => {
    console.log(client.readyState === WebSocket.OPEN, client.readyState);
    if (client.readyState === WebSocket.OPEN) {
      client.send(JSON.stringify(normalizedData));
    }
  });
});

server.listen(PORT, () => {
  console.log(`App is running at http://localhost:${PORT}`);
});
