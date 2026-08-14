%cree(Persona, Personaje)
cree(gabriel, campanita).
cree(gabriel, magoDeoz).
cree(gabriel, cavenaghi).
cree(juan, conejoDePascua).    
cree(macarena, reyesMagos).
cree(macarena, magoCapria).
cree(macarena, campanita).

%quiere(Persona, Suenio)
quiere(gabriel, loteria([5,8])).
quiere(gabriel, futbolista(arsenal)).
quiere(juan, cantante(100000)).
quiere(macarena, cantante(10000)).

%Punto 2
esAmbicioso(Persona):-persona(Persona), sumaTotalDificultades(Persona, Total), Total > 20.

persona(Persona):- quiere(Persona, _).
sumaTotalDificultades(Persona, Suma):-findall(Dificultad, dificultad(Persona, Dificultad),  Dificultades), sumlist(Dificultades, Suma).

dificultad(Persona, Dificultad):-quiere(Persona, Suenio), nivelDificultad(Suenio, Dificultad).

nivelDificultad(cantante(Discos), 6):- Discos > 500000.
nivelDificultad(cantante(Discos), 4):- Discos =< 500000.
nivelDificultad(loteria(Numeros), Dificultad):- length(Numeros, Cant), Dificultad is Cant * 10.
nivelDificultad(futbolista(Equipo), 3):- equipoChico(Equipo).
nivelDificultad(futbolista(Equipo), 16):- not(equipoChico(Equipo)).


equipoChico(arsenal).
equipoChico(aldosivi).

%Punto 3
tieneQuimica(Personaje, Persona):-cree(Persona, Personaje), cumpleCondicion(Persona, Personaje).

cumpleCondicion(Persona, campanita):-dificultad(Persona, Dificultad), Dificultad < 5.
cumpleCondicion(Persona, Personaje):- Personaje \= campanita, todosLosSueniosPuros(Persona), not(esAmbicioso(Persona)).

todosLosSueniosPuros(Persona):-forall(quiere(Persona, Quiere), esPuro(Quiere)).

esPuro(futbolista(_)).
esPuro(cantante(Discos)):- Discos < 200000.

%Punto 4
puedeAlegrar(Personaje, Persona):- quiere(Persona, _), tieneQuimica(Personaje, Persona),  
                   cumpleCondicionesParaAlegrar(Personaje).


estaEnfermo(campanita).
estaEnfermo(conejoDePascua).
estaEnfermo(reyesMagos).

esAmigo(campanita, reyesMagos).
esAmigo(campanita, conejoDePascua).
esAmigo(conejoDePascua, cavenaghi).

cumpleCondicionesParaAlegrar(Personaje):-not(estaEnfermo(Personaje)).
cumpleCondicionesParaAlegrar(Personaje):- backup(Personaje, Backup), cumpleCondicionesParaAlegrar(Backup).


backup(Personaje, OtroPersonaje):- esAmigo(Personaje, OtroPersonaje).
backup(Personaje, OtroPersonaje):- esAmigo(Personaje, Backup), backup(Backup, OtroPersonaje).