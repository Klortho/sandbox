"use strict";

var net = require('net')

var chat_server = net.createServer(),
    client_list = [];


chat_server.on('connection', function(client) {
  client.write('Hi!\n');
  console.log("Got connection #" + client_list.length);
  client_list.push(client);

  client.on('data', function(data) {
    for (let i = 0; i < client_list.length; ++i) {
      let c = client_list[i];
      if (c !== client) {
        c.write(data);
      }
    }
  })

})

chat_server.listen(9000)