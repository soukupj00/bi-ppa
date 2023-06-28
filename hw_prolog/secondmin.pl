% Removes all occurances of second min from list
%without_second_min(+LIST, -RES)
without_second_min(LIST, RES) :-
    find_second_min(LIST, SECMIN),
    delete(LIST, SECMIN, RES),
    !.

% Function to find second min
% - finds minimum in original list
% - removes minimum from list, makes copy
% - finds new minimum (second) and returns it
%find_second_min(+LIST, -RESULT) :-
find_second_min(LIST, RES) :-
    min_list(LIST, MIN),
    delete(LIST, MIN, TMP),
    min_list(TMP, RES),
    !.

% Tests
% without_second_min([1,2,3,2,1], R). → R = [1,3,1].
% without_second_min([1,1], R). → false.
% without_second_min([1], R). → false.
% without_second_min([], R). → false.
% without_second_min([-5, -5, -5], R). → false.
% without_second_min([-5, -5, -10, -5, -10], R). → R = [-10, -10].