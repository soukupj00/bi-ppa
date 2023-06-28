#lang racket

;Helper function, determines whether two lists(intervals) are overlapping
(define (my-is-overlapping inter1 inter2)
  (if (or                                  ;inter2-start > inter1-end OR inter1-start > inter2-end
       (> (car inter2) (cadr inter1))
       (> (car inter1) (cadr inter2))
       )
      #f
      #t
      )
  )

;Counts occurrences of intersections for element in list
(define (my-intersections elem lst)
  (if (null? lst)
      -1                                           ;+1 when element is "intersecting" with itself(same position) in list, therefore decrease final count by 1 for "identity"
      (+
       (if (my-is-overlapping elem (car lst)) 1 0) ;With every overlapping occurrence increase count by 1, else 0
       (my-intersections elem (cdr lst))           ;Call for rest of list and add that to result
       )
      )
  )

;Returns list of intersections for each interval in given list
(define (intervals lst)
  (map (lambda (pair)
         (my-intersections pair lst) ;Iterates over every pair and calls my-intersection
         )
       lst
       )
  )

( (compose-chain `(,(lambda (e) (+ e 1)) ,(lambda (e) (* e 2))) ) 5) ;→ 11
( (compose-chain `(,(lambda (e) (* e 4)) ,(lambda (e) (+ e 2))) ) 6) ;→ 32
( (compose-chain `() ) 6) ;→ 6

;Tj. pro první příklad má být výstupem funkce proměnné e počítající (+ (* e 2) 1).
