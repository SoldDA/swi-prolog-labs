man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,bogomil).
parent(bratislava,bogomil).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).


men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.

% Вариант - none Пункт 1
% Построить предиикат children(+X), который выводит всех детей X.
children(X):- parent(X,Y), print(Y), nl, fail.

% Построить предикат mother(?X,?Y), который проверяет, является ли X
% матерью Y. Построить предикат, mother(-X), который выводит маму X.
mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.

% Построить предикат brother(?X,?Y), который проверяет, является ли X
% братом Y. Построить предикат brother(-X), который выводит всех братьев X.
brother(X,Y):- parent(K,Y), parent(K,X), man(X), man(K).
brothers(X):- brother(Y,X), print(Y), nl, fail.

% Построить предикат b_s(?X,?Y), который проверяет, являются ли X и Y
% родными братом и сестрой или братьями или сестрами. Построить предикат
% b_s(-X), который выводит всех братьев или сестер X.
b_s(X,Y):- parent(K,X), parent(K,Y), X\=Y.
b_s(X):- b_s(X,Y), print(Y), nl, fail.

b_s1(X,Y):- parent(K,X), parent(K,Y), X\=Y, !.
b_s1(X):- b_s1(X,Y), print(Y), nl, fail.



% Вариант 4 Пункт 2
% Построить предикат father(?X,?Y), который проверяет,
% является ли X отцом Y. Построить предикат, father(X), который выводит
% отца X.
father(X,Y):- man(X), parent(X,Y).
father(X):- father(Y,X), print(Y), nl, fail, !.

% Построить предикат wife(+X,?Y), который проверяет, является ли X
% женой Y. Построить предикат wife(X), который выводит жену X.
wife(X,Y):- father(Y,K), mother(X,K), woman(X), !.
wife(X):- wife(Y,X), print(Y), nl, fail.



% Вариант 4 Пункт 3
% Построить предикат grand_da(?X,?Y), который проверяет, является ли X
% внучкой Y. Построить предикат grand_dats(X), который выводит всех
% внучек X.
grand_da(X,Y):- parent(Y,Z), father(Z,X), woman(X).
grand_da(X,Y):- parent(Y,Z), mother(Z,X), woman(X).
grand_dats(X):- grand_da(X,Y), print(Y), nl, fail.

% Построить предикат grand_pa_and_da(+X,+Y), который проверяет, являются
% ли X и Y дедушкой и внучкой или внучкой и дедушкой.
grand_pa_and_da(X,Y):- parent(Y,Z), father(Z,X), woman(X); parent(Y,Z), mother(Z,X), woman(X), !.

% Построить предикат, который проверяет, является ли X тетей Y.
% Построить предикат, который выводит всех тетей X.
sister(X,Y):- parent(Z,X), parent(Z,Y), woman(X).
aunt(X,Y):- woman(X), father(Z,Y), sister(X,Z).
aunt(X):- aunt(Y,X), print(Y), nl, fail.
