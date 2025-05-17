|club usuario dni nombre apellido nroUsu telefono mail finCrear opc|

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

finCrear := false.

[finCrear not ] whileTrue: [
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
	Transcript show: '(S) Para continuar la creación de usuarios'; cr.
	Transcript show: '(N) Para terminar la creación'; cr.
	Transcript show: '----------------------------------------------------'; cr.

	opc :=  (Prompter prompt:'Ingrese aqui la opcion:') asString.
	opc := opc asLowercase.

	(opc = 's')
	    ifTrue: [finCrear := false]
	    ifFalse: [finCrear := true].
].





