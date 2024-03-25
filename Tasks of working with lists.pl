% read_list(+N,-List), ввод списка.
read_list(0,[]):-!. % Если N = 0, то пуст список.
read_list(N,[H|T]) :- read(H), NewN is N - 1,
    read_list(NewN, T).

% Вывод списка на экран.
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

% Вариант - 4
% 1.4 Дан целочисленный массив. Вывести индексы массива в том порядке, в
%  котором соответствующие им элементы образуют убывающую последовательность.
%  list_to_pairs(+List, -Pairs). Каждому элементу в списке присваивается индекс.
list_to_pairs(List, Pairs):-
    list_to_pairs(List, 0, Pairs).

list_to_pairs([], _, []). % Если список пуст.
list_to_pairs([H|T], Index, [(Index, H)|Tail]):-
    NextIndex is Index + 1,
    list_to_pairs(T, NextIndex, Tail).

% sort_pairs_by_value(+Pairs, -SortedPairs). Сортировка в порядке убывания.
sort_pairs_by_value(Pairs, SortedPairs):-
    predsort(compare_pairs, Pairs, SortedPairs).

% Сравнение пар элементов(для сортировки). compare_pairs(-Znak, (_, +Value1), (_, +Value2)).
compare_pairs(Znak, (_, Value1), (_, Value2)):-
    compare(Znak, Value2, Value1), write(compare(Znak, Value2, Value1)).

% Извлекаем индексы из списка пар. extract_index([(+Index, _)|+T], [-Index|-Tail]).
extract_index([], []).
extract_index([(Index, _)|T], [Index|Tail]):-
    extract_index(T, Tail).

% Предикат логики работы main(+N, -Indices).
main(N, Indices):-
    read_list(N, List), nl,
    write_list(List),
    list_to_pairs(List, Pairs),
    sort_pairs_by_value(Pairs, SortedPairs),
    extract_index(SortedPairs, Indices), nl.
    
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% 1.21 Дан целочисленный массив. Необходимо найти элементы, расположенные после первого максимального.
% Предикат логики работы main_two(+N, -Res).
main_two(N, Res):-
    read_list(N, List), nl,
    write_list(List),
    max_element(List, Max),
    elem_after_max(List, Max, Res).

% Предикат нахождения максимального элемента в списке max_element(+List, -Max).
max_element(List, Max):-
    max_element(List, -1, Max).

max_element([], Max, Max).
max_element([H|T], CurMax, Max):-
    (H > CurMax -> NewMax = H, max_element(T, NewMax, Max);
    NewMax = CurMax, max_element(T, NewMax, Max)).

% Предикат нахождения элементов, стоящих после максимального elem_after_max(+List, +Max, -Res).
elem_after_max([], _, []).
elem_after_max([H|T], Max, Res):-
    (   H < Max -> elem_after_max(T, Max, Res) ; Res = T).
    
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% 1.32 Дан целочисленный массив. Найти количество его локальных максимумов.
% Предикат логики работы main_three(+N, -Max).
main_three(N, Max):-
    read_list(N, List), nl,
    write_list(List),
    local_max(List, Max), nl,
    length(Max, Length), write(Length).

% Предикат для нахождения локального максимума local_max(+List, -Max).
local_max([],[]).
local_max([H|T], [H|MaxT]):-
    T = [H1|_],
    H > H1,
    local_max(T, MaxT).

% Если 1-ый < 2-го, то идем дальше по списку.
local_max([_|T], MaxT):-
    local_max(T, MaxT).
