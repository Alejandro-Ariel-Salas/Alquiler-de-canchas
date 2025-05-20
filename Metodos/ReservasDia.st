| club dia reservasTot reservasPorDia reserva |

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

dia := Prompter prompt: 'Ingrese la fecha (DD-MM-YY):'.

reservasTot := club verTodasLasReservas.

reservasPorDia := reservasTot select: [:reserva | reserva fecha = dia].

Transcript show: '------------------------------------------------------- '; cr.
Transcript show: '  Reservas para el día ', dia, ':'; cr.
Transcript show: '------------------------------------------------------- '; cr.

reservasPorDia isEmpty
    ifTrue: [Transcript show: 'No hay reservas para esa fecha.'; cr]
    ifFalse: [reservasPorDia do: [:r | Transcript show: r printString; cr]].

