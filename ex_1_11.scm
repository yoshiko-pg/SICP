; Exercise 1.11

; f(n) = n                          if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) otherwise.
; この関数fを再帰プロセスと反復プロセスで書け


; 再帰プロセス
gosh> (define (f n)
        (cond ((< n 3) n)
              (else (+
                      (f (- n 1))
                      (* 2 (f (- n 2)))
                      (* 3 (f (- n 3)))))))
f
gosh> (f 1)
1
gosh> (f 2)
2
gosh> (f 3)
4
gosh> (f 4)
11
gosh> (f 5)
25
gosh> (f 10)
1892


; 反復プロセス
; わからなかったので解答参照しました
; http://oss.timedia.co.jp/show/SICP/ex-1.11
gosh> (define (f-iter n)
        (define (iter a b c count)
          (cond ((= count 0) c)
                ((= count 1) b)
                (else (iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
        (iter 2 1 0 n))
f-iter
gosh> (f-iter 5)
25
gosh> (f-iter 10)
1892
