/* file lite.conform.pl */

/* uniqueName CONSTRAINT -- all domains, arrows have to have unique names */

name(arrow,N):-arrow(_,N,_,_).
name(domain,N):-domain(N,_,_,_,_).

findPair(I1,I2,N):-name(I1,N),name(I2,N),@I1 @< @I2.
uniqueNames:-forall(findPair(_,_,N),isError('domains and arrows must have unique name: ',N)).

/* correspondence CONSTRAINT each arrow and arrow type must be in 1-1 correspondence */
findNoArrowTypeMatch(N):-arrow(_,N,_,_),not(arrowtype(_,N,_,_)).
findNoArrowMatch(N):-arrowtype(_,N,_,_),not(arrow(_,N,_,_)).
correspondence:-forall(findNoArrowTypeMatch(N),isError('arrow not matched with arrowtype ',N)).
correspondence:-forall(findNoArrowMatch(N),isError('arrowtype not matched with arrow ',N)).

/* type CONSTRAINT: arrow types are currently limited to java, vm, pl. */

types(java).
types(vm).
types(pl).
types(path).
findBadType(T):-arrowtype(_,_,T,_),not(types(T)).
type:-forall(findBadType(T),isError('unrecognizable arrow type ',T)).

/* exe CONSTRAINT: there can be no empty exe values for prolog files in arrowtype table */
findBadExe(I):-arrowtype(I,_,pl,'').
exe:-forall(findBadExe(I),isError('empty exe type in arrowtype table row ',I)).

/* Constraint: no isolated domains */
noArrow(I):-not(arrow(_,_,I,_)),not(arrow(_,_,_,I)).
isIsolated(D):-domain(I,D,_,_,_),noArrow(I).
isolated:-forall(isIsolated(D),isError('isolated domain: no arrows connect domain ',D)).

/* Constraint -- all arrows should connect domains, not something else. */
notDomain(D):-not(domain(D,_,_,_,_)).
strangeArrow(N):-arrow(_,N,S,E),(notDomain(S);notDomain(E)).
%strangeArrow(N):-arrow(_,N,_,E),notDomain(E).

idiotArrow:-forall(strangeArrow(N),isError('arrows should only connect domains -- look at arrow ',N)).

/* Constraint -- all PL arrows must have PL input and output domains */

atpCheck(A):-atp(A,_,D),arrowtype(_,A,'pl',_),not(domain(_,D,'pl',_,_)).
atpError:-forall(atpCheck(N),isError('all domains must be of type PL for arrow ',N)).

/* constraint -- all VM arrows must have PL domain inputs */
vmCheck(N):-arrowtype(I,N,'vm',_),atp(I,i,D),not(domain(_,D,'pl',_,_)).
vmError:-forall(vmCheck(N),isError('VM arrows must have PL input domains ',N)).

/* ALL CONSTRAINTS */

run:-uniqueNames,correspondence,type,exe,isolated,idiotArrow,atpError,vmError.
