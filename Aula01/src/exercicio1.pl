male('Aldo Burrows').
male('Lincoln Burrows').
male('Michael Scofield').
male('LJ Burrows').

female('Christina Rose Scofield').
female('Lisa Rix').
female('Sara Tancredi').
female('Ella Scofield').

parent('Aldo Burrows','Lincoln Burrows').
parent('Aldo Burrows','Michael Scofield').

parent('Christina Rose Scofield','Lincoln Burrows').
parent('Christina Rose Scofield','Michael Scofield').

parent('Lincoln Burrows','LJ Burrows').

parent('Lisa Rix','LJ Burrows').

parent('Michael Scofield','Ella Scofield').

parent('Sara Tancredi','Ella Scofield').

/* 
*************
* RESPOSTAS *
*************
1. a) | ?- parent(X,'Michael Scofield').
        X = 'Aldo Burrows' ? ;
        X = 'Christina Rose Scofield' ? ;
        no

   b) | ?- parent('Aldo Burrows',X).
        X = 'Lincoln Burrows' ? ;
        X = 'Michael Scofield' ? ;
        no
*/