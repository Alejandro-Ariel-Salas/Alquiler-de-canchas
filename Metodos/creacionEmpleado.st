|club empleado dni nombre apellido salario antiguedad puesto finCrear opc opc2 opc3| 

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

finCrear := false.

[finCrear not ] whileTrue: [
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
				].
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

	opc3 :=  (Prompter prompt:'Ingrese aquí la opción:') asString.
	opc3 := opc3 asLowercase.

	(opc3 = 's')
		ifTrue: [finCrear := false ]
		ifFalse: [finCrear := true].
].





