|club e tipos tipo cesped sintetico sala nomCancha op opValida  tam cancha|

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

e := Empleado crearEmpleadoDni: '1234' Nombre: 'Ana' Apellido: 'Pérez' Salario: 60000 Antiguedad: 5 puesto: 'Diseñadora'.

cesped:= TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.
sintetico:= TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico'.
sala:= TipoCancha crearTipoCanchaid: 3 tip: 'Sala'.

tipos:= OrderedCollection new.
tipos add: cesped.
tipos add: sintetico.
tipos add: sala.

Transcript clear.

1to: 2 do: [:i|

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
    
    (op isAllDigits and: [op size > 0]) 
        ifTrue: [
            op := op asNumber.
            (op >= 1 and: [op <= tipos size])

                ifTrue: [
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


cancha := Cancha crearCanchaid: club cantidadCanchas nom: nomCancha tam: tam tip: tipo.
club agregarCancha: cancha.

].

club inspect.
