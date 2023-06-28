% Returns true, if given trees are identical in structure
%bt_identical(+-Tree1, +-Tree2)
bt_identical(empty, empty).
bt_identical(t(_, L1, R1),t(_, L2, R2)) :- bt_identical(L1, L2), bt_identical(R1, R2).

% Tests
% bt_identical(empty, empty). → true.
% bt_identical(not_a_tree, empty). → false.
% bt_identical(t(1, empty, empty), t(2, empty, empty)). → true.
% bt_identical(t(1, t(2, empty, empty), empty), t(1, empty, empty)). → false.
% bt_identical(t(1, t(2, empty, empty), empty), Tree). → Tree = t(_, t(_, empty, empty), empty).
% bt_identical(t(1, t(2, empty, t(3, empty, t(4, empty, empty))), empty), t(2, Left, Right)). → Left = t(_, empty, t(_, empty, t(_, empty, empty))), Right = empty.
% bt_identical(t(4,3,2), Tree). → false.