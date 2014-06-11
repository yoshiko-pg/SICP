; Exercise 1.11

; f(n) = n                          if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) otherwise.
; この関数fを再帰プロセスと反復プロセスで書け


; 再帰プロセス
(define (f n)
  ((if (< n 3) n)
   (else (+ (* 1 (f (- n 1)))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3)))))))


; 反復プロセス

; f(n)の値を考える

; 0  if n = 0 ((< n 3) n)
; 1  if n = 1 ((< n 3) n)
; 2  if n = 2 ((< n 3) n)
; 4  if n = 3 (+ (* 1 (f 2))  #-> (* 1 2)
;                (* 2 (f 1))  #-> (* 2 1)
;                (* 3 (f 0))) #-> (* 3 0)
; 11 if n = 4 (+ (* 1 (f 3))
;                (* 2 (f 2))
;                (* 3 (f 1)))
; 

gosh> (define (f n)
        (define (iter a b c count)
          (if (= count 0)
            a
            (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
        (iter 0 1 2 n))
gosh> (f 4)
11
gosh> (f 6)
59
