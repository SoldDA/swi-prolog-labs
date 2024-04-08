% Вариант - 4. 
Эйлер выяснил, что многочлен n^2+n+41 порождает простые числа для всех n=0..39. 
Среди произвольных многочленов с целыми коэффициентами n^2+an+b, где коэффициенты по модулю меньше 1000 
найти такой многочлен, который будет порождать максимальное количество простых чисел, начиная с n=0.
Вывести произведение его коэффициентов. Задача должна быть решена без использования списков.

% Предикат для проверки простоты числа. is_prime(+N)
is_prime(N) :-
    N > 1,
    \+ has_factor(N, 2).

% Вспомогательный предикат для проверки наличия делителя
has_factor(N, D) :-
    N mod D =:= 0.

% Предикат для генерации многочлена. 
% generate_polynomial(+A, +B, +N, - Polynominal).
generate_polynomial(A, B, N, Polynomial) :-
    Polynomial is A*N*N + A*N + B.


% Предикат для подсчета простых чисел, генерируемых многочленом. count_primes(+A, +B, -Count).
count_primes(A, B, Count) :-
    count_primes_helper(A, B, 0, 39, 0, Count).

count_primes_helper(_, _, N, MaxN, Count, Count) :-
    N > MaxN.
count_primes_helper(A, B, N, MaxN, Acc, Count) :-
    N =< MaxN,
    generate_polynomial(A, B, N, Polynomial),
    (Polynomial > 0, is_prime(Polynomial) -> NewAcc is Acc + 1 ; NewAcc = Acc),
    NextN is N + 1,
    count_primes_helper(A, B, NextN, MaxN, NewAcc, Count).

% Главный предикат
solve_task :-
    findall(Count-A-B, (between(0, 999, A), between(0, 999, B), count_primes(A, B, Count)), Results),
    max_member(Count-A-B, Results),
    write('Коэффициенты: '), write(A), write(' * '), write(B), nl,
    write('Произведение коэффициентов: '), write(A*B), nl.
