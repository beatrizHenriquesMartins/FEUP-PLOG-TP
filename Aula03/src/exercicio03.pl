/* -*- Mode:Prolog; coding:iso-8859-1; indent-tabs-mode:nil; prolog-indent-width:8; prolog-paren-indent:3; tab-width:8; -*- */

append1([],L,L).

append1([X|L1],L2,[X|L3]):-
        append1(L1,L2,L3).

/*para testar: | ?- append1([1,2,3,4,5],X,X).*/