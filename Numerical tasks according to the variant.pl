% Реализовать предикат max(+X,+Y,+U,-Z), где U максимальное из чисел X,Y и Z.
max(X,Y,U,Z):- (X >= Y, X >= Z -> U = X; Y >= X, Y >= Z -> U = Y; U = Z).

% Реализовать предикат fact(N,X), где X – это факториал первого аргумента
% с помощью рекурсии вверх.
fact(0, 1):- !. % Дно
fact(N, X):-
    N > 0,
    N1 is N - 1, % Вычисляем предыдущее число
    fact(N1, X1), % Вызор рекурсии для N1
    X is N * X1. % Вычисление факториала, умножая на факториал N1

% Реализовать предикат fact(N,X), где X – это факториал первого аргумента
% с помощью рекурсии вниз.
fact(N, X):-
    next_fact(N, 1, X).

next_fact(0, Ans, Ans). % Факториал 0 = 1
next_fact(N, Ans, X):-
    N > 0,
    N1 is N - 1,
    Ans1 is Ans * N,
    next_fact(N1, Ans1, X).

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Проверить, является ли число свободным от квадратов ???
free_sqrt(X):-
    Sqrt is sqrt(X),
    round(Sqrt, RoundSqrt),
    NewX is RoundSqrt * RoundSqrt,
    NewX =:= X.

% Реализовать предикат чтения списка с клавиатуры и предикат вывода списка на экран.
read_list(List):-
    write('Введите список: '),
    read(List),
    List = [_|_].

print_list([]). % Если список пуст
print_list([Head|Tail]):-
    write(Head), write(' '),
    print_list(Tail).

main:-
    read_list(List),
    write('Список элементов: '), print_list(List), nl,
    write('Сумма элементов в списке: '), sum_list_down(List, Summ),
    print(Summ),
    nl.

% Реализовать предикат sum_list_down(+List, ?Summ), который проверяет,
% является ли Summ суммой элементов списка или записывает в эту
% переменную сумму элементов. Для построения воспользоваться рекурсией вниз.
sum_list_down([], 0). % Сумма пустого списка - 0
sum_list_down([H|T], Summ):-
    sum_list_down(T, TSumm), % С помощью рекурсии вычисляем сумму хвоста списка
    Summ is H + TSumm. % + голова списка к сумме хвоста

% Реализовать программу, читающую список, считающую сумму элементов и выводящую сумму на экран, с использованием предикатов.
print_sum(Summ):- write(Summ), nl.

% Построить предикат sum_list_up(+List, ?Summ), который проверяет,
% является ли Summ суммой элементов списка или записывает в эту
% переменную сумму элементов. Для построения воспользоваться рекурсией
% вверх.
sum_list_up(List, Summ):-
    sum_list_up_next(List, 0, Summ).

sum_list_up_next([], Sum, Sum).
sum_list_up_next([H|T], CurSum, Sum):-
    NewCurSum is CurSum + H,
    sum_list_up_next(T, NewCurSum, Sum).

% Построить предикат, который удаляет все элементы, сумма цифр которых
% равна данной.
% Сумма цифр
sum_number(Number, Sum):-
    number_chars(Number, Chars), % number_chars - преобразовывает число в список символов
    maplist(atom_number, Chars, Digits), % maplist - позволяет преобразовать символ в число
    sum_list(Digits, Sum). % Сумма чисел в списке

% Удаление эл-ов из списка, где сумма чисел равна заданной
rm_elem_as_list(_, [], []). % Если список пуст, то результат тоже "пуст"
rm_elem_as_list(Sum, [H|T], Res):-
    sum_number(H, HSum), % Вычисляем сумму цифр головы списка
    (   HSum == Sum -> rm_elem_as_list(Sum, T, Res)
    ;   Res = [H|R],
        rm_elem_as_list(Sum, T, R)
    ).

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
