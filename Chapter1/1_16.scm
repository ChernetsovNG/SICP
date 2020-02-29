#|
Итеративный процесс для возведения в степень за логарифмическое время
(например, 2^10 = 4^5 = 4*4^4 = 4*16^2 = 4*256^1 = 1024)
|#

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b n a)
  ;(print "\nexpt-iter was called with the arguments: b = " b ", n = " n ", a = " a "\n")
  (if (= n 0)
      a
      (cond (even? n) (expt-iter (* b b) (/ n 2) a)
	    (else (expt-iter b (- n 1) (* a b))))))

(define (even? n)
  ;(print "\nprint was called with the argument: n = " n "\n")
  (= (remainder n 2) 0))

(define (print . args)
  (cond ((not (null? args))
	 (display (car args))
	 (apply print (cdr args)))))

(expt 2 100)
