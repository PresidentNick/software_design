/* This code produces inheritance relationships from .vpl.pl and .schema.pl files */

isClass(I,N):-violetClass(I,N,_,_,_,_).

subClass(Sub,Sup):-violetAssociation(_,_,'TRIANGLE',_,_,_,_,_,Sup,Sub),isClass(Sup,_),isClass(Sub,_).
subClass(Sub,Sup):-violetAssociation(_,_,_,_,_,'TRIANGLE',_,_,Sub,Sup),isClass(Sup,_),isClass(Sub,_).

len(T,C):-table(T,L),length(L,C).

argList(0).
argList(1):-write('A'),write(1).
argList(C):-N is C-1,argList(N),write(','),write('A'),write(C).

blankList(0).
blankList(1):-write(','),write('_').
blankList(C):-N is C-1,blankList(N),write(','),write('_').

inher(SubName,SupName):-subClass(Sub,Sup),violetClass(Sub,SubName,_,_,_,_),violetClass(Sup,SupName,_,_,_,_).

%--------------------

marquee:-writeln(''),writeln(''),writeln('% inheritance relationships'), writeln('').

printInher(SubName,SupName):-header(SupName,C1), footer(SubName,C1).

footer(SubName,C1):-write(SubName),write('('),argList(C1),len(SubName,C2),N is C2-C1,blankList(N),writeln(').').

header(SupName,C1):-write(SupName),write('I('),len(SupName,C1),argList(C1),write('):-').

run:-marquee,forall(inher(SubName,SupName),printInher(SubName,SupName)).
