piloto('Lamb').
piloto('Besenyei').
piloto('Chambliss').
piloto('MacLean').
piloto('Mangold').
piloto('Jones').
piloto('Bonhomme').

equipa('Lamb','Breitling').
equipa('Besenyei','Red Bull').
equipa('Chambliss','Red Bull').
equipa('MacLean','Mediterranean Racing Team').
equipa('Mangold','Cobra').
equipa('Jones','Matador').
equipa('Bonhomme','Matador').

aviao('Lamb','MX2').
aviao('Besenyei','Edge540').
aviao('Chambliss','Edge540').
aviao('MacLean','Edge540').
aviao('Mangold','Edge540').
aviao('Jones','Edge540').
aviao('Bonhomme','Edge540').

circuitos('Istanbul').
circuitos('Budapeste').
circuitos('Porto').

gates('Istanbul',9).
gates('Budapeste',6).
gates('Porto',5).

vencedor('Jones','Porto').
vencedor('Mangold','Budapeste').
vencedor('Mangold','Istanbul').

equipaVencedora('Jones','Matador').
equipaVencedora('Mangold','Cobra').

% b)
equipaVencedoraCidade(Equipa, Local):-
        vencedor(Piloto, Local),
        equipa(Piloto, Equipa).

/* 
*************
* RESPOSTAS *
*************
2. a) Qual a equipa que venceu no Porto?
      | ?- vencedor(X,'Porto').
        Y = 'Jones' ? ;
        no

   b) Qual a equipa que venceu no Porto?
      | ?- equipaVencedoraCidade(Equipa, 'Porto').
        Equipa = 'Matador' ? 
        yes
*/