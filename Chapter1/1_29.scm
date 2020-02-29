(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x (* 2 h)))
  (* (/ h 3)
     (+ (f a)
	(* 4 (sum f (+ a h) add-2h (- b (* 3 h))))
	(* 2 (sum f (+ a (* 2 h)) add-2h (- b (* 2 h))))
	(* 4 (f (- b h)))
	(f b))))

(define (h a b n)
  (/ (- b a) n))

(define (cube x)
  (* x x x))
