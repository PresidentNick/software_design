:- style_check(-discontiguous).

%table(violetClass,[id,"name","fields","methods",superid,x,y]).
violetClass('classnode0','ClassA','','','classnode1',465,171).
violetClass('classnode1','ClassB','','','',764,169).

%table(violetInterface,[id,"name","methods",x,y]).
:- dynamic violetInterface/5.

%table(violetAssociation,[cid1,"role1",arrow1,type1,cid2,"role2",arrow2,type2,lineStyle]).
violetAssociation('classnode0','abc','BLACK_DIAMOND','classnode','classnode1','def','TRIANGLE','classnode','DOTTED').

%table(violetInterfaceExtends,[id,idx]).
:- dynamic violetInterfaceExtends/2.

%table(violetClassImplements,[cid,iid]).
:- dynamic violetClassImplements/2.
