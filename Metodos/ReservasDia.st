| club dia reservasTot reservasPorDia u1 c1 r1 fechaReserva mes anio fechaElegida tipo|

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

u1 := Usuario crearUsuariodni: '3241455' nombre: 'javier' apellido: 'alvarez' NroUsuario: 1 Email: 'JAlv@gmail.com' Telefono: '11 1245 3245'.

tipo:= TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.

c1 := Cancha crearCanchaid: 1 nom: 'Cancha A' tam: 7 tip: tipo.

fechaReserva := Date newDay: 19 monthNumber: 5 year: 2025.

r1 := Reserva crearReservaId: 1 fecha: fechaReserva horaInicio: '18:00' horaFin: '20:00' usuario: u1 cancha: c1.
club agregarReserva: r1.

dia := (Prompter prompt: 'Ingrese el día de la reserva:') asNumber.
mes := (Prompter prompt: 'Ingrese el mes de la reserva:') asNumber .
anio := (Prompter prompt: 'Ingrese el año de la reserva:') asNumber .

fechaElegida := Date newDay: dia monthNumber: mes year: anio.


reservasTot := club verTodasLasReservas.

reservasPorDia := reservasTot select: [:reserva | reserva verFecha = fechaElegida].

Transcript show: '------------------------------------------------------- '; cr.
Transcript show: '  Reservas para el día ', dia printString, ':'; cr.
Transcript show: '------------------------------------------------------- '; cr.

reservasPorDia isEmpty
    ifTrue: [Transcript show: 'No hay reservas para esa fecha.'; cr]
    ifFalse: [reservasPorDia do: [:r | Transcript show: r printReserva ; cr]].

