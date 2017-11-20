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

/**************
 * Pergunta 6 *
 **************/
not_check([]).
not_check([Head|Tail]):-
        Head == 120;
        not_check(Tail).

nSuccessfulParticipants(T):-
        setof(P,(performance(P, Times), not_check(Times)), List_Result),
        length(List_Result, T).

/**************
 * Pergunta 7 *
 **************/
juriFans(juriFansList).

/**************
 * Pergunta 8 *
 **************/
eligibleOutcome(Id,Perf,TT) :-
        performance(Id,Times),
        madeItThrough(Id),
        participant(Id,_,Perf),
        sumlist(Times,TT).

partir_List_N(_, 0, []).
partir_List_N([Elem|List], N, [Elem|Participants]):-
        NewN is N - 1,
        partir_List_N(List, NewN, Participants).
        

nextPhase(N, Participants):-
        findall(TT-Id-Perf,eligibleOutcome(Id, Perf, TT), List),
        nl,nl,write(List), nl,nl,
        length(List, Len),
        Len >= N,
        reverse(List, List1),
        partir_List_N(List1, N, Participants).

/**************
 * Pergunta 9 *
 **************/
% R =ID
% P = Performance
% Q = Idade
predX(Q, [R|Rs], [P|Ps]):-
        participant(R,I,P),
        I =< Q,
        %!,
        predX(Q,Rs,Ps).
predX(Q, [R|Rs], Ps):-
        participant(R,I,_),
        I>Q,
        predX(Q,Rs,Ps).
predX(_,[],[]).

/*
        O predX proucura numa lista de Id's qual ou quais os participantes 
que estão contidos numa determinada idade, retornando um elemento ou uma 
nova lista.
        O cut é verde porque a sua presença não altera qualquer valor obtido
com cut.
*/