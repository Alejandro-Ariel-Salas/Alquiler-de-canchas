"Filed out from Dolphin Smalltalk 7"!

Persona subclass: #Usuario
	instanceVariableNames: 'NroUsuario Email Telefono'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Usuario guid: (GUID fromString: '{D9D28FE2-FA55-4493-B988-CF10EA57BEDC}')!
Usuario comment: ''!
!Usuario categoriesForClass!Kernel-Objects! !
!Usuario methodsFor!

initEmpleadodni: unDni nombre: unNom apellido: unApe nroUsuario: unUsu email: unEma telefono: unTel
    super initPersonadni: unDni nom: unNom apellido: unApe.
    NroUsuario := unUsu.
    Email := unEma.
    Telefono := unTel.!

initUsuariodni: unDni nombre: unNom apellido: unApe nroUsuario: unUsu email: unEma telefono: unTel
    super initPersonadni: unDni nom: unNom apellido: unApe.
    NroUsuario := unUsu.
    Email := unEma.
    Telefono := unTel.!

ModificarEmail: unema
Telefono := unema.!

ModificarTelefono: untel
Telefono := untel.!

printString
    ^ 'Usuario: ',nombre, ' ', apellido
!

verEmail
^Email.
!

verNroUsuario
^NroUsuario.!

verTelefono
^Telefono.
! !
!Usuario categoriesFor: #initEmpleadodni:nombre:apellido:nroUsuario:email:telefono:!public! !
!Usuario categoriesFor: #initUsuariodni:nombre:apellido:nroUsuario:email:telefono:!public! !
!Usuario categoriesFor: #ModificarEmail:!public! !
!Usuario categoriesFor: #ModificarTelefono:!public! !
!Usuario categoriesFor: #printString!public! !
!Usuario categoriesFor: #verEmail!public! !
!Usuario categoriesFor: #verNroUsuario!public! !
!Usuario categoriesFor: #verTelefono!public! !

!Usuario class methodsFor!

crearUsuariodni: unDni nombre: unNom apellido: unApe NroUsuario: unUsu Email: unEma Telefono: unTel
^(self new) initUsuariodni: unDni nombre: unNom apellido: unApe nroUsuario: unUsu email: unEma telefono: unTel.! !
!Usuario class categoriesFor: #crearUsuariodni:nombre:apellido:NroUsuario:Email:Telefono:!public! !

