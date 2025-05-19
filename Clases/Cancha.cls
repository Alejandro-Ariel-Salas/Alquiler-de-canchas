"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Cancha
	instanceVariableNames: 'id nombre tamanio tipo disponibilidades'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Cancha guid: (GUID fromString: '{36014869-9B69-469F-BDE1-8C1E6526B703}')!
Cancha comment: ''!
!Cancha categoriesForClass!Kernel-Objects! !
!Cancha methodsFor!

agregarDisponibilidad:unaDisp
disponibilidades add: unaDisp.!

buscarDisponibilidad:idDisponibilidad
^ disponibilidades detect: [:disponibilidad | disponibilidad verId = idDisponibilidad ] ifNone: [nil].!

buscarDisponibilidadDia:unDia
^ disponibilidades detect: [:disponibilidad | disponibilidad verDia = unDia ] ifNone: [nil].!

cantidadDisponibilidades
^disponibilidades size.!

initCanchaid:unId nom:unNom tam:unTam tip:unTip 
id:= unId.
nombre := unNom.
tamanio := unTam.
tipo := unTip .
disponibilidades := OrderedCollection new.
!

modiNomb:unNomb
nombre :=unNomb.!

modiTam:unTam
tamanio :=unTam.!

modiTipo:unTipo
tipo :=unTipo.!

tieneDia:unDia
^self verTodasLasDisponibilidades detect: [:disp | disp verDia = unDia] ifNone: [nil].!

verId
^id.!

verNomb
^nombre.!

verTam
^tamanio.!

verTip
^tipo.!

verTodasLasDisponibilidades
^disponibilidades.! !
!Cancha categoriesFor: #agregarDisponibilidad:!public! !
!Cancha categoriesFor: #buscarDisponibilidad:!public! !
!Cancha categoriesFor: #buscarDisponibilidadDia:!public! !
!Cancha categoriesFor: #cantidadDisponibilidades!public! !
!Cancha categoriesFor: #initCanchaid:nom:tam:tip:!public! !
!Cancha categoriesFor: #modiNomb:!public! !
!Cancha categoriesFor: #modiTam:!public! !
!Cancha categoriesFor: #modiTipo:!public! !
!Cancha categoriesFor: #tieneDia:!public! !
!Cancha categoriesFor: #verId!public! !
!Cancha categoriesFor: #verNomb!public! !
!Cancha categoriesFor: #verTam!public! !
!Cancha categoriesFor: #verTip!public! !
!Cancha categoriesFor: #verTodasLasDisponibilidades!public! !

!Cancha class methodsFor!

crearCanchaid:unId nom:unNom tam:unTam tip:unTip
^(self new) initCanchaid:unId nom:unNom tam:unTam tip:unTip.! !
!Cancha class categoriesFor: #crearCanchaid:nom:tam:tip:!public! !

