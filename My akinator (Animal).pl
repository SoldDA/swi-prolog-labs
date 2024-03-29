main :-
    nl, write('Тема - животные.'), nl,
    retractall(asked(_,_)), fault(Problem),
    !,
    nl,
    write('Это '), write(Problem), write(.), nl.
main :- write('Игра окончена'), nl.


problem('Маленький'):- query('Оно небольшого размера?').
problem('Популярность'):- query('Это популярное животное?').
problem('Лай'):- query('Оно умеет гавкать?').

problem('Мяу'):- query('Оно умеет мяукать?').

problem('Средний'):- query('Он среднего размера?').
problem('Млекопитатель'):- query('Это животное является млекопитающим?').
problem('Хищник'):- query('Он хищник?').
problem('СемКот'):- query('Оно из семейства кошачьих?').

problem('СемПес'):- query('Оно из семейства псовых?').

problem('Примат'):- query('Оно из отряда приматов?').

problem('СемНеМорП'):- query('Оно из семейства нелетающих морских птиц?').
problem('БелБрюх'):- query('У этого животного белое брюшко и черная голова с телом?').
problem('Вес'):- query('У этого животного вес колеблется между 22 и 45 кг?').

problem('БелСер'):- query('У этого животного серая спинка, по бокам черной головы и на груди крупные яркие оранжевые пятна?').
problem('МВес'):- query('Это животное весит до 15 кг?').

problem('БелЧернПолос'):- query('У этого животного белое брюшко, черная спинка и на груди вплоть до лап узкая черная полоса в виде подковы?').
problem('ОМВес'):- query('У этого животного маленький вес, примерно от 3 - 5 кг?').

problem('БелЧернПятн'):- query('Это животное имеет белое брюшко, черную голову, шею, спину и ласты вместе с белым кольцом, вокруг глаз?').

problem('БелЧернКист'):- query('Это животное имеет окрас - белый снизу и голубовато-черный сверху, а также желтоватые брови, которые оканчиваются кисточками?').

problem('Большой'):- query('Оно большого размера?').
problem('СемМед'):- query('Оно из семейства медвежьих?').

problem('Бивни'):- query('У него есть бивни?').
problem('Суша'):- query('Он обитает на суше?').

problem('СемЛош'):- query('Оно из семейства лошадиных?').
problem('Мадагаскар'):- query('Это животное было в мультфильме Мадагаскар как один из главных героев?').
problem('НМадагаскар'):- query('Этого животного не было в мультфильме Мадагаскар?').

problem('СемНос'):- query('Это животное из семейства носороговых?').

problem('СемЖир'):- query('Это животное из семейства жирафовых?').
problem('Длинн'):- query('Это животное имеет длинную шею?').

problem('Пресмыкатель'):- query('Это животное относится к классу пресмыкающихся').
problem('Морда'):- query('У этого животного вытянутая и приплюснутая морда?').

problem('СемЁж'):- query('Это животное из семейства Ежовых?').
problem('Иглы'):- query('У этого животное есть иглы?').
problem('Стрел'):- query('Это животное стреляет иглами?').
problem('НСтрел'):- query('Это животное не стреляет иглами?').

fault('Собака'):-
    problem('Маленький'),
    problem('Популярность'),
    problem('Лай'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 3, !.

fault('Кошка'):-
    problem('Маленький'),
    problem('Популярность'),
    problem('Мяу'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 3, !.

fault('Тигр'):-
    problem('Средний'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемКот'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.


fault('Волк'):-
    problem('Средний'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемПес'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Шимпанзе'):-
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('Примат'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 3, !.

fault('Манул'):-
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемКот'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Императорский Пингвин'):-
    problem('Средний'),
    problem('СемНеМорП'),
    problem('БелБрюх'),
    problem('Вес'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Королевский пингвин'):-
    problem('Средний'),
    problem('СемНеМорП'),
    problem('БелСер'),
    problem('МВес'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Очковый пингвин'):-
    problem('Маленький'),
    problem('СемНеМорП'),
    problem('БелЧернПолос'),
    problem('ОМВес'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Пингвин Адели'):-
    problem('Маленький'),
    problem('СемНеМорП'),
    problem('БелЧернПятн'),
    problem('ОМВес'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Хохлатый пингвин'):-
    problem('Маленький'),
    problem('СемНеМорП'),
    problem('БелЧернКист'),
    problem('ОМВес'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Белый медведь'):-
    problem('Большой'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемМед'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Слон'):-
    problem('Большой'),
    problem('Млекопитатель'),
    problem('Суша'),
    problem('Бивни'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Лошадь'):-
    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемЛош'),
    problem('НМадагаскар'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Зебра'):-
    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемЛош'),
    problem('Мадагаскар'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Носорог'):-

    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемНос'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 3, !.

fault('Жираф'):-
    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемЖир'),
    problem('Длинн'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Крокодил'):-
    problem('Средний'),
    problem('Пресмыкатель'),
    problem('Хищник'),
    problem('Морда'),

    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4, !.

fault('Ёж'):-
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('СемЁж'),
    problem('Иглы'),
    problem('НСтрел'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 5, !.

fault('Дикобраз'):-
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('СемЁж'),
    problem('Иглы'),
    problem('Стрел'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 5, !.

% assert - предикат, который используется для динамического добавления
% фактов в базу знаний во время выполнеения программы.
query(Prompt) :-
    (
        asked(Prompt, Reply) -> true;
        nl, write(Prompt), write(' (y/n)? '), read(X),
        (X = y -> Reply = y; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.
