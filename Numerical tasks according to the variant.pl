%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Найти произведение цифр числа. multi_of_digits(+Number, -Res).
multi_of_digits(Number, Res):-
    number_chars(Number, Chars), % Преобразовали числа в строку
    multi_of_digits_next(Chars, 1, Res).

multi_of_digits_next([], Res, Res).
multi_of_digits_next([H|T], CurRes, Res):-
    atom_number(H, Digit),
    NewCurRes is CurRes * Digit,
    multi_of_digits_next(T, NewCurRes, Res).

% Найти максимальную цифру числа, не делящуюся на 3.
% max_number_ne_del_na_three(+Number, -Answer).
max_number_ne_del_na_three(Number, Answer):-
    number_chars(Number, Chars),
    max_number_ne_del_na_three_next(Chars, 0, Answer).

max_number_ne_del_na_three_next([], Max, Max).
max_number_ne_del_na_three_next([H|T], CurMax, Max):-
    atom_number(H, Digit),
    (
        Digit mod 3 =:= 0 -> max_number_ne_del_na_three_next(T, CurMax, Max)
     ;
        NewMax is max(CurMax, Digit),
        max_number_ne_del_na_three_next(T, NewMax, Max)
    ).

% Найти количество делителей числа. count_del(+Number, -Count).
count_del(Number, Count):-
    count_del_next(Number, 1, 0, Count), !.

count_del_next(Number, CurDel, CurCount, Count):-
    CurDel > Number, !,
    Count = CurCount.

count_del_next(Number, CurDel, CurCount, Count):-
    Number mod CurDel =:= 0,
    NewCurCount is CurCount + 1,
    NextDel is CurDel + 1,
    count_del_next(Number, NextDel, NewCurCount, Count).

count_del_next(Number, CurDel, CurCount, Count):-
    NextDel is CurDel + 1,
    count_del_next(Number, NextDel, CurCount, Count).
