const path = require("path")
const express = require("express")
const socketIO = require('socket.io')
const app = express()

// Establecer la Ruta del Proyecto
app.use( express.static(path.join(__dirname , "public")) )

// Configuracion del Puerto
app.set('port', process.env.PORT || 3200 )

// Iniciar el servidor
const server = app.listen( app.get('port') ,  () => {

    console.log(`Puerto: ${app.get('port')} `)
})


io = socketIO(server)

io.on('connection', (socket) => {
    console.log('Nueva Conexion: ', socket.id);
    // escuchar el evento
    socket.on('chat:message' , (data) => {
        // mandar el mensaje a todos los clientes
        io.sockets.emit('chat:message' , data)
    })

    // escuchar el evento
    socket.on('chat:typing' , (username) => {
        // enviar a todos los clientes excepto al cliente emisor
        socket.broadcast.emit('chat:typing' , username)
    })

})




