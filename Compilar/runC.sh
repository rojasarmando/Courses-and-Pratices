#!/bin/bash
gnome-terminal -e "/bin/bash -c 'g++ $1 -o $2; $2; echo; read -p 'Pulse_intro_pasa_salir...'; exit; exec /bin/bash'; &"