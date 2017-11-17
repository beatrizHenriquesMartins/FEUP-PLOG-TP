aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).

frequenta(joao, feup).
frequenta(maria, feup).  
frequenta(joel, ist).

professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).

funcionario(pedro, ist). 
funcionario(ana_paula, feup).  
funcionario(carlos, feup). 

% a) Quem são os alunos do professor X?

alunos_Professor(Professor, NomeAluno):-
        aluno(NomeAluno, Disciplina),
        professor(Professor, Disciplina).

% | ?- alunos_Professor(Professor,NomeAluno).
%   Professor = carlos,
%   NomeAluno = joao ? ;
%   Professor = carlos,
%   NomeAluno = maria ? ;
%   Professor = pedro,
%   NomeAluno = joel ? ;
%   Professor = ana_paula,
%   NomeAluno = joel ? ;
%   no

% b) Quem são as pessoas da universidade X? (alunos ou docentes) 

% para alunos
universidadeAlunosProfessores(Universidade, Nome):- 
        frequenta(Nome, Universidade).
% para professores
universidadeAlunosProfessores(Universidade, Nome):-
        funcionario(Nome, Universidade).

% | ?- universidadeAlunosProfessores(Universidade, Nome).
%   Universidade = feup,
%   Nome = joao ? ;
%   Universidade = feup,
%   Nome = maria ? ;
%   Universidade = ist,
%   Nome = joel ? ;
%   Universidade = ist,
%   Nome = pedro ? ;
%   Universidade = feup,
%   Nome = ana_paula ? ;
%   Universidade = feup,
%   Nome = carlos ? ;
%   no
                  
% c) Quem é colega de quem? 
%    Se aluno: é colega se for colega de disciplina ou colega de curso 
%               ou colega de universidade. 
%    Se professor: se for professor da mesma universidade.

% aluno: colega mesma disciplina
colegaDeQuem(Nome1,Nome2):-
        aluno(Nome1,Disciplina1),
        aluno(Nome2,Disciplina2),
        Nome1 \= Nome2,
        Disciplina1 == Disciplina2.
colegaDeQuem(Nome1,Nome2):-
        frequenta(Nome1, Universidade1),
        frequenta(Nome2, Universidade2),
        Nome1 \= Nome2,
        Universidade1 == Universidade2.
colegaDeQuem(Nome1,Nome2):-
        funcionario(Nome1, Universidade1),
        funcionario(Nome2, Universidade2),
        Nome1 \= Nome2,
        Universidade1 == Universidade2.

% | ?- colegaDeQuem(Nome1,Nome2).
%   Nome1 = joao,
%   Nome2 = maria ? ;
%   Nome1 = maria,
%   Nome2 = joao ? ;
%   Nome1 = joao,
%   Nome2 = maria ? ;
%   Nome1 = maria,
%   Nome2 = joao ? ;
%   Nome1 = ana_paula,
%   Nome2 = carlos ? ;
%   Nome1 = carlos,
%   Nome2 = ana_paula ? ;
%   no