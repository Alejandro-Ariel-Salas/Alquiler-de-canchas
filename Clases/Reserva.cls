"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Reserva
	instanceVariableNames: 'id fecha horaInicio horaFin usuario cancha estadoReserva'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Reserva guid: (GUID fromString: '{246D5A08-D672-4359-9331-2AC8B00BC21D}')!
Reserva comment: ''!
!Reserva categoriesForClass!Kernel-Objects! !
!Reserva methodsFor!

initReservaId:unId fecha:unaFecha horaInicio:unaHoraInicio horaFin:unaHoraFin usuario:unUsuario cancha:unaCancha
id:=unId.
fecha:=unaFecha.
horaInicio:=unaHoraInicio.
horaFin:=unaHoraFin.
usuario:=unUsuario.
cancha:=unaCancha.
estadoReserva:=true.!

modiCancha:unaCancha
cancha:=unaCancha.!

modiEstadoReserva:unEstadoReserva
estadoReserva:=unEstadoReserva.!

modiFecha:unaFecha
fecha:=unaFecha.!

modihoraFin:unaHoraFin
horaFin:=unaHoraFin.!

modihoraInicio:unaHoraInicio
horaInicio:=unaHoraInicio.!

modiId:unId
id:=unId.!

modiUsuario:unUsuario
usuario:=unUsuario.!

printReserva
    ^ 'Horario: ', horaInicio printString , ' a ', horaFin printString , Character cr asString,
      'Cliente: ', usuario printString, Character cr asString,
      'Cancha de Fútbol ', (cancha verTam) printString, ' - ', cancha verTip verTip,Character cr asString,
      '-------------------------------------------------------------- '



      
      

!

verCancha
^cancha.!

verEstadoReserva
^estadoReserva.!

verFecha
^fecha.!

verHoraFin
^horaFin.!

verHoraInicio
^horaInicio.!

verId
^id.!

verUsuario
^usuario.! !
!Reserva categoriesFor: #initReservaId:fecha:horaInicio:horaFin:usuario:cancha:!public! !
!Reserva categoriesFor: #modiCancha:!public! !
!Reserva categoriesFor: #modiEstadoReserva:!public! !
!Reserva categoriesFor: #modiFecha:!public! !
!Reserva categoriesFor: #modihoraFin:!public! !
!Reserva categoriesFor: #modihoraInicio:!public! !
!Reserva categoriesFor: #modiId:!public! !
!Reserva categoriesFor: #modiUsuario:!public! !
!Reserva categoriesFor: #printReserva!public! !
!Reserva categoriesFor: #verCancha!public! !
!Reserva categoriesFor: #verEstadoReserva!public! !
!Reserva categoriesFor: #verFecha!public! !
!Reserva categoriesFor: #verHoraFin!public! !
!Reserva categoriesFor: #verHoraInicio!public! !
!Reserva categoriesFor: #verId!public! !
!Reserva categoriesFor: #verUsuario!public! !

!Reserva class methodsFor!

crearReservaId:unId fecha:unaFecha horaInicio:unaHoraInicio horaFin:unaHoraFin usuario:unUsuario cancha:unaCancha
^(self new) initReservaId: unId fecha: unaFecha horaInicio: unaHoraInicio horaFin: unaHoraFin usuario: unUsuario cancha: unaCancha.! !
!Reserva class categoriesFor: #crearReservaId:fecha:horaInicio:horaFin:usuario:cancha:!public! !

