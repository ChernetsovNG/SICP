(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum-rec term a next b)
  (accumulate-rec + 0 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-rec term a next b)
  (accumulate-rec * 1 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (identity x) x)

(define (inc x) (+ x 1))
