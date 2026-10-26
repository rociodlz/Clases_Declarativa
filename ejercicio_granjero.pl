% Cambiar de una orilla a otra
cambiar_orilla(i,d).
cambiar_orilla(d,i).
% El granjero cruza solo
mover([G,Z,C,Gr], [G2,Z,C,Gr]) :-
    cambiar_orilla(G,G2).
% El granjero cruza llevando a la gallina
mover([G,Z,Gallina,Gr], [G2,Z,Gallina2,Gr]) :-
    G = Gallina,
    cambiar_orilla(G,G2),
    cambiar_orilla(Gallina,Gallina2).
% El granjero cruza con el zorro
mover([G,Z,C,Gr], [G2,Z2,C,Gr]) :-
    G = Z,
    cambiar_orilla(G,G2),
    cambiar_orilla(Z,Z2).
% El granjero cruza con el grano
mover([G,Z,C,Gr], [G2,Z,C,Gr2]) :-
    G = Gr,
    cambiar_orilla(G,G2),
    cambiar_orilla(Gr,Gr2).
% El zorro se come a la gallina
peligroso([G,Z,C,_]) :-
    Z = C,
    G \= Z.
% La gallina se come el grano
peligroso([G,_,C,Gr]) :-
    C = Gr,
    G \= C.
seguro(Estado) :-
    \+ peligroso(Estado).
% Generar un movimiento que no deje a nadie en peligro
movimiento_seguro(Actual, Nuevo) :-
    mover(Actual, Nuevo),
    seguro(Nuevo).
% Comprobar que un estado no haya sido visitado
no_visitado(Estado, Visitados) :-
    \+ member(Estado, Visitados).
% Caso base: todos llegaron a la derecha
buscar([d,d,d,d], _, [[d,d,d,d]]).

% Caso recursivo: continuar buscando movimientos
buscar(Actual, Visitados, [Actual|Resto]) :-
    movimiento_seguro(Actual, Nuevo),
    no_visitado(Nuevo, Visitados),
    buscar(Nuevo, [Nuevo|Visitados], Resto).

% Resolver el problema desde el estado inicial
resolver(Camino) :-
    buscar([i,i,i,i], [[i,i,i,i]], Camino).
