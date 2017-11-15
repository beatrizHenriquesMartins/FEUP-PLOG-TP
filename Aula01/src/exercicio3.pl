/* Os Maias, livro, E�a de Queir�s, portugu�s, ingl�s, romance, escreveu,
autor, nacionalidade, tipo, fic��o */

% Livro
livro('Os Maias', 'Romance').
livro('Os Maias', 'Fic��o').

% autor
autor('E�a de Queir�s', 'Os Maias').

% nacionalidade
nacionalidade('E�a de Queir�s', 'Portugu�s').
nacionalidade('E�a de Queir�s', 'Ingl�s').

% a) Quem escreveu o livro?

% | ?- autor(Autor, 'Os Maias').
%   Autor = 'E�a de Queir�s' ? ;
%   no

% b) Que autores portugueses escrevem romances?

escrevemRomances(Tipo, Autor):-
        livro(Titulo, Tipo),
        autor(Autor, Titulo).

% | ?- escrevemRomances('Romance', Autor).
%   Autor = 'E�a de Queir�s' ? ;
%   no

% c) Quais os autores de livros de fic��o que escreveram livros de 
%    outro tipo tamb�m?

% ????