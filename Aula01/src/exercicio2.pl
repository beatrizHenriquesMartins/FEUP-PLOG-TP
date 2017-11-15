/* Lamb, Besenyei, Chambliss, MacLean, Mangold, Jones e Bonhomme 
são pilotos */
piloto('Lamb').
piloto('Besenyei').
piloto('Chambliss').
piloto('MacLean').
piloto('Mangold').
piloto('Jones').
piloto('Bonhomme').

/* Lamb é da equipa Breitling, Besenyei e Chambliss da Red Bull,
MacLean da Mediterranean Racing Team, Mangold da Cobra, Jones e 
Bonhomme da Matador */
equipa('Lamb','Breitling').
equipa('Besenyei','Red Bull').
equipa('Chambliss','Red Bull').
equipa('MacLean','Mediterranean Racing Team').
equipa('Mangold','Cobra').
equipa('Jones','Matador').
equipa('Bonhomme','Matador').

/* O avião do Lamb é um MX2 e o Besenyei, Chambliss, Maclean,
Mangold, Jones e Bonhomme é um Edge 540 */
aviao('Lamb','MX2').
aviao('Besenyei','Edge540').
aviao('Chambliss','Edge540').
aviao('MacLean','Edge540').
aviao('Mangold','Edge540').
aviao('Jones','Edge540').
aviao('Bonhomme','Edge540').

/* Istanbul, Budapeste e Porto são circuitos */
circuitos('Istanbul').
circuitos('Budapeste').
circuitos('Porto').

/* Jones venceu no Porto, Mangold venceu em Budapeste e em Istanbul */
vencedor('Jones','Porto').
vencedor('Mangold','Budapeste').
vencedor('Mangold','Istanbul').

/*  Istanbul tem 9 gates, Budapeste tem 6 e o Porto 5 gates */
gates('Istanbul',9).
gates('Budapeste',6).
gates('Porto',5).

/* Uma equipa ganha uma corrida quando um dos seus pilotos vence essa
corrida */
equipaVencedora(Equipa, Circuito):-
        equipa(Piloto,Equipa),
        vencedor(Piloto, Circuito).

% a) Quem venceu no Porto?
%      | ?- vencedor(X,'Porto').
%        Y = 'Jones' ? ;
%        no


% b) Qual a equipa que venceu no Porto?

equipaVencedoraCidade(Equipa, Local):-
        vencedor(Piloto, Local),
        equipa(Piloto, Equipa).

% | ?- equipaVencedoraCidade(Equipa, 'Porto').
%   Equipa = 'Matador' ? 
%   yes


% c) Quais os pilotos que venceram mais de um circuito?

pilotosQueVenceramMaisDeUmCircuito(Piloto):-
        vencedor(Piloto,Local1),
        vencedor(Piloto,Local2),
        Local1 \= Local2.

% | ?- pilotosQueVenceramMaisDeUmCircuito(Piloto).
%   Piloto = 'Mangold' ? ;
%   Piloto = 'Mangold' ? ;
%   no

% d) Que circuitos têm mais de 8 gates?

maisDe8Gates(Circuito):-
        circuitos(Circuito),
        gates(Circuito, NumGates),
        NumGates > 8.
 
% | ?- maisDe8Gates(Circuito).
%   Circuito = 'Istanbul' ? ;
%   no

% e) Que pilotos não pilotam um Edge 540?

quemNaoPilotoUmEdge(Piloto):-
     piloto(Piloto),
     aviao(Piloto,Aviao),
     Aviao \= 'Edge540'.   

% | ?- quemNaoPilotoUmEdge(Piloto).
%   Piloto = 'Lamb' ? ;
%   no     
