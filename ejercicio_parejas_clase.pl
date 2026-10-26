generar_parejas(Viajes) :-
    permutation(
        [alejandro,andres,dario,tomas,benito,carlos],
        [A,B,C,D,E,F]
    ),
    permutation(
        [automovil,avion,bus],
        [T1,T2,T3]
    ),
    Viajes = [[A,B,T1],[C,D,T2],[E,F,T3]].
son_pareja(X,Y,Parejas) :-
    member([X,Y],Parejas).
son_pareja(X,Y,Parejas) :-
    member([Y,X],Parejas).
companeros(X,Y,Viajes) :-
    member([X,Y,_],Viajes).
companeros(X,Y,Viajes) :-
    member([Y,X,_],Viajes).
usa_transporte(Persona,Medio,Viajes) :-
    member([Persona,_,Medio],Viajes).
usa_transporte(Persona,Medio,Viajes) :-
    member([_,Persona,Medio],Viajes).
resolver_amigos(Viajes) :-
    generar_parejas(Viajes),
    companeros(alejandro,benito,Viajes),
    \+ usa_transporte(alejandro,automovil,Viajes),
    \+ usa_transporte(benito,avion,Viajes),
    usa_transporte(andres,avion,Viajes),
    \+ companeros(carlos,dario,Viajes),
    \+ usa_transporte(carlos,avion,Viajes).


