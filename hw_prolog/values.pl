% Taken from seminars solutions
% my_contains(+Lst, +Elem).
my_contains([H|_], H).
my_contains([_|T], E) :- my_contains(T, E).

% values_in(+ToFind, +Universe).
values_in([], _).
values_in([H|T], Universe) :-
    my_contains(Universe, H),
    values_in(T, Universe).


% Tests
% values_in([], [1,2,3,4,5,6,7,8,9]). → true.
% values_in([1,2,3,2,1], [1,2,3,4,5,6,7,8,9]). → true.
% values_in([1,2,3,2,1], []). → false.
% values_in([], []). → true.
% values_in([aag,ppa,ag1,youShallNotPass,ma2], [ma2,aag,ppa,ag1]). → false.
% values_in([a,b,X,Y,c], [a,b,c]). →
% X = Y, Y = a ;
% X = a, Y = b ;
% X = a, Y = c ;
% X = b, Y = a ;
% X = Y, Y = b ;
% X = b, Y = c ;
% X = c, Y = a ;
% X = c, Y = b ;
% X = Y, Y = c ;
% false.
% length(Lst, 2), values_in(Lst, [1,2,3]). →
% Lst = [1, 1] ;
% Lst = [1, 2] ;
% Lst = [1, 3] ;
% Lst = [2, 1] ;
% Lst = [2, 2] ;
% Lst = [2, 3] ;
% Lst = [3, 1] ;
% Lst = [3, 2] ;
% Lst = [3, 3].
% findall(E, between(1, 16, E), Universe), length(Lst, 3), values_in(Lst, Universe). →
% Universe = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], Lst = [1, 1, 1] ;
% Universe = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], Lst = [1, 1, 2] ;
% Universe = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], Lst = [1, 1, 3] ;
% …
% Universe = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], Lst = [16, 16, 16].Universe = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], Lst = [16, 16, 16].