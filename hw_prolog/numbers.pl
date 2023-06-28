% add(+NUM1, +NUM2, +-LST, +-TARGET)
add(NUM1, NUM2, LST, TARGET) :-
    ADD is NUM1 + NUM2,
    numbers([ADD | LST], TARGET).

% mul(+NUM1, +NUM2, +-LST, +-TARGET)
mul(NUM1, NUM2, LST, TARGET) :-
    MUL is NUM1 * NUM2,
    numbers([MUL | LST], TARGET).

% sub(+NUM1, +NUM2, +-LST, +-TARGET)
sub(NUM1, NUM2, LST, TARGET) :-
    SUB1 is NUM1 - NUM2,
    numbers([SUB1 | LST], TARGET).

% Check that NUM2 is not 0 and result of division is a whole number
% div(+NUM1, +NUM2, +-LST, +-TARGET)
div(NUM1, NUM2, LST, TARGET) :-
    not(NUM2 =:= 0),
    0 is mod(NUM1, NUM2),
    DIV1 is NUM1 / NUM2,
    numbers([DIV1 | LST], TARGET).

% Returns all subsets of 2 and rest of given list for each subset
% subsets_of2(+LST, - RES, -REST)
subsets_of2(LST, RES, REST) :-
    subsets(LST, RES, REST),
    RES = [_,_].

%Creates all subsets
subsets([], [], []).

subsets([H|T], RES, [H | REST]) :-
    subsets(T, RES, REST).

subsets([H|T], [H | RES], REST) :-
    subsets(T, RES, REST).

% Incorrect input
% numbers(+Lst, +Target)
numbers([], _) :- fail.

% Target values is present in provided list
% numbers(+Lst, +Target)
numbers(LST, TARGET) :-
    member(TARGET, LST).

% Create all possible options
% numbers(+Lst, +Target)
numbers(LST, TARGET) :-
    % Create all possible combinations of numbers in list and call on add_options on every pair
    subsets_of2(LST, RESPAIR, REST),
    RESPAIR = [NUM1, NUM2],
    % Try all possible arithmetic operations
    (
        add(NUM1, NUM2, REST, TARGET);
        sub(NUM1, NUM2, REST, TARGET);
        sub(NUM2, NUM1, REST, TARGET);
        mul(NUM1, NUM2, REST, TARGET);
        div(NUM1, NUM2, REST, TARGET)
    )
    .

% Tests
% numbers([7], 7). → true.
% numbers([1,2,3,7], 7). → true.
% numbers([], 1). → false.
% numbers([1,2,3], 7). → true. (protože 1 + 3 * 2 = 7)
% numbers([3,4,1,2], 7). → true. (protože 4 + 3 = 7)
% numbers([1,7,7,3], 24). → true. (protože (7 - 3) * (7 - 1) = 24)
% numbers([75, 50, 2, 3, 8, 7], 812). → true. (protože (50 + 8) * 7 * 2 = 812)
% numbers([50, 10, 6, 25, 100, 75], 50). → true. (protože 50 už máme přímo v seznamu, nebo také protože 100 - 50 = 50, 100 - 75 + 25 = 50, …))
% numbers([50, 10, 6, 25, 100, 75], 463). → true. (protože ((75 - (100 / 50)) * 6) + 25 = 463 nebo třeba (50 + 10) × 6 + 100 + (75 / 25) = 463)
% numbers([50, 10, 6, 25], 463). → false. (nejbližší možný výsledek je 465)
% numbers([50, 10, 6, 25], 17). → false.
% numbers([75,75,10,8,10], 998). → false.