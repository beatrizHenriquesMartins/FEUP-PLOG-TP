:-use_module(library(lists)).
:-dynamic played/4.

% ******************
% * Base de factos *
% ******************
 
% player(Name, UserName, Age).
player('Danny', 'Best Player Ever', 27).
player('Annie', 'Worst Player Ever', 24).
player('Harry', 'A-Star Player', 26).
player('Manny', 'The Player', 14).
player('Jonny', 'A Player', 16).

% game(Name, Categories, MinAge).
game('5 ATG', [action, adventure, open-world, multiplayer], 18).
game('Carrier Shift: Game Over', [action, fps, multiplayer, shooter], 16).
game('Duas Botas', [action, free, strategy, moba], 12).

% played(Player, Game, HoursPlayed, PercentUnlocked)
played('Best Player Ever', '5 ATG', 3, 83).
played('Worst Player Ever', '5 ATG', 52, 9).
played('The Player', 'Carrier Shift: Game Over', 44, 22).
played('A Player', 'Carrier Shift: Game Over', 48, 24).
played('A-Star Player', 'Duas Botas', 37, 16).
played('Best Player Ever', 'Duas Botas', 33, 22).

% *******************
% * Pergunta 1 - V1 *
% *******************

playedALot(Player) :-
        played(Player, _, HoursPlayed, _),
        HoursPlayed >= 50.

% *******************
% * Pergunta 2 - V1 *
% *******************

isAgeAppropriate(Name, Game) :-
        player(Name, _, Age),
        game(Game, _, MinAge),
        Age >= MinAge.

% *******************
% * Pergunta 3 - V1 *
% *******************

listGamesOfCategory(Cat):-
        game(Game, Categories, MinAge),
        member(Cat, Categories),
        write(Game), write(' '), write('('), write(MinAge), write(')'), nl,
        fail;true.

% *******************
% * Pergunta 4 - V1 *
% *******************

updatePlayer(Player, Game, Hours, Percentage) :-
        played(Player, Game, HoursPlayed, PercentageUnlocked),
        NewHours is HoursPlayed + Hours,
        NewPercentage is PercentageUnlocked + Percentage,
        retract(played(Player, Game, _, _)),
        assert(played(Player, Game, NewHours, NewPercentage)).

% *******************
% * Pergunta 5 - V1 *
% *******************

timePlayingGames(_, [], [], 0).
timePlayingGames(Player, [Game|Games], [Time|ListOfTimes], SumTimes) :-
        played(Player, Game, Time, _),
        timePlayingGames(Player, Games, ListOfTimes, SumTimesFinal),
        SumTimes is SumTimesFinal + Time,
        !.
timePlayingGames(Player, [_|Games], [0|ListOfTimes], SumTimes):-
        timePlayingGames(Player, Games, ListOfTimes, SumTimes).

% *******************
% * Pergunta 6 - V1 *
% *******************

littleAchievement(Player, Games):-
        littleAchievement(Player, [], Games).
littleAchievement(Player, ListOfGames, FinalGames):-
        played(Player, GameName, _, PercentageUnlock),
        PercentageUnlock < 20,
        \+(member(GameName, ListOfGames)),
        !,
        littleAchievement(Player, [GameName|ListOfGames], FinalGames).
% condição de paragem
littleAchievement(Player, FinalGames, FinalGames).

% *******************
% * Pergunta 7 - V1 *
% *******************

ageRange(MinAge, MaxAge, Players):-
        findall(PlayerName, (player(PlayerName, _, Age), Age >= MinAge, Age =< MaxAge), Players). 

% *******************
% * Pergunta 8 - V1 *
% *******************

listSum([], Counter, Counter).
listSum([Age|Ages], CounterAux, CounterFinal):-
        Aux is CounterAux + Age,
        listSum(Ages, Aux, CounterFinal).
averageAge(Game, AverageAge):-
        findall(Age,(played(Username, Game, _, _), player(_, Username, Age)), List),
        listSum(List, 0, AgeSum),
        length(List, Num),
        AverageAge is AgeSum/Num.

% *******************
% * Pergunta 9 - V1 *
% *******************

% ********************
% * Pergunta 10 - V1 *
% ********************