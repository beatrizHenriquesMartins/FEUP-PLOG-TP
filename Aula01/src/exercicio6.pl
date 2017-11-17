/*
Tweety � um p�ssaro. Goldie � um peixe. Molie � uma minhoca. P�ssaros gostam 
de minhocas.Gatos gostam de peixes. Gatos gostam de p�ssaros. Amigos gostam 
uns dos outros. O meu gato � meu amigo. O meu gato come tudo o que gosta.
O meu gato chama-se Silvester.
*/

% Tweety � um p�ssaro. 
% Goldie � um peixe. 
% Molie � uma minhoca. 
% O meu gato chama-se Silvester.
% animal(Nome, Especie).
animal('Tweety', 'Passaro').
animal('Goldie', 'Peixe').
animal('Molie', 'Minhoca').
animal('Silvester', 'Gato').

% P�ssaros gostam de minhocas. 
% Gatos gostam de peixes. 
% Gatos gostam de p�ssaros.
% O meu gato come tudo o que gosta.
% gosta(Especie, Gosta). 
gosta('Passaro', 'Minhoca').
gosta('Gato','Peixe').
gosta('Gato','Passaro').

% Amigos gostam uns dos outros.
% O meu gato � meu amigo.
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

 % A resposta � razo�vel ? Se n�o for, verifique se o problema est� na
% especifica��o original ou na sua tradu��o para Prolog, corrija e execute 
% novamente.
% R.: Sim 