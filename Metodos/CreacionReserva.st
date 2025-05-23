|club usuario opc cancha cesped sintetico sala disponibildad fecha reserva canchas diaSemana diasSemana hayDisponibilidad opValida listUsuarios horario reservas canchaFechaFlag reservaPorCancha opc3|
Transcript clear.
club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

cesped:= TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.
sintetico:= TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico'.
sala:= TipoCancha crearTipoCanchaid: 3 tip: 'Sala'.

cancha := Cancha crearCanchaid: 1 nom: 'Cancha de 5' tam: 5 tip: cesped.
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

cancha := Cancha crearCanchaid: 2 nom: 'Cancha de 7' tam: 7 tip: sintetico.
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

cancha := Cancha crearCanchaid: 3 nom: 'Cancha de 11' tam: 11 tip: sintetico.
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

usuario:= Usuario crearUsuariodni: 44553540 nombre: 'Ivan' apellido: 'Lapegna' NroUsuario: club cantidadUsuarios + 1  Email: 'ivanlapegna@mail.com' Telefono: 1157528111.
club agregarUsuario: usuario.

usuario:= Usuario crearUsuariodni: 44444444 nombre: 'Juan' apellido: 'Martinez' NroUsuario: club cantidadUsuarios + 1  Email: 'jMartinez@mail.com' Telefono: 1151234111.
club agregarUsuario: usuario.

fecha:= Date newDay: 23 monthNumber: 5 year: 2025.
reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: 9 horaFin: 10 usuario: (usuario verNroUsuario) cancha: 1.
club agregarReserva: reserva.

reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: 10 horaFin: 11 usuario: (usuario verNroUsuario) cancha: 1.
club agregarReserva: reserva.



8 to: 18 do: [ :i | 
reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: i horaFin: (i +1) usuario: (usuario verNroUsuario) cancha: 2.
club agregarReserva: reserva.
].

finCrear := false.

