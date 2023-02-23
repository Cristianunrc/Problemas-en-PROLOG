/*Compilacion: Entrar al interprete de PROLOG --> gprolog 
               Compilar de la forma --> [nombreArchivo].
	       Ejecutar alguna relacion --> max(3,4,4). */

/* Dice si X pertenece a una lista L */

pertenence(X, [X|_]).
pertenece(X, [_|L1]) :- pertenece(X,L1).

/* Devuelve la longitud n de una lista L*/

longitud([], 0).
longitud([_|L1], N) :- longitud(L1, M), N is M+1.


/* multiplicaLista donde a cada elemento de la lista la multiplica por un 
elemento */

multiplicaLista([], F, []).
multiplicaLista([X|L1], F, [Z|L2]) :- multiplicaLista(L1, F, L2), 
					Z is X*F.

/* Consultas: ?- mujer(juan).
	      ?- mujer(X).
	      ?- not(not(hombre(X))) */
hombre(pedro).
hombre(juan).
mujer(X) :- not(hombre(X)).


/* dado el siguiente programa, la idea es realizar consultas y ver los 
resultados */

es_padre(terach, abraham).
es_padre(terach, nachor).
es_padre(terach, haran).
es_padre(abraham, isaac).
es_padre(haran, lot).
es_padre(haran, milcah).
es_padre(haran, yiscah).
es_madre(sarah, isaac).
es_hombre(terach).
es_hombre(abraham).
es_hombre(nachor).
es_hombre(haran).
es_hombre(isaac).
es_hombre(lot).
es_mujer(sarah).
es_mujer(milcah).
es_mujer(yiscah).
es_hijo(X, Y) :- es_padre(Y, X), es_hombre(X).
es_hija(X, Y) :- es_padre(Y, X), es_mujer(X).
es_abuelo(X, Z) :- es_padre( X, Y), es_padre(Y, Z).


/* programa sobre un restaurante con entrada, plato principal y postre */
/* Consulta: ?- comida(paella, P, flan). */
entrada(paella).
entrada(gazpacho).
carne(filete_cerdo).
carne(pollo_asado).
pescado(trucha).
pescado(pejerrey).
postre(flan).
postre(naranja).
plato_principal(X) :- carne(X).
plato_principal(X) :- pescado(X).
comida(X, Y, Z) :- entrada(X), plato_principal(Y), postre(Z).


/* relacion comprime lista que dada una lista de valores repetidos,
   elimina los valores repetidos consecutivos */

comprimida([], []).
comprimida([X], [X]).
comprimida([X,X|L1], L2) :- comprimida([X,L1], L2).
comprimida([X,Y|L1], [X|L2]) :- X\=Y, comprimida([Y|L1], L2).


/* borrar(listaConX, X, listaSinX) donde la listaSinX es la listaConX pero 
   con los elementos borrados X */

borrar([], _, []).
borrar([X|L1], X, L2) :- borrar(L1, X, L2).
borrar([Y|L1], X, [Y|L2]) :- borrar(L1, X, L2), X\=Y.

/* Union de dos listas, union(L1,L2,L3) donde L3 es la lista de la union
  entre L1 y L2 */

union([], [], []).
union([], L2, L2).
union(L1, [], L1).
union([X|L1], L2, L3) :- pertence(X, L2), !, union(L1, L2, L3).
union([X|L1], L2, [X|L3]) :- union(L1, L2, L3).

/* maximo de entre dos elementos */

max(X, Y, X) :- X>=Y.
max(X, Y, Y) :- X<Y.


/* el maximo elemento de una lista */

maxList([X], X).
maxList([X1,X2|L1], Z) :- maxList([X3|L1], Z), X3 is max(X1, X2).
