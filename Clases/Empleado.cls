"Filed out from Dolphin Smalltalk 7"!

Persona subclass: #Empleado
	instanceVariableNames: 'salario antiguedad puesto'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Empleado guid: (GUID fromString: '{EFDB6CD2-CA86-485C-80E4-850837F74F7D}')!
Empleado comment: ''!
!Empleado categoriesForClass!Kernel-Objects! !
!Empleado methodsFor!

initEmpleadodni: unDni nombre: unNom apellido: unApe salario: unSal antiguedad: unAnt puesto: unPue
    super initPersonadni: unDni nom: unNom apellido: unApe.
    salario := unSal.
    antiguedad := unAnt.
    puesto := unPue.!

modificarPuesto: unPue
puesto := unPue.!

modificarSalario: unSal
salario := unSal.!

verAntiguedad
^antiguedad.!

verApellido
^apellido.!

verDni
^dni.!

verNombre
^nombre.!

verpuesto
^puesto.!

verSalario
^salario.
! !
!Empleado categoriesFor: #initEmpleadodni:nombre:apellido:salario:antiguedad:puesto:!public! !
!Empleado categoriesFor: #modificarPuesto:!public! !
!Empleado categoriesFor: #modificarSalario:!public! !
!Empleado categoriesFor: #verAntiguedad!public! !
!Empleado categoriesFor: #verApellido!public! !
!Empleado categoriesFor: #verDni!public! !
!Empleado categoriesFor: #verNombre!public! !
!Empleado categoriesFor: #verpuesto!public! !
!Empleado categoriesFor: #verSalario!public! !

!Empleado class methodsFor!

crearEmpleadoDni: unDni Nombre: unNom Apellido: unApe Salario: unSal Antiguedad: unAnt puesto: unPue
    ^(self new) initEmpleadodni: unDni nombre: unNom apellido: unApe salario: unSal antiguedad: unAnt puesto: unPue
! !
!Empleado class categoriesFor: #crearEmpleadoDni:Nombre:Apellido:Salario:Antiguedad:puesto:!public! !

