dbase(catdb,[arrowtype,path,domain,arrow,atp]).

table(arrowtype,[id,"name",type,"exe"]).
table(path,["path"]).
table(domain,["id","name","ext",x,y]).
table(arrow,[id,"name","startId","endId"]).
table(atp,[arrowid,io,"domainName"]).

tuple(arrowtype,L):-arrowtype(A,B,C,D),L=[A,B,C,D].
tuple(path,L):-path(A),L=[A].
tuple(domain,L):-domain(A,B,C,D),L=[A,B,C,D].
tuple(arrow,L):--arrow(A,B,C,D),L=[A,B,C,D].
tuple(atp,L):--atp(A,B,C),L=[A,B,C].
