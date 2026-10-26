% Ejercicio 1 de arboles binarios
% CASO 1: El árbol está vacío
buscarABB(Dato, []):-
    write('El dato: '),
    write(Dato),
    write(', NO se encuentra en el arbol'),
    !.

% CASO 2: Encontramos el número
buscarABB(Dato, [_, Dato, _]):-
    write('Se ha ENCONTRADO el dato: '),
    write(Dato),
    !.

% CASO 3: Buscar en el subárbol izquierdo
buscarABB(Dato, [SubAI, DatoN, _]):-
    <(Dato, DatoN),
    buscarABB(Dato, SubAI),
    !.

% CASO 4: Buscar en el subárbol derecho
buscarABB(Dato, [_, DatoN, SubAD]):-
    >(Dato, DatoN),
    buscarABB(Dato, SubAD).

% ============================================================
% EJERCICIO 2: CALCULAR LA ALTURA DE UN ARBOL BINARIO
% ============================================================

% Caso base: un arbol vacio tiene altura 0.

altura([], 0):- !.

% Caso recursivo: calcular la altura de ambos subarboles.
% La altura es 1 + la mayor altura entre izquierda y derecha.

altura([SubAI, _, SubAD], H):-
    altura(SubAI, HI),
    altura(SubAD, HD),
    H is 1 + max(HI, HD).


% ============================================================
% EJERCICIO 3: CONTAR LA CANTIDAD DE NODOS DE UN ARBOL
% ============================================================

% Caso base: un arbol vacio tiene 0 nodos.

contarNodos([], 0).

% Caso recursivo: contar los nodos de ambos subarboles.
% Sumamos 1 por el nodo actual.

contarNodos([SubAI, _, SubAD], Total):-
    contarNodos(SubAI, CI),
    contarNodos(SubAD, CD),
    Total is 1 + CI + CD.


% ============================================================
% EJERCICIO 4: CONTAR ELEMENTOS MENORES O IGUALES A UN NUMERO
% ============================================================

% Caso base: un arbol vacio contiene 0 elementos.

contarMenoresIguales([], _, 0).

% Caso 1: el nodo actual es menor o igual que N.
% Contamos el nodo actual y continuamos con ambos subarboles.

contarMenoresIguales([SubAI, Dato, SubAD], N, Total):-
    Dato =< N,
    contarMenoresIguales(SubAI, N, CI),
    contarMenoresIguales(SubAD, N, CD),
    Total is 1 + CI + CD.

% Caso 2: el nodo actual es mayor que N.
% No contamos el nodo actual, pero revisamos ambos subarboles.

contarMenoresIguales([SubAI, Dato, SubAD], N, Total):-
    Dato > N,
    contarMenoresIguales(SubAI, N, CI),
    contarMenoresIguales(SubAD, N, CD),
    Total is CI + CD.


% ============================================================
% EJERCICIO 5: RETORNAR UNA LISTA CON DOS CANTIDADES
%
% Primer elemento: cantidad de nodos menores o iguales a N.
% Segundo elemento: cantidad de nodos mayores que N.
% ============================================================

% Caso base: un arbol vacio tiene 0 elementos de ambos tipos.

contarClasificados([], _, [0, 0]).

% Caso 1: el dato actual es menor o igual que N.
% Se suma 1 al contador de menores o iguales.

contarClasificados([SubAI, Dato, SubAD], N, [MenoresIguales, Mayores]):-
    Dato =< N,
    contarClasificados(SubAI, N, [MI, MAI]),
    contarClasificados(SubAD, N, [MD, MAD]),
    MenoresIguales is 1 + MI + MD,
    Mayores is MAI + MAD.

% Caso 2: el dato actual es mayor que N.
% Se suma 1 al contador de mayores.

contarClasificados([SubAI, Dato, SubAD], N, [MenoresIguales, Mayores]):-
    Dato > N,
    contarClasificados(SubAI, N, [MI, MAI]),
    contarClasificados(SubAD, N, [MD, MAD]),
    MenoresIguales is MI + MD,
    Mayores is 1 + MAI + MAD.


% ============================================================
% ARBOL DE EJEMPLO PARA PROBAR LOS EJERCICIOS
% ============================================================

%              5
%            /   \
%           3     9
%          / \     \
%         1   4     11

arbolEjemplo([
    [
        [[], 1, []],
        3,
        [[], 4, []]
    ],
    5,
    [
        [],
        9,
        [[], 11, []]
    ]
]).
