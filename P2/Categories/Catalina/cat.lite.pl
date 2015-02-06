:- discontiguous table/2.

%dbase(catdb,[arrowtype,path,domain,arrow,atp]).

%table(arrowtype,[id,"name",type,"exe"]).
arrowtype(at0,'parse',java,'CatLite.categoryVioletParser.Main').
arrowtype(at1,'class2vpl',java,'CatLite.classVioletParser.Main').
arrowtype(at2,'vpl2schema',vm,'vpl2schema.vm').
arrowtype(at3,'inherit',pl,'inherit.pl').
arrowtype(at4,'merge',java,'CatCore.Merge').
arrowtype(at5,'construct',java,'CatLite.Construct').

%table(path,["path"]).
path('makeSchema = vpl2schema.inherit.merge;').



%table(domain,["id","name","ext",x,y]).
domain('StateNode0','state','violet',81.0,384.0).
domain('StateNode1','lite','pl',351.0,390.0).
domain('StateNode2','class','violet',80.0,250.0).
domain('StateNode3','schemaNIR','pl',550.0,261.0).
domain('StateNode4','vpl','pl',296.0,250.0).
domain('StateNode5','vpl*schemaNIR','null',90.0,130.0).
domain('StateNode6','inherit','pl',317.0,130.0).
domain('StateNode7','schemaNIR*inherit','null',465.0,119.0).
domain('StateNode8','schema','pl',719.0,117.0).
domain('StateNode9','metamodel','mm',594.0,395.0).

%table(arrow,[id,"name","startId","endId"]).
arrow(id1,'parse','StateNode0','StateNode1').
arrow(id2,'vpl2schema','StateNode4','StateNode3').
arrow(id3,'class2vpl','StateNode2','StateNode4').
arrow(id4,'inherit','StateNode5','StateNode6').
arrow(id5,'merge','StateNode7','StateNode8').
arrow(id6,'construct','StateNode1','StateNode9').

%table(atp,[aid,io,"domain"]).
atp(id1,o,'StateNode1').
atp(id1,i,'StateNode0').
atp(id2,o,'StateNode3').
atp(id2,i,'StateNode4').
atp(id3,o,'StateNode4').
atp(id3,i,'StateNode2').
atp(id4,o,'StateNode6').
atp(id4,i,'StateNode5').
atp(id5,o,'StateNode8').
atp(id5,i,'StateNode7').
atp(id6,o,'StateNode9').
atp(id6,i,'StateNode1').

