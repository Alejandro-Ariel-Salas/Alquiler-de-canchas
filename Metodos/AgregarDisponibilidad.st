| club canchaSeleccionada opValida finProceso idCancha dia horaAp horaCi disponibilidad diasSemana opc opcValida |
Transcript clear.
club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.
cancha := Cancha crearCanchaid: 1 nom: 'Cancha Principal' tam: 5 tip: (TipoCancha crearTipoCanchaid: 1 tip: 'Cesped').
disponibilidad := Disponibilidad crearDisponibilidadid: 1 horaAp: 10 horaCi: 22 dia: 'Lunes'.
cancha agregarDisponibilidad: disponibilidad.
club agregarCancha: cancha.
cancha := Cancha crearCanchaid: 2 nom: 'Cancha Secundaria' tam: 7 tip: (TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico').
club agregarCancha: cancha.

finProceso := false.
"---------- BUCLE PRINCIPAL ----------"
[finProceso not] whileTrue: [

    "---------- SELECCIONAR LA CANCHA A MODIFICAR ----------"
    Transcript show: '----------------------------------------------------'; cr.
    Transcript show: 'Seleccione la cancha a la que desea agregar disponibilidad:'; cr.
    club verTodasLasCanchas do: [ :c |
        Transcript show: 'ID: ', c verId printString, ' - Nombre: ', c verNomb; cr.
    ].
    Transcript show: '----------------------------------------------------'; cr.

    opValida := false.
    canchaSeleccionada := nil.
    [opValida not] whileTrue: [
        idCancha := Prompter prompt: 'Ingrese el ID de la cancha:'.
        (idCancha isAllDigits and: [idCancha size > 0])
            ifTrue: [
                canchaSeleccionada := club buscarCancha: idCancha asNumber.
                canchaSeleccionada notNil
                    ifTrue: [ opValida := true ]
                    ifFalse: [ MessageBox warning: 'No se encontró una cancha con ese ID.' caption: 'Error'. ]
            ]
            ifFalse: [ MessageBox warning: 'Por favor, ingrese un ID numérico.' caption: 'Error'. ]
    ].

    " ---------- INGRESAR LOS DATOS DE LA NUEVA DISPONIBILIDAD ----------"
    diasSemana := #('Lunes' 'Martes' 'Miercoles' 'Jueves' 'Viernes' 'Sabado' 'Domingo').
    opcValida := false.
    [opcValida not] whileTrue: [
        Transcript show: 'Seleccione el día de la semana:'; cr.
        diasSemana doWithIndex: [:d :i | Transcript show: i printString, ' - ', d; cr].
        opc := Prompter prompt: 'Ingrese el número del día:'.
        (opc isAllDigits and: [opc size > 0])
            ifTrue: [
                opc := opc asNumber.
                (opc >= 1 and: [opc <= diasSemana size])
                    ifTrue: [
                        dia := diasSemana at: opc.
                        (canchaSeleccionada tieneDia: dia)
                            ifNil: [ opcValida := true ]
                            ifNotNil: [ MessageBox warning: 'La cancha ya tiene disponibilidad para el día ', dia, '. No se puede agregar duplicados.' caption: 'Conflicto'. ]
                    ]
                    ifFalse: [ MessageBox warning: 'Opción inválida.' caption: 'Error'. ]
            ]
            ifFalse: [ MessageBox warning: 'Por favor, ingrese un número.' caption: 'Error'. ]
    ].
    opcValida := false.
    [opcValida not] whileTrue: [
        horaAp := Prompter prompt: 'Ingrese la hora de apertura (formato 24hs)'.
        (horaAp isAllDigits and: [horaAp size > 0])
            ifTrue: [
                horaAp := horaAp asNumber.
                (horaAp >= 0 and: [horaAp <= 23])
                    ifTrue: [ opcValida := true ]
                    ifFalse: [ MessageBox warning: 'La hora debe estar entre 0 y 23.' caption: 'Error'. ]
            ]
            ifFalse: [ MessageBox warning: 'Por favor, ingrese un número.' caption: 'Error'. ]
    ].
    opcValida := false.
    [opcValida not] whileTrue: [
        horaCi := Prompter prompt: 'Ingrese la hora de cierre (formato 24hs)'.
        (horaCi isAllDigits and: [horaCi size > 0])
            ifTrue: [
                horaCi := horaCi asNumber.
                (horaCi > horaAp and: [horaCi <= 24])
                    ifTrue: [ opcValida := true ]
                    ifFalse: [ MessageBox warning: 'La hora de cierre debe ser posterior a la de apertura (', horaAp printString, ') y menor o igual a 24.' caption: 'Error'. ]
            ]
            ifFalse: [ MessageBox warning: 'Por favor, ingrese un número.' caption: 'Error'. ]
    ].

    " ---------- CREACIÓN Y AGREGADO DEL OBJETO ----------"
    disponibilidad := Disponibilidad crearDisponibilidadid: (canchaSeleccionada verTodasLasDisponibilidades size + 1) horaAp: horaAp horaCi: horaCi dia: dia.
    canchaSeleccionada agregarDisponibilidad: disponibilidad.

    MessageBox notify: 'Disponibilidad para el día ', dia, ' agregada con éxito a la ', canchaSeleccionada verNomb caption: 'Éxito'.

    "5. ---------- PREGUNTAR SI CONTINUAR ----------"
    opc := Prompter prompt: '¿Desea agregar otra disponibilidad? (S/N)'.
    (opc asLowercase = 's')
        ifFalse: [ finProceso := true ].
].

club inspect.