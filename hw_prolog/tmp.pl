% numbers(+Lst, +Target)
numbers([], _) :- fail.
numbers(Lst, Target) :- member(Target, Lst).
numbers(Lst, Target) :-
    subsets_of_2(Lst, Res, Rest),
    Res = [First, Second],
    (
        (Sum is First + Second, numbers([Sum | Rest], Target));
        (Sub1 is First - Second, numbers([Sub1 | Rest], Target));
        (Sub2 is Second - First, numbers([Sub2 | Rest], Target));
        (Mul is First * Second, numbers([Mul | Rest], Target));
        (Second = 0, 0 is mod(First, Second), Div1 is First / Second, numbers([Div1 | Rest], Target));
        (First = 0, 0 is mod(Second, First), Div2 is Second / First, numbers([Div2 | Rest], Target))
    ).

subsets([], [], []).
subsets([H|T], Res, [H | Rest]) :-
    subsets(T, Res, Rest).

subsets([H|T], [H | Res], Rest) :-

    subsets(T, Res, Rest).

subsets_of_2(Lst, Res, Rest) :-
subsets(Lst, Res, Rest),
Res = [_,_].
