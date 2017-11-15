/* Os Maias, livro, Eça de Queirós, português, inglês, romance, escreveu,
autor, nacionalidade, tipo, ficção */

% Livro
livro('Os Maias', 'Romance').
livro('Os Maias', 'Ficção').

% autor
autor('Eça de Queirós', 'Os Maias').

% nacionalidade
nacionalidade('Eça de Queirós', 'Português').
nacionalidade('Eça de Queirós', 'Inglês').

% a) Quem escreveu o livro?

% | ?- autor(Autor, 'Os Maias').
%   Autor = 'Eça de Queirós' ? ;
%   no

% b) Que autores portugueses escrevem romances?

escrevemRomances(Tipo, Autor):-
        livro(Titulo, Tipo),
        autor(Autor, Titulo).

% | ?- escrevemRomances('Romance', Autor).
%   Autor = 'Eça de Queirós' ? ;
%   no

% c) Quais os autores de livros de ficção que escreveram livros de 
%    outro tipo também?

% ????