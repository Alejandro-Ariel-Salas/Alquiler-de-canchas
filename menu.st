|anio antiguedad apellido cancha canchaFechaFlag canchaSeleccionada canchas cesped club dia diaSemana diasSemana disponibilidad disponibildad dni empleado fecha fechaElegida fechaReserva finCrear finProceso hayDisponibilidad horaAp horaCi horario idABuscar idCancha listUsuarios mail mes nombre nroUsu opc opc2 opc3 opcValida opValida porCancha puesto reserva reservaPorCancha reservas reservasPorUsuario reservasTot sala salario sintetico telefono tipo usuario usuario2 usuarios usuariosOrdenados|



club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

cesped:= TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.
sintetico:= TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico'.
sala:= TipoCancha crearTipoCanchaid: 3 tip: 'Sala'.

tipos:= OrderedCollection new.
tipos add: cesped.
tipos add: sintetico.
tipos add: sala.

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
usuario2 := Usuario crearUsuariodni: 40000000 nombre: 'Ana' apellido: 'Lopez' NroUsuario: (club cantidadUsuarios + 1) Email: 'ana@mail.com' Telefono: 11111111.
club agregarUsuario: usuario2.

usuario:= Usuario crearUsuariodni: 44444444 nombre: 'Juan' apellido: 'Martinez' NroUsuario: club cantidadUsuarios + 1  Email: 'jMartinez@mail.com' Telefono: 1151234111.
club agregarUsuario: usuario.

"Crear reservas"
fecha := Date newDay: 19 monthNumber: 5 year: 2025.
reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: 8 horaFin: 9 usuario: (usuario verNroUsuario) cancha:  1.
club agregarReserva: reserva.
fecha := Date newDay: 20 monthNumber: 5 year: 2025.
reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: 12 horaFin: 13 usuario: (usuario verNroUsuario) cancha: 1.
club agregarReserva: reserva.
fecha := Date newDay: 20 monthNumber: 5 year: 2025.
reserva := Reserva crearReservaId: (club cantidadReservas + 1) fecha: fecha horaInicio: 12 horaFin: 13 usuario: (usuario verNroUsuario) cancha:  2.
club agregarReserva: reserva.

fecha:= Date newDay: 3 monthNumber: 6 year: 2025.
reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: 9 horaFin: 10 usuario: (usuario verNroUsuario)  cancha: 1.
club agregarReserva: reserva.

reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: 10 horaFin: 11 usuario: (usuario verNroUsuario)  cancha: 1.
club agregarReserva: reserva.

