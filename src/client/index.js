const io = require("socket.io-client");
const socket = io.connect(`http://localhost:3100`, { reconnect: true });

socket.on("connect", function (s) {
  console.log("Connected!");
});

socket.on("chat:message", (data) => {
    console.log(data);
  if (data.message == "hola") {

    for (let index = 0; index < 1000; index++) {
        socket.emit("chat:typing", "Bot Armando");
    }
    setTimeout( ()=>{
        socket.emit("chat:message", {
        username: "Bot Armano",
        message: `Hola ${data.username}! `});
    } , 3000 )

  }
});



/*socket.emit("chat:message", {
  username: "ARMANDO",
  message: "mensaje desde el cliente nodejs",
});*/

/*

message.addEventListener('keypress', () =>{
    socket.emit('chat:typing' , username.value )
})

// escuchar el mensaje
socket.on('chat:message', data => {
    // limpiar acctions
    actions.innerHTML = ''
    // escribir nuevo mensajes
    output.innerHTML += `<p> <strom> ${data.username} : </strom> ${data.message}   </p>`
})*/

/*socket.on('chat:typing', user => {

    actions.innerHTML = `<p> ${user} esta escribiendo... </p>`
})*/
