%schema of classVioletParser output

dbase(vpl,[violetMiddleLabels,violetAssociation,violetInterface,violetClass]).

table(violetClass,[id,"name","fields","methods",x,y]).
table(violetInterface,[id,"name","methods",x,y]).
table(violetAssociation,[id,"role1","arrow1",type1,"role2","arrow2",type2,"lineStyle",cid1,cid2]).
table(violetMiddleLabels,[id,cid1,cid2,"label"]).

tuple(violetClass,L):-violetClass(A,B,C,D,E,F),L=[A,B,C,D,E,F].
tuple(violetInterface,L):-violetInterface(A,B,C,D,E),L=[A,B,C,D,E].
tuple(violetAssociation,L):-violetAssociation(A,B,C,D,E,F,G,H,I,J),L=[A,B,C,D,E,F,G,H,I,J].
tuple(violetMiddleLabels,L):-violetMiddleLabels(A,B,C,D),L=[A,B,C,D].

