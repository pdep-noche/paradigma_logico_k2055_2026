contador(roque).
joven(roque).
trabajoEn(roque,acme).
trabajoEn(joaquin, acme).
trabajoEn(juana, acme).
trabajoEn(ana,omni).
trabajoEn(lucia,omni).
honesto(roque).
ingeniero(ana).
ingeniero(joaquin).
habla(roque,frances).
habla(ana,ingles).
habla(ana,frances).
habla(lucia,ingles).
habla(lucia,frances).
habla(cecilia,frances).
abogado(cecilia).
ambicioso(cecilia).
ambicioso(juana).
ambicioso(Persona):-contador(Persona), joven(Persona).
tieneExperiencia(Persona):-trabajoEn(Persona, _).
esProfesional(Persona):-abogado(Persona).
esProfesional(Persona):-contador(Persona).
esProfesional(Persona):-ingeniero(Persona).
puedeAndar(comercioExterior, Persona):-ambicioso(Persona).
puedeAndar(contaduria, Persona):- contador(Persona), honesto(Persona).
puedeAndar(ventas, Persona):-ambicioso(Persona), tieneExperiencia(Persona).
puedeAndar(ventas, lucia).
puedeAndar(proyectos, Persona):- ingeniero(Persona), tieneExperiencia(Persona).
puedeAndar(proyectos, Persona):- abogado(Persona), joven(Persona).
puedeAndar(logistica, Persona):-esProfesional(Persona), cumpleCondicion(Persona).

cumpleCondicion(Persona):-joven(Persona).
cumpleCondicion(Persona):- trabajoEn(Persona, omni). 




madre(mona, homero).
madre(jaqueline, marge).
madre(marge, maggie).
madre(marge, bart).
madre(marge, lisa).
padre(abraham, herbert).
padre(abraham, homero).
padre(clancy, jaqueline).
padre(homero, maggie).
padre(homero, bart).
padre(homero, lisa).


hermano(Persona, OtraPersona):- mismaMadre(Persona, OtraPersona), mismoPadre(Persona, OtraPersona).


mismaMadre(Persona, OtraPersona):- madre(Madre, Persona), madre(Madre, OtraPersona), Persona\= OtraPersona.

mismoPadre(Persona, OtraPersona):- padre(Padre, Persona), padre(Padre, OtraPersona), Persona \= OtraPersona. 

medioHermano(Persona, OtraPersona):- mismoPadre(Persona, OtraPersona), not(mismaMadre(Persona, OtraPersona)).
medioHermano(Persona, OtraPersona):- mismaMadre(Persona, OtraPersona), not(mismoPadre(Persona, OtraPersona)).