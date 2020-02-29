|#
  Процедура вычисления числа Фибоначчи за логарифмическое число шагов
#|

(define (fib n)
  (fib-iter 1 0 0 1 n))

|#
  Двухкратное применение трансформации T(p,q) аналогично однократному применению T(p',q'), где:
  p' = p^2 + q^2
  q' = q^2 + 2*p*q
#|
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (* p p) (* q q))
		   (+ (* q q) (* 2 p q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))

;для проверки определим итеративную процедуру
(define (fib2 n)
  (fib-iter2 1 0 n))

(define (fib-iter2 a b count)
  (if (= count 0)
      b
      (fib-iter2 (+ a b) a (- count 1))))
