(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

(define (inc x)
  (+ x 1))

(define (inc2 x)
  (+ x 2))

(define (identity x) x)

(define (factorial n)
     (product identity 1 inc n))

#|
  pi/4 = (2 * 4 * 4 * 6 * 6 * 8 * ... ) / (3 * 3 * 5 * 5 * 7 * 7 * ... )
|#
(define (pi n)
  (define numer
    (product identity 4 inc2 n))
  (define denom
    (product identity 3 inc2 (- n 1)))
  (* 4.0
     (/ (* 2.0 (square numer))
	(* (square denom) (+ n 1)))))

(define (square x)
  (* x x))
