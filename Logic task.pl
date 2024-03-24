in_list(A, B):- member(B, A).

main:-
    Liquids = [_, _, _, _],

    % Êàæäîé æèäêîòè ïî ñîñóäó
    in_list(Liquids, [water, Liquids1]),
    in_list(Liquids, [milk, Liquids2]),
    in_list(Liquids, [lemonade, Liquids3]),
    in_list(Liquids, [kvass, Liquids4]),

    % Ñïèñîê ñîñóäîâ äëÿ ïåðåáîðà
    in_list(Liquids, [_, bottle]),
    in_list(Liquids, [_, glass]),
    in_list(Liquids, [_, jug]),
    in_list(Liquids, [_, pot]),

    Liquids1 \= bottle,
    Liquids2 \= bottle,

    Liquids3 \= pot,
    Liquids1 \= pot,

    write('Water - '), write(Liquids1), nl,
    write('Milk - '), write(Liquids2), nl,
    write('Lemonade - '), write(Liquids3), nl,
    write('Kvass - '), write(Liquids4), nl.

