
%Punto 5
seVaA(dodain, pehuenia).
seVaA(dodain, sanMartin).
seVaA(dodain, esquel).
seVaA(dodain, sarmiento).
seVaA(dodain, camarones).
seVaA(dodain, playasDoradas).
seVaA(alf, bariloche).
seVaA(alf, sanMartin).
seVaA(alf, elBolson).
seVaA(nico, marDelPlata).
seVaA(vale, calafate).
seVaA(vale, elBolson).
seVaA(martu, Lugar):-seVaA(nico, Lugar).
seVaA(martu, Lugar):-seVaA(alf, Lugar).

itinerariosPosibles(Persona, Lugares):- persona(Persona), 
        findall(Lugar, seVaA(Persona, Lugar), Lista), 
        permutacion(Lista, Lugares).

permutacion([], []).
permutacion(Lista, [Elem | RestoLista]):-
    eliminar(Elem, Lista, Resto), 
    permutacion(Resto, RestoLista).

eliminar(Elem, [Elem| Resto], Resto).
eliminar(Elem, [OtroElem| Lista], [OtroElem| Resto]):-
    eliminar(Elem, Lista, Resto). 


persona(Persona):- seVaA(Persona, _).    