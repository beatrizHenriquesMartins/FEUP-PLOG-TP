:- use_module(library(lists)).

% film( Title, Categories, Duration, AvgClassification).
film('Doctor Strange', [action, adventure, fantasy], 115, 7.6).
film('Hacksaw Ridge', [biography, drama, romance], 131, 8.7).
film('Inferno', [action, adventure, crime], 121, 6.4).
film('Arrival', [drama, mystery, scifi], 116, 8.5).
film('The Accountant', [action, crime, drama], 127, 7.6).
film('The Girl on the Train', [drama, mystery, thriller], 112, 6.7).

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
        film(Movie, _, Duracao, _),
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
        film(NomeF, ListCategories, Duracao, Pontuacao),
        member(Category, ListCategories),
        write(NomeF), write(' ('), write(Duracao), write('min, '), write(Pontuacao), write('/10)'), nl,
        fail.

/**************
 * Pergunta 6 *
 **************/
% Similarity = PercentCommonCat - 3 * DurDiff - 5 * ScoreDiff
% PercentCommonCat = Sum(Cat comum) / total Cat
% DurDiff = abs(Dur Film 1 -Dur Film2)
% ScoreDiff = abs(Score Film 1 - Score Film2)

similarity(Film1, Film2, Similarity):-
        %filmes
        film(Film1, CatF1, Duracao1, Av1),
        film(Film2, CatF2, Duracao2, Av2),

        % elementos comuns
        elemsComuns(CatF1, ListCC, CatF2),

        %tamanho das listas
        length(CatF1, LenF1),
        length(CatF2, LenF2),
        length(ListCC, Len),
        
        Total is (LenF1+LenF2)-Len,
        PercentCommonCat is (Len/Total)*100,

        % DurDiff
        DurDiffAux is abs(Duracao1-Duracao2),
        DurDiff is DurDiffAux * 3,

        % ScoreDiff
        ScoreDiffAux is abs(Av1-Av2),
        ScoreDiff is ScoreDiffAux * 5,

        % Similarity
        Similarity is PercentCommonCat - DurDiff - ScoreDiff,
        !.

/**************
 * Pergunta 7 *
 **************/
% ???

/**************
 * Pergunta 8 *
 **************/
% Distancia = AvgDiff + AgeDiff/3 + CountryDiff
% AvgDiff media entre a diferenca
% AgeDiff = abs(Idade 1 - Idade 2)
% CountryDiff 0 - True 2 - Falso
 
% distancia(User1, Distancia, User2).