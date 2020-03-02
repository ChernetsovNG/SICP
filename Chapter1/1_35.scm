(define (fi)
  (fixed-point (lambda (y) (+ 1 (/ 1 y))) 1.0))

(define (fixed-point f first-guess)
  (define tolerance 1e-9)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2.0))

(define (abs x)
  (cond ((< x 0) (- x))
	((= x 0) 0)
	((> x 0) x)))
