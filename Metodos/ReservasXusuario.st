| club cesped sintetico sala res1 res2 res3 res4 usu1 usu2 usu3 fecha1 fecha2 fecha3 can1 can2 can3 reservasPorUsuario reservas usuarios| 

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

cesped:= TipoCancha crearTipoCanchaid: 1 tip: 'Cesped'.
sintetico:= TipoCancha crearTipoCanchaid: 2 tip: 'Sintetico'.
sala:= TipoCancha crearTipoCanchaid: 3 tip: 'Sala'.

can1 := Cancha crearCanchaid: 1 nom: 'cancha1' tam: 5 tip: sintetico.
can2 := Cancha crearCanchaid: 2 nom: 'cancha2' tam: 5 tip: sala.
can3 := Cancha crearCanchaid: 3 nom: 'cancha3' tam: 7 tip: cesped.

usu1 := Usuario crearUsuariodni: '44234121' nombre: 'Javier' apellido: 'Soto' NroUsuario: 1 Email: 'JavSo@gmail.com' Telefono: '11 6542 4534'.
usu2 := Usuario crearUsuariodni: '34432527' nombre: 'Juan' apellido: 'Coro' NroUsuario: 2 Email: 'JanCo@gmail.com' Telefono: '11 6242 8703'.
usu3 := Usuario crearUsuariodni: '24234172' nombre: 'Gabriel' apellido: 'zains' NroUsuario: 3 Email: 'GZains@gmail.com' Telefono: '11 6543 7534'.

fecha1 := Date newDay: 25 monthNumber: 5 year: 2025.
fecha2 := Date newDay: 24 monthNumber: 5 year: 2025.
fecha3 := Date newDay: 17 monthNumber: 5 year: 2025.  

res1 := Reserva crearReservaId: 1 fecha: fecha2 horaInicio: '19' horaFin: '20' usuario: usu1 cancha: can1.
res2 := Reserva crearReservaId: 2 fecha: fecha3 horaInicio: '19' horaFin: '20' usuario: usu1 cancha: can1.
res3 := Reserva crearReservaId: 3 fecha: fecha1 horaInicio: '17' horaFin: '18' usuario: usu2 cancha: can3.
res4 := Reserva crearReservaId: 4 fecha: fecha2 horaInicio: '17' horaFin: '19' usuario: usu3 cancha: can2.

club agregarReserva: res1.
club agregarReserva: res2.
club agregarReserva: res3.
club agregarReserva: res4.

Transcript clear.
Transcript show: '-----------------------------------------'; cr.
Transcript show: ' Cantidad de reservas por usuario'; cr.
Transcript show: '-----------------------------------------'; cr.

reservas := club verTodasLasReservas.
usuarios := reservas collect: [:r | r verUsuario ].
usuarios := usuarios asSet.  "Elimina duplicados"



usuarios do: [:u | 
    reservasPorUsuario := reservas select: [:r | r verUsuario = u ].
    Transcript show: 'Usuario: ', u printString, ' - Cantidad de reservas: ', reservasPorUsuario size printString; cr.
].


a Set(an Usuario an Usuario an Usuario)