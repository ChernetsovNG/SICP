(define (search-for-primes a b)
  (search-for-primes-iter b a))

(define (search-for-primes-iter b n)
  (cond ((and (< n (+ b 1)) (not (even? n)))
	 (timed-prime-test n)
	 (search-for-primes-iter b (+ n 1)))
	((< n (+ b 1) (search-for-primes-iter b (+ n 1))))
	(else (display "\nend"))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (even? n)
  (= (remainder n 2) 0))

(define (next n)
  (cond ((= n 2) 3)
	(else (+ n 2))))
