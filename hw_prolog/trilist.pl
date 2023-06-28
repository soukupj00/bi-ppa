%splitInto2(L, A, B) :-
%    append(A, B, L),
%    length(A,N),
%    length(B,N).

% Helper function to determine, whether list can be split into 3 equal parts
listLenTImes3([]).
listLenTImes3([_,_,_ | T]) :- listLenTImes3(T).

% Splits List into 3 equal parts (sublists)
splitInto3(L, A, B, C) :-
    listLenTImes3(L),
    !,
    append(A, B, TMP),
    append(TMP, C, L),
    length(A,N),
    length(B,N),
    length(C,N),
    !.

% Helper function which determines whether two lists are equal
listEqual([], []).
listEqual([H1|T1], [H2|T2]) :-
    H1 = H2,
    listEqual(T1, T2).

% Returns true if list is composed of exactly 3 same sequences
%trilist(+-LST)
trilist([]) :- !.
trilist(LST) :-
    splitInto3(LST, A, B, C),
    listEqual(A, B),
    listEqual(B, C),
    !.

% Tests
% trilist([a,2,a,2,a,2]). → true.
% trilist([1,2,1,2]). → false.
% trilist([1,2,1,2,1,2,1,2]). → false.
% trilist([1,2,3,1,2,4]). → false.
% trilist([1,2,3,4,5,1,2,3,4,5,1,2,3,4,5]). → true.
% trilist([1,1,1]). → true.
% trilist([]). → true.
% trilist([1,1]). → false.
% trilist([1]). → false.
% trilist([1,X,1,X,1,X]). → true.
% trilist([1,X,1,X]). → false.
% trilist([1,X,1,X,Y,2]). → X = 2, Y = 1.