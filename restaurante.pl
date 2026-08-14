%viveEn(rata, lugar).
viveEn(remy, gusteaus).
viveEn(emile, chezMillerBar).
viveEn(django, pizzeriaJeSuis).

%sabeCocinar(cocinero, plato, experiencia)
sabeCocinar(linguini, ratatoullie, 3).
sabeCocinar(linguini, sopa, 5) .
sabeCocinar(colette, salmonAsado, 9).
sabeCocinar(horst, ensaladaRusa, 8).

%trabajaEn(cocinero, lugar)
trabajaEn(linguini, gusteaus).
trabajaEn(colette, gusteaus).
trabajaEn(horst, gusteaus).
trabajaEn(skinner, gusteaus).
trabajaEn(amelie, cafeDes2Moulins).

%Punto 1
estaEnElMenu(Plato, Restaurante):- trabajaEn(Cocinero, Restaurante),
                    sabeCocinar(Cocinero, Plato, _).


%Punto 2
cocinaBien(Persona, Plato):-sabeCocinar(Persona, Plato, Experiencia), Experiencia >7.
cocinaBien(Persona, Plato):- sabeCocinar(Persona, Plato, _), tieneTutor(Persona, Tutor), 
                            cocinaBien(Tutor, Plato).
cocinaBien(remy, Plato):- sabeCocinar(_, Plato, _).                        

tieneTutor(linguini, Rata):- viveEn(Rata, Lugar), trabajaEn(linguini, Lugar).
tieneTutor(skinner, amelie).  


%Punto 3
esChef(Cocinero, Restaurante):-trabajaEn(Cocinero, Restaurante), cumpleCondicionesChef(Cocinero, Restaurante).

cumpleCondicionesChef(Cocinero, Restaurante):-
        forall(estaEnElMenu(Plato, Restaurante), cocinaBien(Cocinero, Plato)).
cumpleCondicionesChef(Cocinero, _):-experienciaTotal(Cocinero, Total), Total > 20.

experienciaTotal(Cocinero, Total):-  findall(Experiencia, sabeCocinar(Cocinero, _, Experiencia), Lista), 
        sumlist(Lista, Total).

