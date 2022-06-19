# Practica de Socket.io con Node Js

## Paso 1: Crear el package.json

```  npm init --yes ```

## Paso 2: Instalar las dependencias de Express y Socket.io

```npm i express socket.io```


## Paso 3: Instalar la dependencia de Desarrollo Nodemon

```npm i  nodemon -D ```

```yarn add -D nodemon```


## Paso 4: Modifcar en el package.json el key scripts

```
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node index.js",
    "dev": "nodemon index.js"
```

## Paso 5: En la raiz crear un index.js y probar

```npm start```

```npm run dev ```

## Paso 6: Cargar las depencias y creacion de servidor con express

```
const path = require("path")
const express = require("express")
const app = express()

// Establecer la Ruta del Proyecto
// la raiz de la carpeta a public donde va el frontend
app.use( express.static(path.join(__dirname , "public")) )

// Configuracion del Puerto
// Donde se establece uno definido por el OS y si devuelve null entonces toma el 3200
app.set('port', process.env.PORT || 3200 )

// Iniciar el servidor
// Donde app.get() obtiene la configuracion establecida de el codigo anterior
app.listen( app.get('port') ,  () => {

    console.log("TEST")
})

```

### Paso 7: Crear la carpeta public con los archivos base para el proyecto

*   public
    *   index.html
    *   main.js
    *   main.css

## Paso 8: Añadir socket.io del lado del servidor

```

// Iniciar el servidor y guardamos en una constante
const server = app.listen( app.get('port') ,  () => {

    console.log("TEST:" , app.get('port'))
})
// cargamos socket.io
const socketIO = require('socket.io')

// instanciamios socket.io con la configuracion del servidor
io = socketIO(server)

// realizamos la conexion con el cliente
io.on('conection', () => {
    console.log('Nueva Conexion');
})

```

## Paso 9: Del lado del cliente Realizamos la prueba de socket.io

Ingresamos en el navegador ``` 127.0.0.1\socket.io\socket.io.js ```

## Paso 10: Agregamos en el index.html la ruta del socket.io.js

``` <script src="socket.io/socket.io.js" > </script>  ```

## Paso 11: En el main.js instaciamos socket.io para realizar la conexion

Si esta dentro del mismo dominio se agrega ``` io() ``` pero si esta en otro dominio se agrega ``` io("dominio.com") ```


## Paso 12: Creamos la vista del chat

index.html
```
   <div id="chat-container">
            <div class="chat-window-2">
                    <h2>Sockets.io</h2>
            </div>
        <div class="chat-window">
            <div id="output"></div>
            <div id="actions"></div>
        </div>
        <input type="text" id=username placeholder="Usuario" >
        <input type="text" id="message" placeholder="Mensaje">
        <button id=send > Enviar </button>
    </div>

```

main.css

```
body{
    font-family: sans-serif;
}

#chat-container{

    max-width: 600px;
    margin: 30px auto;
    border: 1px solid #ddd;
    box-shadow: 1px 3px 5px rgb(0,0,0, .5);
}

.chat-window {

    padding: 14px 0;
    margin: auto 20px;
    border-bottom: 1px solid #e9e9e9;
    color : #555;
}

.chat-window-2 {
    margin: auto 0px;
    color : #555;
}

.chat-window-2 h2{
    text-align: center;
}

#output p{
    color: #aaa;
    padding: 14px 0;
    margin: 0 20px;
}

input{
    padding: 10px 20px;
    box-sizing: border-box;
    border: 0;
    padding:12px 0;
    width: 100%;
}

button{
    background: #575ed8;
    color : #fff;
    font-size: 18px;
    border: 0;
    padding: 12px 0;
    width: 100%;
    border-radius: 0 0 2px 2px;
}

```

## Paso 13: Creamos los eventos del lado del cliente

```
let output = document.getElementById("output");
let actions = document.getElementById("actions");
let username = document.getElementById("username");
let message = document.getElementById("message");
let btn = document.getElementById("send");

    // capturar el evento de click
    btn.addEventListener('click', () =>{
        // enviar mensaje
        socket.emit('chat:message' , {username : username.value , message : message.value })
    })


    message.addEventListener('keypress', () =>{
        socket.emit('chat:typing' , username.value )
    })

    // escuchar el mensaje
    socket.on('chat:message', data => {
        // limpiar acctions
        actions.innerHTML = ''
        // escribir nuevo mensajes
        output.innerHTML += `<p> <strom> ${data.username} : </strom> ${data.message}   </p>`
    })

    socket.on('chat:typing', user => {

        actions.innerHTML = `<p> ${user} esta escribiendo... </p>`
    })
```

## Paso 14: Recibimos y Emitimos los datos del lado del servidor

```
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

```

## Resultado

![enter image description here](https://raw.githubusercontent.com/rojasarmando/Courses-and-Pratices/nodejs-websocket/public/chat.png)




