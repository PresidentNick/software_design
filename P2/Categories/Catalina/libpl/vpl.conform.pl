/* file vpl.conform.pl */

constraint1 :- isError("do something useful",null).
constraint2 :- isError("please write true constraints",null).

run:-constraint1,constraint2.
