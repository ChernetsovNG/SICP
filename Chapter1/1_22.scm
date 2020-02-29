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
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (even? n)
  (= (remainder n 2) 0))
e
