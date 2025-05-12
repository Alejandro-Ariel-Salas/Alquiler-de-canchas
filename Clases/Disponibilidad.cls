"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Disponibilidad
	instanceVariableNames: 'id horaApertura horaCierre dia'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Disponibilidad guid: (GUID fromString: '{6D5F50F2-9A81-4FC1-8317-C062062178C8}')!
Disponibilidad comment: ''!
!Disponibilidad categoriesForClass!Kernel-Objects! !
!Disponibilidad methodsFor!

initDisponibilidadid:unId horaAp:unaHoraAp horaCi:unaHoraCi dia:unDia 
id:= unId.
horaApertura := unaHoraAp.
horaCierre := unaHoraCi.
dia := unDia.
!

modiDia:unDia
dia :=unDia.!

modiHoraAp:unaHoraAp
horaApertura :=unaHoraAp.!

modiHoraCi:unaHoraCi
horaCierre :=unaHoraCi.!

verDia
^dia.!

verHoraAp
^horaApertura.!

verHoraCi
^horaCierre.!

verId
^id.! !
!Disponibilidad categoriesFor: #initDisponibilidadid:horaAp:horaCi:dia:!public! !
!Disponibilidad categoriesFor: #modiDia:!public! !
!Disponibilidad categoriesFor: #modiHoraAp:!public! !
!Disponibilidad categoriesFor: #modiHoraCi:!public! !
!Disponibilidad categoriesFor: #verDia!public! !
!Disponibilidad categoriesFor: #verHoraAp!public! !
!Disponibilidad categoriesFor: #verHoraCi!public! !
!Disponibilidad categoriesFor: #verId!public! !

!Disponibilidad class methodsFor!

crearDisponibilidadid:unId horaAp:unaHoraAp horaCi:unaHoraCi dia:unDia
^(self new) initDisponibilidadid:unId horaAp:unaHoraAp horaCi:unaHoraCi dia:unDia.! !
!Disponibilidad class categoriesFor: #crearDisponibilidadid:horaAp:horaCi:dia:!public! !

