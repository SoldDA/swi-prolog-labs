% length - Функция для вычисления длины списка.

% retractall - предикат, который используется для удаления всех фактов
% или правил, которые соответствуют указанному шаблону.

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

problem('НВq'):- query('Ответьте на неважный вопрос 1').
problem('НВw'):- query('Ответьте на неважный вопрос 2').
problem('НВe'):- query('Ответьте на неважный вопрос 3').
problem('НВr'):- query('Ответьте на неважный вопрос 4').
problem('НВt'):- query('Ответьте на неважный вопрос 5').
problem('НВy'):- query('Ответьте на неважный вопрос 6').
problem('НВu'):- query('Ответьте на неважный вопрос 7').
problem('НВi'):- query('Ответьте на неважный вопрос 8').
problem('НВo'):- query('Ответьте на неважный вопрос 9').
problem('НВp'):- query('Ответьте на неважный вопрос 10').
problem('НВa'):- query('Ответьте на неважный вопрос 11').
problem('НВs'):- query('Ответьте на неважный вопрос 12').
problem('НВd'):- query('Ответьте на неважный вопрос 13').
problem('НВf'):- query('Ответьте на неважный вопрос 14').
problem('НВg'):- query('Ответьте на неважный вопрос 15').
problem('НВg'):- query('Ответьте на неважный вопрос 16').
problem('НВh'):- query('Ответьте на неважный вопрос 17').
problem('НВj'):- query('Ответьте на неважный вопрос 18').
problem('НВk'):- query('Ответьте на неважный вопрос 19').
problem('НВl'):- query('Ответьте на неважный вопрос 20').
problem('НВz'):- query('Ответьте на неважный вопрос 21').
problem('НВx'):- query('Ответьте на неважный вопрос 22').
problem('НВc'):- query('Ответьте на неважный вопрос 23').
problem('НВv'):- query('Ответьте на неважный вопрос 24').
problem('НВb'):- query('Ответьте на неважный вопрос 25').
problem('НВn'):- query('Ответьте на неважный вопрос 26').
problem('НВm'):- query('Ответьте на неважный вопрос 27').
problem('НВqq'):- query('Ответьте на неважный вопрос 28').
problem('НВww'):- query('Ответьте на неважный вопрос 29').
problem('НВee'):- query('Ответьте на неважный вопрос 30').
problem('НВrr'):- query('Ответьте на неважный вопрос 31').
problem('НВtt'):- query('Ответьте на неважный вопрос 32').
problem('НВyy'):- query('Ответьте на неважный вопрос 33').
problem('НВuu'):- query('Ответьте на неважный вопрос 34').
problem('НВii'):- query('Ответьте на неважный вопрос 35').
problem('НВoo'):- query('Ответьте на неважный вопрос 36').
problem('НВpp'):- query('Ответьте на неважный вопрос 37').
problem('НВaa'):- query('Ответьте на неважный вопрос 38').
problem('НВss'):- query('Ответьте на неважный вопрос 39').
problem('НВdd'):- query('Ответьте на неважный вопрос 40').
problem('НВff'):- query('Ответьте на неважный вопрос 41').
problem('НВgg'):- query('Ответьте на неважный вопрос 42').

fault('Собака'):-

    B = 'Это Собака',
    problem('Маленький'),
    problem('Популярность'),
    problem('Лай'),
    problem('НВq'),
    problem('НВw'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('НВe')).

fault('Кошка'):-
    B = 'Это кошка',
    problem('Маленький'),
    problem('Популярность'),
    problem('Мяу'),
    problem('НВr'),
    problem('НВt'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBy')).

fault('Тигр'):-
    B = 'Это Тигр',
    problem('Средний'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемКот'),
    problem('НВu'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBi')).


fault('Волк'):-
    B = 'Это Волк',
    problem('Средний'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемПес'),
    problem('НВo'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBp')).

fault('Шимпанзе'):-
    B = 'Это Шимпанзе',
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('Примат'),
    problem('НВa'),
    problem('НВs'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBd')).

fault('Манул'):-
    B = 'Это Манул',
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемКот'),
    problem('НВf'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBg')).

fault('Императорский Пингвин'):-
    B = 'Императорский Пингвин',
    problem('Средний'),
    problem('СемНеМорП'),
    problem('БелБрюх'),
    problem('Вес'),
    problem('НВh'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBj')).

fault('Королевский пингвин'):-
    B = 'Королевский Пингвин',
    problem('Средний'),
    problem('СемНеМорП'),
    problem('БелСер'),
    problem('МВес'),
    problem('НВk'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBl')).

fault('Очковый пингвин'):-
    B = 'Очковый Пингвин',
    problem('Маленький'),
    problem('СемНеМорП'),
    problem('БелЧернПолос'),
    problem('ОМВес'),
    problem('НВz'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBx')).

fault('Пингвин Адели'):-
    B = 'Пингвин Адели',
    problem('Маленький'),
    problem('СемНеМорП'),
    problem('БелЧернПятн'),
    problem('ОМВес'),
    problem('НВc'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBv')).

fault('Хохлатый пингвин'):-
    B = 'Хохлатый Пингвин',
    problem('Маленький'),
    problem('СемНеМорП'),
    problem('БелЧернКист'),
    problem('ОМВес'),
    problem('НВb'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBn')).

fault('Белый медведь'):-
    B = 'Белый Медведь',
    problem('Большой'),
    problem('Млекопитатель'),
    problem('Хищник'),
    problem('СемМед'),
    problem('НВm'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBqq')).

fault('Слон'):-
    B = 'Слон',
    problem('Большой'),
    problem('Млекопитатель'),
    problem('Суша'),
    problem('Бивни'),
    problem('НВww'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBee')).

fault('Лошадь'):-
    B = 'Лошадь',
    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемЛош'),
    problem('НМадагаскар'),
    problem('НВrr'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBtt')).

fault('Зебра'):-
    B = 'Зебра',
    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемЛош'),
    problem('Мадагаскар'),
    problem('НВyy'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBuu')).

fault('Носорог'):-
    B = 'Носорог',
    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемНос'),
    problem('НВii'),
    problem('НВoo'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBpp')).

fault('Жираф'):-
    B = 'Жираф',
    problem('Средний'),
    problem('Млекопитатель'),
    problem('СемЖир'),
    problem('Длинн'),
    problem('НВaa'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBss')).

fault('Крокодил'):-
    B = 'Крокодил',
    problem('Средний'),
    problem('Пресмыкатель'),
    problem('Хищник'),
    problem('Морда'),
    problem('НВdd'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBff')).

fault('Ёж'):-
    B = 'Ёж',
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('СемЁж'),
    problem('Иглы'),
    problem('НСтрел'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBgg')).

fault('Дикобраз'):-
    B = 'Дикобраз',
    problem('Маленький'),
    problem('Млекопитатель'),
    problem('СемЁж'),
    problem('Иглы'),
    problem('Стрел'),
    bagof(X, asked(X, y), L),
    length(L, A),
    (A =:= 5 -> !, nl, write(B), nl, fail ; problem('HBhh')).

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












