% Реализовать предикат max(+X,+Y,+U,-Z), где U максимальное из чисел X,Y и Z.
max(X,Y,U,Z):- (X >= Y, X >= Z -> U = X; Y >= X, Y >= Z -> U = Y; U = Z).

% Реализовать предикат fact(+N,-X), где X – это факториал первого аргумента
% с помощью рекурсии вверх.
fact(0, 1):- !. % Дно
fact(N, X):-
    N > 0,
    N1 is N - 1, % Вычисляем предыдущее число
    fact(N1, X1), % Вызор рекурсии для N1
    X is N * X1. % Вычисление факториала, умножая на факториал N1

% Реализовать предикат fact(+N,-X), где X – это факториал первого аргумента
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
% Проверить, является ли число свободным от квадратов free_sqrt(+X).
free_sqrt(X):-
    Sqrt is sqrt(X),
    round(Sqrt, RoundSqrt),
    NewX is RoundSqrt * RoundSqrt,
    NewX =:= X.

% Найти сумму цифр числа с помощью рекурсии вверх.
% sum_digits_up(+Number, -Sum).
sum_digits_up(0, 0).
sum_digits_up(Number, Sum):-
    Number > 0,
    Number1 is Number mod 10,
    Number2 is Number // 10,
    sum_digits_up(Number2, Sum1),
    Sum is Sum1 + Number1.

% Найти сумму цифр числа с помощью рекурсии вниз.
% sum_digits_down(+Number, -Sum).
sum_digits_down(Number, Sum):-
    sum_digits_down_help(Number, 0, Sum).

sum_digits_down_help(0, Summa, Summa).
sum_digits_down_help(Number, CurSum, AllSum):-
    Number > 0,
    Number1 is Number mod 10,
    Number2 is Number // 10,
    NextCurSum is CurSum + Number1,
    sum_digits_down_help(Number2, NextCurSum, AllSum).

% Реализовать предикат чтения списка с клавиатуры и предикат вывода списка на экран. read_list(+List)
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

% Построить предикат, который удаляет все элементы, сумма цифр которых равна данной.
% Удаление эл-ов из списка, где сумма чисел равна заданной rm_elem_as_list(+Sum, +List, -Res).
rm_elem_as_list(_, [], []). % Если список пуст, то результат тоже "пуст"
rm_elem_as_list(Sum, [H|T], Res):-
    sum_digits_down(H, HSum), % Вычисляем сумму цифр головы списка
    (   HSum == Sum -> rm_elem_as_list(Sum, T, Res)
    ;   Res = [H|R],
        rm_elem_as_list(Sum, T, R)
    ).
