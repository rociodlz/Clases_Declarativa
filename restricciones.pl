% Resolver el orden de una carrera.
carrera(Orden) :-
    %Generar posibles ordenes
    permutation([ana,luis,pedro],Orden),
    %Separar las posiciones
    Orden = [Primero,Segundo,Tercero],
    %Ana no puede ser primera
    Primero \=  ana,
    %Pedro debe ser segundo
    Segundo = pedro.
%Comprobar si dos personas son pareja.
son_pareja(X,Y, Parejas) :-
    member([X,Y], Parejas).
son_pareja(X,Y,Parejas) :-
    member([Y,X], Parejas).
%Averiguar el transporte de una persona
parejas([
    [ana,luis,automovil],
    [pedro,maria,avion],
    [carlos,juan,bus]
]).
% Caso 1: La persona aparece primero
transporte(Persona, Medio) :-
    parejas(Lista),
    member([Persona,_,Medio], Lista).

% Caso 2: La persona aparece segundo
transporte(Persona, Medio) :-
    parejas(Lista),
    member([_,Persona,Medio], Lista).
%asientos orden
asientos(Orden) :-
    permutation([ana,luis,pedro],Orden),
    Orden = [Primero,Segundo,_Tercero],
    Primero \= ana,
    Segundo = luis.

parejas_validas(Parejas) :-
    son_pareja(ana, luis, Parejas),
    \+ son_pareja(pedro, ana, Parejas).

generar_parejas(Parejas) :-
    permutation([ana,luis,pedro,maria], Orden),
    Orden = [A,B,C,D],
    Parejas = [[A,B],[C,D]].

viajes(Viajes) :-
    permutation([ana,luis,pedro,maria], [A,B,C,D]),
    permutation([automovil,avion], [T1,T2]),
    Viajes = [[A,B,T1],[C,D,T2]].
