"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Persona
	instanceVariableNames: 'dni nombre apellido'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Persona guid: (GUID fromString: '{8A73784F-DD00-4512-B370-49291BA6DD83}')!
Persona comment: ''!
!Persona categoriesForClass!Kernel-Objects! !
!Persona methodsFor!

initPersonadni:unDni nom:unNom apellido:unApe
dni:=unDni.
nombre:=unNom.
apellido:=unApe.
!

verApellido
^apellido.!

verDni
^dni.!

verNombre
^nombre.! !
!Persona categoriesFor: #initPersonadni:nom:apellido:!public! !
!Persona categoriesFor: #verApellido!public! !
!Persona categoriesFor: #verDni!public! !
!Persona categoriesFor: #verNombre!public! !

!Persona class methodsFor!

crearPersonadni:unDni nom:unNom apellido:unApe
^(self new) initPersonadni: unDni nom: unNom apellido: unApe.! !
!Persona class categoriesFor: #crearPersonadni:nom:apellido:!public! !