8 to: 18 do: [ :i | 
reserva:= Reserva crearReservaId: club cantidadReservas + 1 fecha: fecha horaInicio: i horaFin: (i +1) usuario: (usuario2 verNroUsuario ) cancha: 2.
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
show: '1 - Crear reserva.'; cr;
show: '2 - Crear cancha.'; cr;
show: '3 - Crear usuario.'; cr;
show: '4 - Crear Empleado.'; cr;
show: '5 - Cancelar reserva.'; cr;
show: '6 - Agregar disponibilidad a una cancha.'; cr;
show: '7 - Mostrar usuarios.'; cr;
show: '8 - Mostrar reservas por día.'; cr;
show: '9 - Mostrar cantidad de reservas por usuario.'; cr;
show: '10 - Mostrar cantidad de reservas por cancha.'; cr;
show: '0 - Salir del programa.'; cr;
show: '----------------------------------------------------------------------------------------------------'; cr.

opc:= (Prompter prompt: ' Ingrese una opcion:') asNumber.
[opc ~= 0] whileTrue: [
		"Crear reserva"
		(opc = 1) ifTrue: [
			[
			dia := (Prompter prompt: 'Ingrese el día de la reserva') asNumber.
			mes := (Prompter prompt: 'Ingrese el mes de la reserva') asNumber.
			anio := (Prompter prompt: 'Ingrese el año de la reserva') asNumber.
			fecha := Date newDay: dia monthNumber: mes year: anio.

			fecha < Date today ] whileTrue: [
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
						(horario isAllDigits and: [horario size > 0]) ifTrue:[
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
	
					fecha < Date today ] whileTrue: [
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
				canchasAEliminar := OrderedCollection new.

				"veo si las canchas que estan en el diccionario le quedan horarios disponibles, si no tiene las elimino del diccionario"
				reservaPorCancha keys do: [:unaCancha | 
					| reservaCancha |
					reservaCancha := reservaPorCancha at: unaCancha.
					canchaObj := club buscarCancha: unaCancha.
					(canchaObj verMargenHorasDia: diaSemana ) <= reservaCancha size
					ifTrue: [ canchasAEliminar add: unaCancha ].
				].

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
		].

		
		"Crear cancha"
		(opc = 2) ifTrue: [
			nomCancha := (Prompter prompt: 'Ingrese el nombre de la cancha: ') asString.

			Transcript show: '----------------Opciones----------------'; cr.
			Transcript show: '1 - Cancha de 5'; cr.
			Transcript show: '2 - Cancha de 7'; cr.
			Transcript show: '3 - Cancha de 11'; cr.
			Transcript show: '-------------------------------------------'; cr.

			opValida := false.

			[opValida not] whileTrue: [
				op := Prompter prompt: 'Ingrese una opción para el tamaño de la cancha: '.
    
				(op isAllDigits and: [op size > 0]) 
				ifTrue: [
					op := op asNumber.
					(((op = 1) or: [op = 2]) or: [op = 3])
					ifTrue: [
						opValida := true.
						tam := (op = 1 ifTrue: [5] ifFalse: [op = 2 ifTrue: [7] ifFalse: [11]]).
					]
					ifFalse: [
					Transcript show: 'Seleccione una de las opciones'; cr.
					].
				]
				ifFalse: [
					Transcript show: 'Porfavor ingrese un numero.'; cr.
				].
			].

			Transcript show: '----------------Opciones----------------'; cr.
			tipos do: [:tipo | Transcript show: tipo verId printString, ' - Tipo de cancha ' , tipo verTip; cr.].
				Transcript show: '-------------------------------------------'; cr.
				opValida := false.

				[opValida not] whileTrue: [
					op := Prompter prompt: 'Ingrese una opción para el Tipo de cancha: '.
					(op isAllDigits and: [op size > 0]) ifTrue: [
						op := op asNumber.
						(op >= 1 and: [op <= tipos size]) ifTrue: [
							opValida := true.
							tipo := tipos at: op .
						]
						ifFalse: [
							Transcript show: 'Seleccione una de las opciones'; cr.
						].
					]
					ifFalse: [
						Transcript show: 'Porfavor ingrese un numero.'; cr.
					].
				].


			cancha := Cancha crearCanchaid: (club cantidadCanchas) + 1 nom: nomCancha tam: tam tip: tipo.
			club agregarCancha: cancha.
		].
		"crear usuario"
		(opc = 3) ifTrue: [
			finCrear := true.

			[finCrear ] whileTrue: [
				Transcript show: '----------------- Crear Usuario -----------------'; cr.

				Transcript show: 'Escriba los siguientes datos del usuario:'; cr.
				Transcript show: '>>>Nombre'; cr.
				nombre := (Prompter prompt:'Ingrese su nombre:') asString.
				Transcript show: '>>>Apellido'; cr.
				apellido := (Prompter prompt:'Ingrese su apellido:') asString.
				Transcript show: '>>>DNI'; cr.
				dni :=  (Prompter prompt:'Ingrese su DNI') asString .
				Transcript show: '>>>Telefono'; cr.
				telefono := (Prompter prompt:'Ingrese su Telefono:') asString.
				Transcript show: '>>>Mail'; cr.
				mail :=  (Prompter prompt:'Ingrese su Email:') asString.

				Transcript show: '----------------------------------------------------'; cr.

				nroUsu := club cantidadUsuarios + 1.
				usuario := Usuario crearUsuariodni: dni nombre: nombre apellido: apellido 
					NroUsuario: nroUsu Email: mail Telefono: telefono.
				club agregarUsuario: usuario.

				Transcript show: '----------------------------------------------------'; cr.
				Transcript show: 'Elija una opcion:'; cr.
				Transcript show: '(Si) Para continuar la creación de usuarios'; cr.
				Transcript show: '(No) Para terminar la creación'; cr.
				Transcript show: '----------------------------------------------------'; cr.

				finCrear := MessageBox confirm: 'Desea seguir agregando usuarios' caption: 'Crear Usuarios'.
			].
		].
		"crear empleado"
		(opc = 4) ifTrue: [
			finCrear := true .

			[finCrear ] whileTrue: [
				Transcript show: '----------------- Crear Empleado -----------------'; cr.

				Transcript show: 'Escriba los siguientes datos del empleado:'; cr.
				Transcript show: '>>>Nombre'; cr.
				nombre := (Prompter prompt:'Ingrese su nombre:') asString.

				Transcript show: '>>>Apellido'; cr.
				apellido := (Prompter prompt:'Ingrese su apellido:') asString.

				Transcript show: '>>>DNI'; cr.
				dni :=  (Prompter prompt:'Ingrese su DNI') asString.

				Transcript show: '>>>Antigüedad'; cr.
				antiguedad := (Prompter prompt:'Ingrese la antigüedad').
				(antiguedad isAllDigits and: [antiguedad size > -1]) ifTrue: [ antiguedad := antiguedad asNumber .].

				Transcript show: '>>>Puesto y Salario'; cr.
				Transcript show: '	1 - Administrativo - 3500 $'; cr.
				Transcript show: '	2 - Mantenimiento - 3200 $'; cr.
				Transcript show: '	3 - Seguridad Nocturna - 3000 $'; cr.
				Transcript show: '------------------------------------------------------'; cr.

				opc := false.
				
				[opc not ] whileTrue: [
					opc2 :=  (Prompter prompt:'Elija una opción (1-3):').
					(opc2 isAllDigits and: [opc2 size > 0]) ifTrue: [ opc2 := opc2 asNumber .].

					(opc2 = 1) ifTrue: [
						puesto := 'Administrativo'.
						salario := 3500.
						opc := true.
					] ifFalse: [
						(opc2 = 2) ifTrue: [
							puesto := 'Mantenimiento'.
							salario := 3200.
							opc := true.
						] ifFalse: [
							(opc2 = 3) ifTrue: [
								puesto := 'Seguridad'.
								salario := 3000.
								opc := true.
							]
							ifFalse:[ MessageBox warning: 'ATENCION: Ingrese un numero.' caption: 'Error'.].
						].
					].
				].

				empleado := Empleado crearEmpleadoDni: dni Nombre: nombre Apellido: apellido 
					Salario: salario Antiguedad: antiguedad puesto: puesto.
				club agregarEmpleado: empleado.

				Transcript show: '----------------------------------------------------'; cr.
				Transcript show: 'Elija una opción:'; cr.
				Transcript show: '(S) Para continuar la creación de empleados'; cr.
				Transcript show: '(N) Para terminar la creación'; cr.
				Transcript show: '----------------------------------------------------'; cr.

				finCrear := MessageBox confirm: 'Desea seguir agregando Empleados' caption: 'Crear Empleados'.
			].
		].
		"cancelar reserva"
		(opc = 5) ifTrue: [
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
		].
		"agregar disponibilidad"
		(opc = 6) ifTrue: [
			finProceso := false.
			"---------- BUCLE PRINCIPAL ----------"
			[finProceso not] whileTrue: [

			    "---------- SELECCIONAR LA CANCHA A MODIFICAR ----------"
			    Transcript show: '----------------------------------------------------'; cr.
			    Transcript show: 'Seleccione la cancha a la que desea agregar disponibilidad:'; cr.
			    club verTodasLasCanchas do: [ :c |
				Transcript show: 'ID: ', c verId printString, ' - Nombre: ', c verNomb; cr.
			    ].
			    Transcript show: '----------------------------------------------------'; cr.

			    opValida := false.
			    canchaSeleccionada := nil.
			    [opValida not] whileTrue: [
				idCancha := Prompter prompt: 'Ingrese el ID de la cancha:'.
				(idCancha isAllDigits and: [idCancha size > 0])
				    ifTrue: [
					canchaSeleccionada := club buscarCancha: idCancha asNumber.
					canchaSeleccionada notNil
					    ifTrue: [ opValida := true ]
					    ifFalse: [ MessageBox warning: 'No se encontró una cancha con ese ID.' caption: 'Error'. ]
				    ]
				    ifFalse: [ MessageBox warning: 'Por favor, ingrese un ID numérico.' caption: 'Error'. ]
			    ].

			    " ---------- INGRESAR LOS DATOS DE LA NUEVA DISPONIBILIDAD ----------"
			    diasSemana := #('Lunes' 'Martes' 'Miercoles' 'Jueves' 'Viernes' 'Sabado' 'Domingo').
			    opcValida := false.
			    [opcValida not] whileTrue: [
				Transcript show: 'Seleccione el día de la semana:'; cr.
				diasSemana doWithIndex: [:d :i | Transcript show: i printString, ' - ', d; cr].
				opc := Prompter prompt: 'Ingrese el número del día:'.
				(opc isAllDigits and: [opc size > 0])
				    ifTrue: [
					opc := opc asNumber.
					(opc >= 1 and: [opc <= diasSemana size])
					    ifTrue: [
						dia := diasSemana at: opc.
						(canchaSeleccionada tieneDia: dia)
						    ifNil: [ opcValida := true ]
						    ifNotNil: [ MessageBox warning: 'La cancha ya tiene disponibilidad para el día ', dia, '. No se puede agregar duplicados.' caption: 'Conflicto'. ]
					    ]
					    ifFalse: [ MessageBox warning: 'Opción inválida.' caption: 'Error'. ]
				    ]
				    ifFalse: [ MessageBox warning: 'Por favor, ingrese un número.' caption: 'Error'. ]
			    ].
			    opcValida := false.
			    [opcValida not] whileTrue: [
				horaAp := Prompter prompt: 'Ingrese la hora de apertura (formato 24hs)'.
				(horaAp isAllDigits and: [horaAp size > 0])
				    ifTrue: [
					horaAp := horaAp asNumber.
					(horaAp >= 0 and: [horaAp <= 23])
					    ifTrue: [ opcValida := true ]
					    ifFalse: [ MessageBox warning: 'La hora debe estar entre 0 y 23.' caption: 'Error'. ]
				    ]
				    ifFalse: [ MessageBox warning: 'Por favor, ingrese un número.' caption: 'Error'. ]
			    ].
			    opcValida := false.
			    [opcValida not] whileTrue: [
				horaCi := Prompter prompt: 'Ingrese la hora de cierre (formato 24hs)'.
				(horaCi isAllDigits and: [horaCi size > 0])
				    ifTrue: [
					horaCi := horaCi asNumber.
					(horaCi > horaAp and: [horaCi <= 24])
					    ifTrue: [ opcValida := true ]
					    ifFalse: [ MessageBox warning: 'La hora de cierre debe ser posterior a la de apertura (', horaAp printString, ') y menor o igual a 24.' caption: 'Error'. ]
				    ]
				    ifFalse: [ MessageBox warning: 'Por favor, ingrese un número.' caption: 'Error'. ]
			    ].

			    " ---------- CREACIÓN Y AGREGADO DEL OBJETO ----------"
			    disponibilidad := Disponibilidad crearDisponibilidadid: (canchaSeleccionada verTodasLasDisponibilidades size + 1) horaAp: horaAp horaCi: horaCi dia: dia.
			    canchaSeleccionada agregarDisponibilidad: disponibilidad.

			    MessageBox notify: 'Disponibilidad para el día ', dia, ' agregada con éxito a la ', canchaSeleccionada verNomb caption: 'Éxito'.

			    "5. ---------- PREGUNTAR SI CONTINUAR ----------"
			    opc := Prompter prompt: '¿Desea agregar otra disponibilidad? (S/N)'.
			    (opc asLowercase = 's')
				ifFalse: [ finProceso := true ].
			].
		].
		"mostrar usuarios"
		(opc = 7) ifTrue: [	
			"colección que se ordena sola."
			usuariosOrdenados := SortedCollection new.
			"criterio de ordenamiento: por apellido."
			usuariosOrdenados sortBlock: [:a :b | a verApellido <= b verApellido].
			"Agregamos todos los usuarios"
			usuariosOrdenados addAll: (club verTodosLosUsuarios).

			Transcript clear.

			usuariosOrdenados do: [ :i |
			    Transcript show: 'Dni: ', i verDni printString; cr.
			    Transcript show: 'Nombre: ', i verNombre printString; cr.
			    Transcript show: 'Apellido: ', i verApellido printString; cr.
			    Transcript show: 'NroUsuario: ', i verNroUsuario printString; cr.
			    Transcript show: 'Email: ', i verEmail printString; cr.
			    Transcript show: 'Teléfono: ', i verTelefono printString; cr.
			    Transcript show: '-----------------------------------'; cr; cr.
			].
			MessageBox notify: 'Haga click en aceptar para dejar de ver' caption: 'Datos impresos'.
		].

		"mostrar reservas por dia"
		(opc = 8) ifTrue: [						
			dia := (Prompter prompt: 'Ingrese el día de la reserva:') asNumber.
			mes := (Prompter prompt: 'Ingrese el mes de la reserva:') asNumber .
			anio := (Prompter prompt: 'Ingrese el año de la reserva:') asNumber .

			fechaElegida := Date newDay: dia monthNumber: mes year: anio.
			reservasTot := club reservasDia: fechaElegida.

			Transcript clear.
			Transcript show: '-------------------------------------------------------------- '; cr.
			Transcript show: 'Reservas para el día ', fechaElegida printString; cr.
			Transcript show: '-------------------------------------------------------------- '; cr.

			reservasTot isEmpty
			    ifTrue: [Transcript show: 'No hay reservas para esa fecha.'; cr]
			    ifFalse: [reservasTot do: [:r | Transcript show: (r printReserva: club) ; cr]].
			MessageBox notify: 'Haga click en aceptar para dejar de ver' caption: 'Datos impresos'.
		].
		"mostrar cantidad de reservas por usuario"
		(opc = 9) ifTrue: [	
			Transcript clear.
			Transcript show: '-----------------------------------------'; cr.
			Transcript show: ' Cantidad de reservas por usuario'; cr.
			Transcript show: '-----------------------------------------'; cr.

			reservas := club verTodasLasReservas.

			usuarios := reservas collect: [:r | club buscarUsuario: (r verUsuario) ].
			usuarios := usuarios asSet.  "Elimina duplicados"

			usuarios do: [:u | 
			reservasPorUsuario := reservas select: [:r | r verUsuario = u verNroUsuario ].
			Transcript show: (u verNombre) , ' ' , (u verApellido ),' (', (u verNroUsuario) printString , ') - Cantidad de reservas: ', reservasPorUsuario size printString; cr.

			].
			MessageBox notify: 'Haga click en aceptar para dejar de ver' caption: 'Datos impresos'.
		].
		"mostrar cantidad de reservas por cancha"
		(opc = 10) ifTrue: [
			canchas := club verTodasLasCanchas.
			reservas := club verTodasLasReservas.

			Transcript show: 'Cantidad de reservas por cancha:'; cr.
			Transcript show: '---------------------------------'; cr.

			canchas do: [:c |
			    cantidad := 0.
			    reservas do: [:r |
				(r verCancha = c verId ) ifTrue: [cantidad := cantidad + 1].
			    ].
			    Transcript show: 'Cancha ', c verId printString, ' (', c verNomb, '): ', cantidad printString, ' reservas.'; cr.
			].

			Transcript show: '---------------------------------'; cr.
			MessageBox notify: 'Haga click en aceptar para dejar de ver' caption: 'Datos impresos'.
		].

	Transcript clear.
	Transcript show: 'Opciones: '; cr;
	show: '1 - Crear reserva.'; cr;
	show: '2 - Crear cancha.'; cr;
	show: '3 - Crear usuario.'; cr;
	show: '4 - Crear Empleado.'; cr;
	show: '5 - Cancelar reserva.'; cr;
	show: '6 - Agregar disponibilidad a una cancha.'; cr;
	show: '7 - Mostrar usuarios.'; cr;
	show: '8 - Mostrar reservas por día.'; cr;
	show: '9 - Mostrar cantidad de reservas por usuario.'; cr;
	show: '10 - Mostrar cantidad de reservas por cancha.'; cr;
	show: '0 - Salir del programa.'; cr;
	show: '----------------------------------------------------------------------------------------------------'; cr.
	opc:= (Prompter prompt: ' Ingrese una opcion:') asNumber.
].

Transcript clear.
club inspect.
