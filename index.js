const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('How are you doing');
});

app.get('/name/:name', (req, res) => {
  console.log(`Hi, ${req.params.name}!`);
  res.sendStatus(200);
});

app.listen(8080, () => {
  console.log('Listening on port 8080');
})