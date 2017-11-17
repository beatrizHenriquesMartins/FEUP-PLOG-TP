/*
Tweety é um pássaro. Goldie é um peixe. Molie é uma minhoca. Pássaros gostam 
de minhocas.Gatos gostam de peixes. Gatos gostam de pássaros. Amigos gostam 
uns dos outros. O meu gato é meu amigo. O meu gato come tudo o que gosta.
O meu gato chama-se Silvester.
*/

% Tweety é um pássaro. 
% Goldie é um peixe. 
% Molie é uma minhoca. 
% O meu gato chama-se Silvester.
% animal(Nome, Especie).
animal('Tweety', 'Passaro').
animal('Goldie', 'Peixe').
animal('Molie', 'Minhoca').
animal('Silvester', 'Gato').

% Pássaros gostam de minhocas. 
% Gatos gostam de peixes. 
% Gatos gostam de pássaros.
% O meu gato come tudo o que gosta.
% gosta(Especie, Gosta). 
gosta('Passaro', 'Minhoca').
gosta('Gato','Peixe').
gosta('Gato','Passaro').

% Amigos gostam uns dos outros.
% O meu gato é meu amigo.
% amigo(Especie,Especie)
amigo('Pessoa','Gato').

% a) Use Prolog para determinar tudo o que come o Silvester?
come(Nome, Gosta):-
        animal(Nome,Especie),
        gosta(Especie, Gosta).

% | ?- come('Silvester', Gosta).
%   Gosta = 'Peixe' ? ;
%   Gosta = 'Passaro' ? ;
%   no

 % A resposta é razoável ? Se não for, verifique se o problema está na
% especificação original ou na sua tradução para Prolog, corrija e execute 
% novamente.
% R.: Sim 