:-use_module(library(lists)).
:-dynamic numero/1.


% participant(Id, Age, Performance)
participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').

% performance(Id, Times)
performance(1234, [120,120,120,120]).
performance(3423, [32,120,45,120]).
performance(3788, [110,2,6,43]).
performance(4865, [120,120,110,120]).
performance(8937, [97,101,105,110]).

/**************
 * Pergunta 1 *
 **************/
% verificar se o botão foi pressionado
verificaSeBotaoPressionadoPeloMenosUmaVez([]):-
        fail.
verificaSeBotaoPressionadoPeloMenosUmaVez([Head|Tail]):-
        Head == 120;
        verificaSeBotaoPressionadoPeloMenosUmaVez(Tail).

madeItThrough(+Participant):-
        performance(+Participant, Lista),
        verificaSeBotaoPressionadoPeloMenosUmaVez(Lista).

/**************
 * Pergunta 2 *
 **************/
% juriTimes(+Participants,+JuriMember,-Times,-­Total).

juriTimes([], _, [], 0).
juriTimes([Head_P|Tail_P], JuriMember, [Head_T|Tail_T], Total):-
        juriTimes(Tail_P, JuriMember, Tail_T, SomaTotal),
        performance(Head_P, List_Temp_P),
        nth1(JuriMember, List_Temp_P, Head_T),
        Total is SomaTotal + Head_T.


/**************
 * Pergunta 3 *
 **************/
numero(0).

check_pressed_button(JuriMember):-
        performance(_,Times),
        nth1(JuriMember, Times, Aux),
        Aux == 120,
        numero(Abts),
        Cont is Abts+1,
        retract(numero(_)),
        asserta(numero(Cont)),
        fail.

patientJuri(JuriMember):-
        retract(numero(_)),
        asserta(numero(0)),
        \+check_pressed_button(JuriMember), %negado porque queremos saber quantas vezes não pressionou
        numero(X),
        X >= 2.

/**************
 * Pergunta 4 *
 **************/

sum_all([], 0).
sum_all([Head|Tail], FinalResult):-
        sum_all(Tail, FinalR),
        FinalResult is FinalR+Head.

uni(P1, _P2, ResultP1, ResultP2, P):-
        ResultP1 > ResultP2,
        P is P1.

uni(_P1, P2, ResultP1, ResultP2, P):-
        ResultP2 > ResultP1,
        P is P2.

uni(_P1, _P2, ResultP1, ResultP2, _P):-
        ResultP1 == ResultP2,
        fail.

bestParticipant(P1, P2, P):-
        performance(P1, Times_P1),
        performance(P2, Times_P2),
        sum_all(Times_P1, Result_P1),
        sum_all(Times_P2, Result_P2),
        uni(P1, P2, Result_P1, Result_P2, P).
        
/**************
 * Pergunta 5 *
 **************/

allPerfs:-
        participant(Id,_,Perf),
        performance(Id, Times),
        write(Id), write(':'), write(Perf), write(':'), write(Times), nl,
        fail.
allPerfs.