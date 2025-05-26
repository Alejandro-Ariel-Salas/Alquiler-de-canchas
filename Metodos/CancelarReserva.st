|club usuario opc idABuscar  fecha reserva canchas diaSemana diasSemana hayDisponibilidad opValida listUsuarios horario reservas canchaFechaFlag reservaPorCancha |

Transcript clear.
club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

fecha:= Date newDay: 23 monthNumber: 5 year: 2025.
reserva:= Reserva crearReservaId: (club cantidadReservas) + 1 fecha: fecha horaInicio: 9 horaFin: 10 usuario: 1 cancha: 1.

club agregarReserva: reserva.


"metodo"
opValida := false.

[opValida not] whileTrue: [
	idABuscar := (Prompter prompt: 'Ingrese el ID de la reserva a cancelar') asNumber .
	reserva := club buscarReserva: idABuscar.
	(reserva notNil)ifTrue: [
	opValida := true.
	reserva modiEstadoReserva: false.
	MessageBox notify: 'Reserva cancelada' caption: 'Exito'.
	]
	ifFalse:[
	MessageBox warning: 'Reserva no encontrada' caption: 'ATENCION'.
	].


].