%trabajaEn(Persona, Departamento)
trabajaEn(kyle, ventas).
trabajaEn(trisha, ventas).
trabajaEn(joshua, ventas).
trabajaEn(ian, logistica).
trabajaEn(sherri, logistica).

%empleo(Persona, TipoEmpleo, Sueldo)
empleo(kyle, asalariado(6), 50).
empleo(sherri, asalariado(7) , 60).
empleo(gus, asalariado(8), 60).
empleo(ian, jefe([kyle, rob, ginger]), 40).
empleo(trisha, jefe([ian, gus]), 90).
empleo(joshua, independiente(arquitecto), 55).


paganini(Departamento):-departamento(Departamento), 
        forall(trabajaEn(Persona, Departamento), ganaBien(Persona)).


departamento(Departamento):-trabajaEn(_, Departamento). 

ganaBien(Persona):-empleo(Persona, TipoEmpleo, Sueldo), cumpleCondicionGanaBien(TipoEmpleo, Sueldo). 

cumpleCondicionGanaBien(asalariado(Horas), Sueldo):-sueldoPromedio(Horas, Promedio),  Sueldo > Promedio.
cumpleCondicionGanaBien(jefe(Subordinados), Sueldo):- length(Subordinados, Cant), Sueldo > 20 * Cant.
cumpleCondicionGanaBien(independiente(arquitecto), _).
cumpleCondicionGanaBien(independiente(_), Monto):- Monto > 70.

%sueldoPromedio(Horas, Monto)
sueldoPromedio(6, 45).
sueldoPromedio(7, 60).
sueldoPromedio(8, 80).


% Punto 3
%leGusta(Persona, Departamento)
leGusta(kyle, ventas).
leGusta(kyle, logistica).
leGusta(trisha, ventas).
leGusta(joshua, ventas).
leGusta(sherri, contabilidad).
leGusta(sherri, facturacion).
leGusta(sherri, cobranzas).

estaEnProblemas(Departamento):-departamento(Departamento), 
    not((trabajaEn(Persona, Departamento), leGusta(Persona, Departamento))).

%Punto 5
equipoPosible(Disponible, Equipo, Sobrante):- equipo(Equipo), length(Equipo, Cant), Cant >= 2, 
            costoEquipo(Equipo, Costo), Costo =< Disponible, Sobrante is Disponible - Costo.


equipo(Equipo):-findall(Persona, persona(Persona), ListaPersonas), subconjunto(ListaPersonas, Equipo).

persona(Persona):-empleo(Persona, _, _).

subconjunto([], []).
subconjunto([Persona|Personas], [Persona|Equipo]):-
        subconjunto(Personas, Equipo).
subconjunto([_|Personas], Equipo):-
        subconjunto(Personas, Equipo).    

costoEquipo(Equipo, Costo):-findall(Sueldo, (member(Persona, Equipo),empleo(Persona,_, Sueldo)), Sueldos), 
            sum_list(Sueldos, Costo).
                    