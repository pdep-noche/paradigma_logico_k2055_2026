
habla(juan, espaniol).
habla(juan, ingles).
habla(juan, italiano).
habla(marcela, espaniol).
habla(hernan, aleman).

seComunican(Persona, OtraPersona):- habla(Persona, Idioma), habla(OtraPersona, Idioma), Persona\= OtraPersona.

contador(roque).
joven(roque).
trabajoEn(roque,acme).
trabajoEn(joaquin, acme).
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



genero(titanic,drama).
genero(gilbertGrape,drama).
genero(atrapameSiPuedes,comedia).
genero(ironMan,accion).
genero(rapidoYFurioso,accion).
genero(elProfesional,drama).

gusta(belen,titanic).
gusta(belen,gilbertGrape).
gusta(belen,elProfesional).
gusta(juan, ironMan).
gusta(pedro, atrapameSiPuedes).
gusta(pedro, rapidoYFurioso).


soloLeGustaPeliculaDeGenero(Persona, Genero):-persona(Persona), generoPelicula(Genero), 
    forall(gusta(Persona, Pelicula), genero(Pelicula, Genero)).

persona(Persona):-gusta(Persona, _).
generoPelicula(Genero):- genero(_, Genero).