; Ex. 1.16
;

(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2)))) 
        (else (* b (fast-expt b (- n 1))))))


; Placement of the `square call' is eqv. to the previous version.
;   For example, (square (expt 10 4)) == (expt (square 10) (/ 4 2))
(define (fast-expt-2 b n)
  (cond ((= n 0) 1)
        ((even? n) (fast-expt-2 (square b) (/ n 2))))
        (else (* b (fast-expt-2 b (- n 1)))))

; Remember the previous product's state by passing it as an arg.
;
; Because the `even? test' line only simplifies the expt,
;   don't multiply by the product.
;
; Else, apply a multiplication.
(define (fast-expt-iter base num)
  (define (iter b n p)
    (cond ((= n 0) p)
          ((even? n) (iter (square b) (/ n 2) p))
          (else (iter b (- n 1) (* p b)))))
  (iter base num 1))

