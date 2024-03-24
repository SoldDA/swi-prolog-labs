%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Найти произведение цифр числа
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~mult_up(+Number, -Ans).
mult_up(0, 1).
mult_up(Number, Ans):-
    Number > 0,
    Number1 is Number mod 10,
    Number2 is Number // 10,
    mult_up(Number2, Ans1),
    Ans is Ans1 * Number1.
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~mult_down(+N, -Ans).
mult_down(N, Ans):-
    mult_down_help(N, 1, Ans).
mult_down_help(0, Anss, Anss).
mult_down_help(N, CurAns, AllAns):-
    N > 0,
    N1 is N mod 10,
    N2 is N // 10,
    NewCurAns is CurAns * N1,
    mult_down_help(N2, NewCurAns, AllAns).


%~~~~~~~~~~~~~~~~~~~~~~~Найти максимальную цифру числа, не делящуюся на 3.
%~~~~~~~~~~~~~~~~~~~~~~~~~~~max_number_not_del_on_three_up(+Number, -Ans).
max_number_not_del_on_three(0, 0):- !.
max_three(Number, MaxDigit):-
    Number > 0,
    Number1 is Number mod 10,
    (
        Number1 mod 3 =:= 0 -> Number2 is Number // 10, max_number_not_del_on_three_up(Number2, MaxDigit)
    ;
        Number2 is Number // 10, max_number_not_del_on_three_up(Number2, NewMaxDigit), MaxDigit is max(NewMaxDigit, Number1)
    ).
%~~~~~~~~~~~~~~~~~~~~~~~~~max_number_not_del_on_three_down(+Number, -Ans).
max_number_not_del_on_three_down(Number, MaxDigit):-
    max_number_not_del_on_three_down_help(Number, 0, MaxDigit).

max_number_not_del_on_three_help(0, Digit, Digit):- !.
max_number_not_del_on_three_help(Num, CurDig, MaxDig):-
    Num > 0,
    Num1 is Num mod 10,
    (   Num1 mod 3 =:= 0 -> Num2 is Num // 10, max_number_not_del_on_three_help(Num2, CurDig, MaxDig);
        NewCurDig is max(CurDig, Num1), Num2 is Num // 10, max_number_not_del_on_three_help(Num2, NewCurDig, MaxDig)
    ).


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Найти количество делителей числа. 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~count_del_up(+Number, +CurDel, -Count).
count_del_up(_, 0, 0):- !.
count_del_up(N, CurDel, Ans):-
    (   N mod CurDel =:= 0 -> NewCurDel is CurDel - 1, count_del_up(N, NewCurDel, Ans1), Ans is Ans1 + 1
    ;   NewCurDel is CurDel - 1, count_del_up(N, NewCurDel, Ans)
    ).
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~count_del_down(+Number, -Count).
count_del_down(Number, Count):-
    count_del_down_help(Number, Number, 0, Count).
    
count_del_down_help(_, 0, Cou, Cou):- !.
count_del_down_help(N, CurDel, CurCou, Ans):-
    (   N mod CurDel =:= 0 -> NewCurCou is CurCou + 1, NewCurDel is CurDel - 1, count_del_down_help(N, NewCurDel, NewCurCou, Ans)
    ;   NewCurDel is CurDel - 1, count_del_down_help(N, NewCurDel, CurCou, Ans)
    ).
