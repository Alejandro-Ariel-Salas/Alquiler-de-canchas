"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Club
	instanceVariableNames: 'nombre direccion telefono email empleados usuarios reservas canchas'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Club guid: (GUID fromString: '{EF930DDC-8C14-4387-A272-EA540E149956}')!
Club comment: ''!
!Club categoriesForClass!Kernel-Objects! !
!Club methodsFor!

agregarCancha:unCancha
canchas add: unCancha.!

agregarEmpleado:unEmpleado
empleados add: unEmpleado.!

agregarReserva:unReserva
reservas add: unReserva.!

agregarUsuario:unUsuario
usuarios add: unUsuario.!

buscarCancha:idCancha
^ canchas detect: [:cancha | cancha verId = idCancha ] ifNone: [nil].!

buscarEmpleado:idEmpleado
^empleados detect: [:empleado | empleado verId = idEmpleado ] ifNone: [nil].!

buscarReserva:idReserva
^reservas detect: [:reserva | reserva verId = idReserva ] ifNone: [nil].!

buscarUsuario:idUsuario
^usuarios detect: [:usuario | usuario verNroUsuario = idUsuario ] ifNone: [nil].!

cantidadCanchas
^canchas size.!

cantidadEmpleados
^empleados size.!

cantidadReservas
^reservas size.!

cantidadUsuarios
^usuarios size.!

initClubnom:unNom dir:unaDir tel:unTel email:unEmail
nombre:= unNom.
direccion:= unaDir.
telefono:= unTel.
email:= unEmail.
empleados:= OrderedCollection new.
usuarios:= OrderedCollection new.
reservas := OrderedCollection new.
canchas:= OrderedCollection new.
!

modiDir:unaDir
direccion:=unaDir.!

modiEmail:unEmail
email:=unEmail.!

modiNom:unNom
nombre:=unNom.!

modiTel:unTel
telefono:=unTel.!

reservasDia: unaFecha
|reservas|
reservas := self verTodasLasReservas.
^reservas select: [:reserva | reserva verFecha = unaFecha ].!

verDir
^direccion.!

verEmail
^email.!

verNom
^nombre.!

verReservasActivas: unaFecha
|r|
r := self verTodasLasReservas.
^r select: [:reserva | (reserva verFecha = unaFecha) and: [reserva verEstadoReserva] ].
!

verTel
^telefono.!

verTodasLasCanchas
^canchas.!

verTodasLasReservas
^reservas.!

verTodosLosEmpleados
^empleados.!

verTodosLosUsuarios
^usuarios.! !
!Club categoriesFor: #agregarCancha:!public! !
!Club categoriesFor: #agregarEmpleado:!public! !
!Club categoriesFor: #agregarReserva:!public! !
!Club categoriesFor: #agregarUsuario:!public! !
!Club categoriesFor: #buscarCancha:!public! !
!Club categoriesFor: #buscarEmpleado:!public! !
!Club categoriesFor: #buscarReserva:!public! !
!Club categoriesFor: #buscarUsuario:!public! !
!Club categoriesFor: #cantidadCanchas!public! !
!Club categoriesFor: #cantidadEmpleados!public! !
!Club categoriesFor: #cantidadReservas!public! !
!Club categoriesFor: #cantidadUsuarios!public! !
!Club categoriesFor: #initClubnom:dir:tel:email:!public! !
!Club categoriesFor: #modiDir:!public! !
!Club categoriesFor: #modiEmail:!public! !
!Club categoriesFor: #modiNom:!public! !
!Club categoriesFor: #modiTel:!public! !
!Club categoriesFor: #reservasDia:!public! !
!Club categoriesFor: #verDir!public! !
!Club categoriesFor: #verEmail!public! !
!Club categoriesFor: #verNom!public! !
!Club categoriesFor: #verReservasActivas:!public! !
!Club categoriesFor: #verTel!public! !
!Club categoriesFor: #verTodasLasCanchas!public! !
!Club categoriesFor: #verTodasLasReservas!public! !
!Club categoriesFor: #verTodosLosEmpleados!public! !
!Club categoriesFor: #verTodosLosUsuarios!public! !

!Club class methodsFor!

crearClubnom: unNom dir: unaDir tel: unTel email: unEmail
^(self new) initClubnom: unNom dir: unaDir tel: unTel email: unEmail.! !
!Club class categoriesFor: #crearClubnom:dir:tel:email:!public! !