[finCrear not ] whileTrue: [

[ 
    dia := (Prompter prompt: 'Ingrese el día de la reserva') asNumber.
    mes := (Prompter prompt: 'Ingrese el mes de la reserva') asNumber.
    anio := (Prompter prompt: 'Ingrese el año de la reserva') asNumber.
    fecha := Date newDay: dia monthNumber: mes year: anio.

    fecha < Date today 
] whileTrue: [
    MessageBox warning: 'La fecha ingresada es anterior a la actual. Intente nuevamente.' caption: 'Fecha inválida'.
].

diaSemana:= fecha dayOfWeek asInteger.
diasSemana := #('Domingo' 'Lunes' 'Martes' 'Miercoles' 'Jueves' 'Viernes' 'Sabado' ).
diaSemana := diasSemana at: diaSemana.

canchas := club verTodasLasCanchas.

reservas := club verReservasActivas:fecha.

canchaFechaFlag := false.
"CASO 1: no hay reservas en ese dia"
hayDisponibilidad :=false.
[reservas isEmpty and: [hayDisponibilidad not]]whileTrue: [
	|respuesta|
	respuesta := ''.
	canchas do: [:unaCancha | (unaCancha tieneDia: diaSemana) ifNotNil: [hayDisponibilidad :=true.
	respuesta := respuesta,'                ' , unaCancha verId printString , ' - ' , unaCancha verNomb, Character cr asString.
	]. 
	].

	hayDisponibilidad ifTrue: [
	Transcript show: '----------------Canchas----------------'; cr.
	Transcript show: respuesta.
	Transcript cr.
	Transcript show: '-----------------------------------------'; cr.
	Transcript cr.


	opc := Prompter prompt: 'Seleccione una cancha' .
	cancha :=  club buscarCancha: (opc asNumber).
	inicio := (cancha buscarDisponibilidadDia: diaSemana) verHoraAp.
	cierre := (cancha buscarDisponibilidadDia: diaSemana) verHoraCi .
	
	Transcript show: 'La cancha "', cancha verNomb , '" abre desde las ', inicio printString , ' hasta las ', cierre printString, ' hs'; cr.
	opValida:= false.
	[opValida not] whileTrue: [
		horario := (Prompter prompt: 'Seleccione un horario dentro de la franja').
		(horario isAllDigits and: [horario size > 0]) 
		ifTrue:[
			horario := horario asNumber.
			((horario >= inicio) and: [horario <= (cierre -1)]) ifTrue: [
				opValida:= true.
				canchaFechaFlag:=true
			]
			ifFalse:[ MessageBox warning:  'ATENCION: Porfavor, ingrese un horario dentro de la franja horaria' caption: 'ATENCION'.].

		] 
		ifFalse:[MessageBox warning:'ATENCION: Ingrese un numero' caption: 'ATENCION'.]].

	].
	

	hayDisponibilidad ifFalse: [MessageBox warning: 'No hay canchas con disponibilidad en ese dia' caption: 'ATENCION'.
	[ 
	dia := (Prompter prompt: 'Ingrese el día de la reserva') asNumber.
	mes := (Prompter prompt: 'Ingrese el mes de la reserva') asNumber.
	anio := (Prompter prompt: 'Ingrese el año de la reserva') asNumber.
	fecha := Date newDay: dia monthNumber: mes year: anio.

	fecha < Date today 
	] whileTrue: [
		MessageBox warning: 'La fecha ingresada es anterior a la actual. Intente nuevamente.' caption: 'Fecha inválida'.
	].
	diaSemana:= fecha dayOfWeek asInteger.
	diasSemana := #('Domingo' 'Lunes' 'Martes' 'Miercoles' 'Jueves' 'Viernes' 'Sabado' ).
	diaSemana := diasSemana at: diaSemana.
	canchas := club verTodasLasCanchas.
	reservas := club verReservasActivas:fecha.
	
].
	
	

	].
"FIN DE CASO !"





"CASO 2: Reservas en ese dia"
(reservas isEmpty) ifFalse:[
|respuesta canchasAEliminar canchasDisponibles canchaDiccionario|
respuesta := ''.
reservaPorCancha := Dictionary new.

"Armo diccionario con canchas que tienen horarios ocupados, ejemplo (key:(id de cancha) clave:(reserva1, reserva2))"
reservas do: [:reserva| |reservasCancha|
	cancha := reserva verCancha.
	reservasCancha := reservaPorCancha at: cancha ifAbsentPut: [OrderedCollection new].
	reservasCancha add: reserva
].
 "reservaPorCancha inspect."
canchasAEliminar := OrderedCollection new.

"veo si las canchas que estan en el diccionario le quedan horarios disponibles, si no tiene las elimino del diccionario"
reservaPorCancha keys do: [:unaCancha | 
    | reservaCancha |
    reservaCancha := reservaPorCancha at: unaCancha.
    canchaObj := club buscarCancha: unaCancha.
    (canchaObj verMargenHorasDia: diaSemana ) <= reservaCancha size
        ifTrue: [ canchasAEliminar add: unaCancha ].
].
"HASTA ACA VA BIEN"
"TENGO DICCCIONARIO CON KEY Id de la cancha y clave una colleccion de reserv as"

"Veo si hay canchas que no tengo reservas, para poder mostrarlas"
canchasDisponibles := (club verCanchasAbiertasDia: diaSemana) reject: [:unaCancha | reservaPorCancha includesKey:  unaCancha verId].

canchasAEliminar do: [:unaCancha | reservaPorCancha removeKey: unaCancha ].




"Muestro las canchas"
Transcript show: '----------------Canchas----------------'; cr.
reservaPorCancha keysDo: [:key |
    Transcript show: '                ', key printString , ' - ', (club buscarCancha: key) verNomb ; cr.
].
(canchasDisponibles isEmpty) ifFalse: [canchasDisponibles do: [:unaCancha | Transcript show: '                ' , unaCancha verId printString, ' - ' ,unaCancha verNomb; cr. ].].
Transcript show: '------------------------------------------'; cr.
Transcript cr.


opc := Prompter prompt: 'Seleccione una cancha' .
cancha :=  club buscarCancha: (opc asNumber).

"si la cancha que elige esta en el diccionario tengo que mostrar solo horas disponibles, si la cancha que elige no tiene reservas se muestra como el CASO 1"
cancha := reservaPorCancha keys detect: [:unaCancha | unaCancha = (cancha verId) ] ifNone: [
    canchasDisponibles detect: [:unaCancha | unaCancha  = cancha] ifNone: [ nil ]
].

canchaDiccionario := reservaPorCancha keys detect: [:unaCancha | unaCancha = cancha] ifNone: [nil].
(canchaDiccionario isNil) ifFalse: [
		"recupero reservas en esa cancha"
		reservaCancha := reservaPorCancha at: canchaDiccionario.
		horasOcupadas := reservaCancha collect: [:r | r verHoraInicio].
		cancha := club buscarCancha: canchaDiccionario.
		disponibilidadTotal := ((cancha tieneDia: diaSemana) verHoraAp to:  (cancha tieneDia: diaSemana) verHoraCi - 1).
		disponibilidadTotal := disponibilidadTotal reject: [:hora | horasOcupadas includes: hora].
		
		respuesta:= respuesta, 'Cancha: ', cancha verNomb, Character cr asString.
		respuesta:= respuesta, 'Turnos disponibles: '.
		1 to: (disponibilidadTotal size) do: [:i | respuesta:= respuesta, (disponibilidadTotal at: i) printString, ' / ' ].
		
		Transcript show: respuesta.
		

		opValida:= false.
		[opValida not] whileTrue: [
			horario := (Prompter prompt: 'Seleccione un horario').
			(horario isAllDigits and: [horario size > 0]) 
			ifTrue:[
				horario := horario asNumber.
				(disponibilidadTotal includes: horario) ifTrue: [opValida:= true. canchaFechaFlag:=true]
				

				ifFalse: [ MessageBox warning:  'ATENCION: Porfavor, ingrese un horario dentro de la franja horaria' caption: 'ATENCION'.].

			] 
			ifFalse:[MessageBox warning:'ATENCION: Ingrese un numero' caption: 'ATENCION'.]].		

].


(canchaDiccionario isNil) ifTrue: [
	inicio := (cancha buscarDisponibilidadDia: diaSemana) verHoraAp.
	cierre := (cancha buscarDisponibilidadDia: diaSemana) verHoraCi .
	Transcript show: 'La cancha "', cancha verNomb , '" abre desde las ',  inicio printString , ' hasta las ', cierre printString; cr.
	opValida:= false.
	[opValida not] whileTrue: [
		horario := (Prompter prompt: 'Seleccione un horario dentro de la franja').
		(horario isAllDigits and: [horario size > 0]) 
		ifTrue:[
			horario := horario asNumber.
			((horario >= inicio) and: [horario <= (cierre -1)]) ifTrue: [
				opValida:= true.
				canchaFechaFlag:=true
			]
			ifFalse:[ MessageBox warning:  'ATENCION: Porfavor, ingrese un horario dentro de la franja horaria' caption: 'ATENCION'.].

		] 
		ifFalse:[MessageBox warning:'ATENCION: Ingrese un numero' caption: 'ATENCION'.]].

].



].




"UNA VEZ ELEGIDA LA CANCHA, FECHA Y HORARIO, SE ELIGE USUARIO Y SE CREA RESERVA"
(canchaFechaFlag) ifTrue: [
opValida:= false.
	[opValida not] whileTrue: [
		usuario := Prompter prompt: 'Ingrese Numero de usuario'.
		(usuario isAllDigits and: [usuario size > 0]) 
		ifTrue:[
			usuario := club buscarUsuario: (usuario asNumber).
			(usuario isNil) ifTrue:[
			MessageBox warning: 'ATENCION: Ingrese Numero de usuario existente' caption: 'ATENCION'.
			]
			ifFalse: [
			opValida :=true.
			reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: horario horaFin: horario + 1 usuario: (usuario verNroUsuario) cancha: cancha verId.
			club agregarReserva: reserva.
			MessageBox notify:  'Reserva creada: Dia: ', fecha printString, ', Horario: ', horario printString , ', A nombre de ', usuario verNombre, ' ', usuario verApellido  caption: 'Exito'.
			].
		]
		ifFalse: [MessageBox warning: 'ATENCION: Ingrese un numero' caption: 'ATENCION'.]
	].
].

Transcript show: '----------------------------------------------------'; cr.
	Transcript show: 'Elija una opción:'; cr.
	Transcript show: '(S) Para continuar la creación de empleados'; cr.
	Transcript show: '(N) Para terminar la creación'; cr.
	Transcript show: '----------------------------------------------------'; cr.

	opc3 :=  (Prompter prompt:'Ingrese aquí la opción:') asString.
	opc3 := opc3 asLowercase.

	(opc3 = 's')
		ifTrue: [finCrear := false ]
		ifFalse: [finCrear := true].



].

