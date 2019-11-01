cub(1,1,vermell).
cub(1,2,groc).
cub(1,3,verd).
cub(1,4,groc).
cub(1,5,groc).
cub(1,6,blau).

cub(2,1,verd).
cub(2,2,vermell).
cub(2,3,vermell).
cub(2,4,blau).
cub(2,5,verd).
cub(2,6,groc).

cub(3,1,blau).
cub(3,2,blau).
cub(3,3,verd).
cub(3,4,vermell).
cub(3,5,verd).
cub(3,6,groc).

cub(4,1,verd).
cub(4,2,blau).
cub(4,3,vermell).
cub(4,4,groc).
cub(4,5,groc).
cub(4,6,vermell).

permuta([1, 2, 3, 4, 1, 2, 3]).
permuta([4, 3, 2, 1, 4, 3, 2]).
permuta([2, 5, 4, 6, 2, 5, 4]).
permuta([6, 4, 5, 2, 6, 4, 5]).
permuta([1, 5, 3, 6, 1, 5, 3]).
permuta([6, 3, 4, 1, 6, 3, 4]).

treucolor(_,[],[]).
treucolor(Cub,[Cara|L],[Color|L1]) :- cub(Cub,Cara,Color),treucolor(Cub,L,L1).

escriu([X]):-write(X),!.
escriu([X|L]):-write(X),escriu(L).

sele4([X,Y,Z,W|_],[X,Y,Z,W]).				
sele4([_|L],[A,B,C,D]):- sele4(L,[A,B,C,D]).

compara(_, _,[],[]).
compara(X,Y,[Z|LX],[W|LY]):- cub(X,Z,ColA),cub(Y,W,ColB),X\=Y,ColA\=ColB,compara(X,Y,LX,LY).

solucio :-   permuta(X),sele4(X,Cub1),
			 permuta(Y),sele4(Y,Cub2),
			 compara(A,B,Cub1,Cub2),
			 permuta(Z),sele4(Z,cub3),
			 compara(C,A,Cub3,Cub1),
			 compara(C,B,Cub3,Cub2),
			 permuta(W),sele4(W,Cub4),
			 compara(W,A,Cub4,Cub1),
			 compara(W,B,Cub4,Cub2),
			 compara(W,C,Cub4,Cub3),

			 treucolor(X,Cub1,Colors1),
			 treucolor(Y,Cub2,Colors2),
			 treucolor(Z,Cub3,Colors3),
			 treucolor(W,Cub4,Colors4),

			 write("Cub numero "),write(X),escriu(Colors1),write(", "),
			 write("Cub numero "),write(Y),escriu(Colors2),write(", "),
			 write("Cub numero "),write(Z),escriu(Colors3),write(", "),
			 write("Cub numero "),write(W),escriu(Colors4),write(", "),
			 nl(),
			 solucions(sol), cont is sol + 1,
			 retract(solucions(_)),asserta(solucions(cont)),
			 fail.

cubes :- asserta(solucions(0)),solucio.
cubes :- solucions(X), nl(), write("Solucions trobades:"),write(X).













