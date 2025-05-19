|club usuario opc cancha cesped sintetico sala disponibildad fecha reserva canchas diaSemana diasSemana hayDisponibilidad opValida listUsuarios horario reservas canchaFechaFlag |
Transcript clear.
club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

cesped:= TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.
sintetico:= TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico'.
sala:= TipoCancha crearTipoCanchaid: 3 tip: 'Sala'.

cancha := Cancha crearCanchaid: 1 nom: 'Cancha 1' tam: 5 tip: cesped.
disponibilidad := Disponibilidad crearDisponibilidadid: 1 horaAp: 8 horaCi: 20 dia: 'Lunes'.
cancha agregarDisponibilidad: disponibilidad.
disponibilidad := Disponibilidad crearDisponibilidadid: 2 horaAp: 8 horaCi: 20 dia: 'Martes'.
cancha agregarDisponibilidad: disponibilidad.
disponibilidad := Disponibilidad crearDisponibilidadid: 3 horaAp: 8 horaCi: 20 dia: 'Miercoles'.
cancha agregarDisponibilidad: disponibilidad.
disponibilidad := Disponibilidad crearDisponibilidadid: 4 horaAp: 8 horaCi: 20 dia: 'Jueves'.
cancha agregarDisponibilidad: disponibilidad.
disponibilidad := Disponibilidad crearDisponibilidadid: 5 horaAp: 8 horaCi: 20 dia: 'Viernes'.
cancha agregarDisponibilidad: disponibilidad.

club agregarCancha: cancha.

cancha := Cancha crearCanchaid: 2 nom: 'Cancha 2' tam: 7 tip: sintetico.
"disponibilidad := Disponibilidad crearDisponibilidadid: 1 horaAp: 8 horaCi: 20 dia: 'Lunes'."
"cancha agregarDisponibilidad: disponibilidad."
disponibilidad := Disponibilidad crearDisponibilidadid: 2 horaAp: 8 horaCi: 20 dia: 'Martes'.
cancha agregarDisponibilidad: disponibilidad.
disponibilidad := Disponibilidad crearDisponibilidadid: 3 horaAp: 8 horaCi: 20 dia: 'Miercoles'.
cancha agregarDisponibilidad: disponibilidad.
disponibilidad := Disponibilidad crearDisponibilidadid: 4 horaAp: 8 horaCi: 20 dia: 'Jueves'.
cancha agregarDisponibilidad: disponibilidad.
disponibilidad := Disponibilidad crearDisponibilidadid: 5 horaAp: 8 horaCi: 20 dia: 'Viernes'.
cancha agregarDisponibilidad: disponibilidad.
club agregarCancha: cancha.

usuario:= Usuario crearUsuariodni: 44553540 nombre: 'Ivan' apellido: 'Lapegna' NroUsuario: club cantidadUsuarios + 1  Email: 'ivanlapegna@mail.com' Telefono: 1157528111.
club agregarUsuario: usuario.

fecha:= Date newDay: 19 monthNumber: 5 year: 2025.

reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: 8 horaFin: 9 usuario: usuario cancha: (club verTodasLasCanchas at: 1).

club agregarReserva: reserva.
dia := (Prompter prompt: 'Ingrese el dia de la reserva').
mes := (Prompter prompt: 'Ingrese el mes de la reserva') .
anio := (Prompter prompt: 'Ingrese el año de la reserva') .

fecha:= Date newDay: dia asNumber  monthNumber: mes asNumber year: anio asNumber.
diaSemana:= fecha dayOfWeek asInteger.
diasSemana := #('Domingo' 'Lunes' 'Martes' 'Miercoles' 'Jueves' 'Viernes' 'Sabado' ).
diaSemana := diasSemana at: diaSemana.

canchas := club verTodasLasCanchas.

reservas := club verReservasActivas:fecha.
canchaFechaFlag := false.
"CASO 1: no hay reservas en ese dia"
(reservas isEmpty ) ifTrue: [
	Transcript show: '----------------Canchas----------------'; cr.
	hayDisponibilidad :=false.
	canchas do: [:cancha | (cancha tieneDia: diaSemana) ifNotNil: [:disp | hayDisponibilidad :=true.
	Transcript show: cancha verId printString , ' - ', cancha verNomb; cr.]. 
	].
	hayDisponibilidad ifFalse: [Transcript show: 'No hay canchas con disponibilidad en ese dia'; cr.].
	Transcript show: '------------------------------------------'; cr.

	opc := Prompter prompt: 'Seleccione una cancha' .
	cancha :=  club buscarCancha: (opc asNumber).
	inicio := (cancha buscarDisponibilidadDia: diaSemana) verHoraAp.
	cierre := (cancha buscarDisponibilidadDia: diaSemana) verHoraCi .

	Transcript show: 'La cancha "', cancha verNomb , '" abre desde las ', inicio printString , ' hasta las ', cierre printString; cr.
	opValida:= false.
	[opValida not] whileTrue: [
		horario := (Prompter prompt: 'Seleccione un horario dentro de la franja').
		(horario isAllDigits and: [horario size > 0]) 
		ifTrue:[
			horario := horario asNumber.
			((horario >= inicio) and: [horario <= (cierre -1)]) 
			ifTrue: [
				opValida:= true.
				canchaFechaFlag:=true
			]
			ifFalse:[ Transcript show: 'ATENCION: Porfavor, ingrese un horario dentro de la franja horaria';cr.].

		] 
		ifFalse:[Transcript show:'ATENCION: Ingrese un numero';cr.]].

	]
"FIN DE CASO !"
ifFalse:[Transcript show: 'hay reservas'].

"UNA VEZ ELEGIDA LA CANCHA, FECHA Y HORARIO, SE ELIGE USUARIO Y SE CREA RESERVA"
(canchaFechaFlag) ifTrue: [
opValida:= false.
	[opValida not] whileTrue: [
		usuario := Prompter prompt: 'Ingrese Numero de usuario'.
		(usuario isAllDigits and: [usuario size > 0]) 
		ifTrue:[
			usuario := club buscarUsuario: (usuario asNumber).
			(usuario isNil) ifTrue:[
			Transcript show: 'ATENCION: Ingrese Numero de usuario existente';cr.
			]
			ifFalse: [
			opValida :=true.
			reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: horario horaFin: horario + 1 usuario: (usuario verNroUsuario) cancha: cancha verId.
			club agregarReserva: reserva.
			Transcript show: '------------------------------------------';cr.
			Transcript show: '------------Reserva creada------------'; cr.
			Transcript show: '------------------------------------------';cr.			].
		]
		ifFalse: [Transcript show: 'ATENCION: Ingrese un numero']
	].
].


club inspect.