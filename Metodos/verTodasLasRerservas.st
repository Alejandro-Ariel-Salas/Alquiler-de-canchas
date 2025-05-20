| club usuario cancha cesped sintetico disponibilidad fecha reserva canchas |

Transcript clear.

"Crear club"
club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

"Crear tipos de cancha"
cesped := TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.
sintetico := TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico'.
sala := TipoCancha crearTipoCanchaid: 3 tip: 'Sala'.

"Cancha 1"
cancha := Cancha crearCanchaid: 1 nom: 'Cancha 1' tam: 5 tip: cesped.
#('Lunes' 'Martes' 'Miercoles' 'Jueves' 'Viernes') doWithIndex: [:dia :i |
	disponibilidad := Disponibilidad crearDisponibilidadid: i horaAp: 8 horaCi: 20 dia: dia.
	cancha agregarDisponibilidad: disponibilidad.
].
club agregarCancha: cancha.

"Cancha 2"
cancha := Cancha crearCanchaid: 2 nom: 'Cancha 2' tam: 7 tip: sintetico.
#('Martes' 'Miercoles' 'Jueves' 'Viernes') doWithIndex: [:dia :i |
	disponibilidad := Disponibilidad crearDisponibilidadid: (i + 5) horaAp: 8 horaCi: 20 dia: dia.
	cancha agregarDisponibilidad: disponibilidad.
].
club agregarCancha: cancha.

"Crear usuario"
usuario := Usuario crearUsuariodni: 40000000 nombre: 'Ana' apellido: 'Lopez' NroUsuario: (club cantidadUsuarios + 1) Email: 'ana@mail.com' Telefono: 11111111.
club agregarUsuario: usuario.

"Crear reservas"
fecha := Date newDay: 19 monthNumber: 5 year: 2025.
reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: 8 horaFin: 9 usuario: usuario cancha: (club verTodasLasCanchas at: 1).
club agregarReserva: reserva.
fecha := Date newDay: 20 monthNumber: 5 year: 2025.
reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: 12 horaFin: 13 usuario: usuario cancha: (club verTodasLasCanchas at: 1).
club agregarReserva: reserva.
fecha := Date newDay: 20 monthNumber: 5 year: 2025.
reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: 12 horaFin: 13 usuario: usuario cancha: (club verTodasLasCanchas at: 2).
club agregarReserva: reserva.

"Mostrar la cantidad de reservas por cada cancha"
canchas := club verTodasLasCanchas.
reservas := club verTodasLasReservas.

Transcript show: 'Cantidad de reservas por cancha:'; cr.
Transcript show: '---------------------------------'; cr.

canchas do: [:c |
    cantidad := 0.
    reservas do: [:r |
        (r verCancha = c) ifTrue: [cantidad := cantidad + 1].
    ].
    Transcript show: 'Cancha ', c verId printString, ' (', c verNomb, '): ', cantidad printString, ' reservas.'; cr.
].

Transcript show: '---------------------------------'; cr.



