| club usuario1 usuario2 usuario3 usuariosOrdenados |

club := Club crearClubnom: 'Pelota libre' dir: 'Av. Calchaquí 6200' tel: '11 1234-5678' email: 'pelotalibre@gmail.com'.

usuario1 := Usuario crearUsuariodni: 44966179 nombre: 'Fernando' apellido: 'Alonso' NroUsuario: 1 Email: 'emailFernando' Telefono: 111111111.
usuario2 := Usuario crearUsuariodni: 44866179 nombre: 'Lando' apellido: 'Norris' NroUsuario: 2 Email: 'emailLando' Telefono: 2222222222.
usuario3 := Usuario crearUsuariodni: 44766179 nombre: 'Charles' apellido: 'Leclerc' NroUsuario: 3 Email: 'emailCharles' Telefono: 3333333333.

club agregarUsuario: usuario1.
club agregarUsuario: usuario2.
club agregarUsuario: usuario3.


"colección que se ordena sola."
usuariosOrdenados := SortedCollection new.
"criterio de ordenamiento: por apellido."
usuariosOrdenados sortBlock: [:a :b | a verApellido <= b verApellido].
"Agregamos todos los usuarios"
usuariosOrdenados addAll: (club verTodosLosUsuarios).

Transcript clear.

usuariosOrdenados do: [ :i |
    Transcript show: 'Dni: ', i verDni printString; cr.
    Transcript show: 'Nombre: ', i verNombre printString; cr.
    Transcript show: 'Apellido: ', i verApellido printString; cr.
    Transcript show: 'NroUsuario: ', i verNroUsuario printString; cr.
    Transcript show: 'Email: ', i verEmail printString; cr.
    Transcript show: 'Teléfono: ', i verTelefono printString; cr.
    Transcript show: '-----------------------------------'; cr; cr.
].