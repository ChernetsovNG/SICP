(define (answer-without-breaking)
  (fixed-point (lambda (y) (/ (log 1000) (log y))) 1.5))

(define (answer-breaking)
  (fixed-point (lambda (y) (average y (/ (log 1000) (log y)))) 1.5))

(define (fixed-point f first-guess)
  (define tolerance 1e-5)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess number)
    (newline)
    (display "guess №")
    (display number)
    (display " = ")
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next (+ number 1)))))
  (try first-guess 1))

(define (average x y)
  (/ (+ x y) 2.0))

(define (abs x)
  (cond ((< x 0) (- x))
	((= x 0) 0)
	((> x 0) x)))
