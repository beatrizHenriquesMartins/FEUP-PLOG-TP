:-use_module(library(clpfd)).
:-use_module(library(lists)).
                         
% resolução Bernardo Belchior      
receitas(NOvos, TempoMax, OvosPorReceita, TempoPorReceita,
         OvosUsados, Receitas):-
        length(OvosPorReceita, NumReceitas), 
        length(ReceitasUsadas, NumReceitas), 
        domain(ReceitasUsadas, 0, 1),
        sum(ReceitasUsadas, #=, 4),
        scalar_product(TempoPorReceita, ReceitasUsadas, #=<, TempoMax, [consistency(domain)]),
        scalar_product(OvosPorReceita, ReceitasUsadas, #=, OvosUsados, [consistency(domain)]),
        OvosUsados #=< NOvos,
        labeling([maximize(OvosUsados)], ReceitasUsadas), 
        findall(Indice, nth1(Indice, ReceitasUsadas, 1), Receitas).
 