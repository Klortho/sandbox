const http = require('http');

const hostname = '127.0.0.1';
const port = 1337;

var counter = 0;

// Note the function literal syntax here
http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hi! The counter is now ' + counter + '\n');
  console.log(`path is ${req.path}`);
  counter = counter + 1;
}).listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});