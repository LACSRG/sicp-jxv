; Ex. 1.12 
;
; Rows and columns start at 1.

(define (pascal row col)
   (cond ((= col row) 1)
         ((= col 1) 1)
         ((+ (pascal (- row 1) (- col 1))    ; left
             (pascal (- row 1)    col  ))))) ; right

