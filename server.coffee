express = require('express')
http = require('http')
app = express()

app.use express.static(__dirname + '/public')

server = http.createServer(app).listen(3000)
console.log('server start:', 3000)
io = require('socket.io')
io = io.listen(server)

io.sockets.on 'connection', (socket) ->
  io.sockets.emit('login', socket.id)

  socket.on 'post', (data) ->
    io.sockets.emit 'post', id: socket.id, post: data
