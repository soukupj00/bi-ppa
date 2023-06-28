% Player X can defend only when FIRST or LAST value in LIST is 'o'
% Uses ';' (logical or) for determining what to return
%can_x_defend(+LIST)
can_x_defend(LIST) :-
    is_first_o(LIST)
    ;
    is_last_o(LIST),
    !.

% Simple helper function to determine, whether the first element of list is 'o'
%is_first_o(+LIST).
is_first_o([H|_]) :- H == o.

% Simple helper function to determine, whether the last element of list is 'o'
%is_last_o(+LIST).
is_last_o([H]) :- H == o.
is_last_o([_|T]) :- is_last_o(T).


% Tests
% can_x_defend([o,o]). → true.
% can_x_defend([x,x]). → false.
% can_x_defend([x,x,o,o]). → true.
% can_x_defend([x,o,o,x,x,o,x,o,o,x]). → false.
% can_x_defend([o,o,x,x,x,x,o,o]). → true.
% can_x_defend([o,x,x,o,o,x,x,x,o]). → true.
% can_x_defend([x,o,x,x,o,x,o,x,x,o,x,x,o,x]). → false.