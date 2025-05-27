|club usuario opc cancha cesped sintetico sala disponibildad fecha reserva canchas diaSemana diasSemana hayDisponibilidad opValida listUsuarios horario reservas canchaFechaFlag reservaPorCancha opc3|

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

cesped:= TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.
sintetico:= TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico'.
sala:= TipoCancha crearTipoCanchaid: 3 tip: 'Sala'.

"Cancha 1"
cancha := Cancha crearCanchaid: 1 nom: 'Cancha 1' tam: 5 tip: sala.
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

"Cancha 3"
cancha := Cancha crearCanchaid: 3 nom: 'Cancha 2' tam: 7 tip: cesped.
#('Lunes' 'Martes' 'Miercoles' 'Jueves' 'Viernes') doWithIndex: [:dia :i |
	disponibilidad := Disponibilidad crearDisponibilidadid: (i + 5) horaAp: 10 horaCi: 20 dia: dia.
	cancha agregarDisponibilidad: disponibilidad.
].
club agregarCancha: cancha.

"Crear usuarios"
usuario := Usuario crearUsuariodni: 40000000 nombre: 'Ana' apellido: 'Lopez' NroUsuario: (club cantidadUsuarios + 1) Email: 'ana@mail.com' Telefono: 11111111.
club agregarUsuario: usuario.

usuario:= Usuario crearUsuariodni: 44444444 nombre: 'Juan' apellido: 'Martinez' NroUsuario: club cantidadUsuarios + 1  Email: 'jMartinez@mail.com' Telefono: 1151234111.
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

fecha:= Date newDay: 3 monthNumber: 6 year: 2025.
reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: 9 horaFin: 10 usuario: (usuario verNroUsuario) cancha: 1.
club agregarReserva: reserva.

reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: 10 horaFin: 11 usuario: (usuario verNroUsuario) cancha: 1.
club agregarReserva: reserva.

8 to: 18 do: [ :i | 
reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: i horaFin: (i +1) usuario: (usuario verNroUsuario) cancha: 2.
club agregarReserva: reserva.
].

Transcript clear;
show: '----------------------------------------------------------------------------------' ;
cr;
show: '------------- Sistema de reservas de canchas de  ',  club verNom , ' ------------';
cr;
show: '----------------------------------------------------------------------------------';
cr.
Transcript show: 'Opciones: '; cr;
show: '1. Crear reserva.'; cr;
show: '2. Crear cancha.'; cr;
show: '3. Agregar disponibilidad a una cancha.'; cr;
show: '0. Salir del programa.'; cr;
show: '----------------------------------------------------------------------------------------------------'; cr.

opc:= (Prompter prompt: ' Ingrese una opcion:') asNumber.
[opc ~= 0] whileTrue: [

		(opc = 1) ifTrue: [
		

		].


	






	Transcript clear.
	Transcript show: 'Opciones: '; cr;
	show: '1. Crear reserva.'; cr;
	show: '2. Crear cancha.'; cr;
	show: '3. Agregar disponibilidad a una cancha.'; cr;
	show: '0. Salir del programa.'; cr;
	show: '----------------------------------------------------------------------------------------------------'; cr.
	opc:= (Prompter prompt: ' Ingrese una opcion:') asNumber.
].

