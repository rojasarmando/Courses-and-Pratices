const socket = io()

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