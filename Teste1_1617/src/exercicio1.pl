:- use_module(library(lists)).

% film( Title, Categories, Duration, AvgClassification).
filme('Doctor Strange', [action, adventure, fantasy], 115, 7.6).
filme('Hacksaw Ridge', [biography, drama, romance], 131, 8.7).
filme('Inferno', [action, adventure, crime], 121, 6.4).
filme('Arrival', [drama, mystery, scifi], 116, 8.5).
filme('The Accountant', [action, crime, drama], 127, 7.6).
filme('The Girl on the Train', [drama, mystery, thriller], 112, 6.7).

% user(Username, YearOfBirth, Coutry).
user(jonh, 1992, 'USA').
user(jack, 1989, 'UK').
user(peter, 1983, 'Portugal').
user(harry, 1993, 'USA').
user(richard, 1982, 'USA').

% vote(Username, List_of_Film-Rating).
vote(john, ['Inferno'-7, 'Doctor Strange'-9, 'The Accountant'-6]).
vote(jack, ['Inferno'-8, 'Doctor Strange'-8, 'The Accountant'-7]).
vote(peter, ['The Accountant'-4,'Hacksaw Ridge'-7, 'The Girl on the Train'-3]).
vote(harry, ['Inferno'-7, 'The Accountant'-6]).
vote(richard, ['Inferno'-10, 'Hacksaw Ridge'-10, 'Arrival'-9]).

/**************
 * Pergunta 1 *
 **************/
curto(Movie):-
        filme(Movie, _, Duracao, _),
        Duracao < 125.

/**************
 * Pergunta 2 *
 **************/
diff(User1, User2, Difference, Film):-
        vote(User1, List_Films1),
        vote(User2, List_Films2),
        member(Film-Vote1, List_Films1),
        member(Film-Vote2, List_Films2),
        Difference is abs(Vote1 - Vote2).

/**************
 * Pergunta 3 *
 **************/
procuraVotosSuperiores([], 0).
procuraVotosSuperiores([_Head_F-Head_V|Tail], Count):-
        Head_V >= 8,
        procuraVotosSuperiores(Tail, Count1),
        Count is Count1+1.

niceGuy(User):-
        vote(User, ListFilms),
        procuraVotosSuperiores(ListFilms, Count),
        Count >= 2.

/**************
 * Pergunta 4 *
 **************/
elemsComuns([], [], _).
elemsComuns([HeadList1|TailList1], [HeadList1|Common], List2):-
        member(HeadList1, List2),
        elemsComuns(TailList1, Common, List2).
elemsComuns([_HeadList1|TailList1], Common, List2):-
        elemsComuns(TailList1, Common, List2).

/**************
 * Pergunta 5 *
 **************/

printCategory(Category):-
        filme(NomeF, ListCategories, Duracao, Pontuacao),
        member(Category, ListCategories),
        write(NomeF), write(' ('), write(Duracao), write('min, '), write(Pontuacao), write('/10)'), nl,
        fail.
