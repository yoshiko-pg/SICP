; sqrt-iter (guessの二乗とxの差が0.001以下なら許容)
gosh> (define (square x) (* x x))
square
gosh> (define (average x y) (/ (+ x y) 2))
average
gosh> (define (improve guess x) (average guess (/ x guess)))
improve
gosh> (define (sqrt-iter guess x)
        (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
sqrt-iter
gosh> (define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
gosh> good-enough?
gosh> (define (sqrt x) (sqrt-iter 1.0 x))
sqrt

gosh> (define (test x) (square (sqrt x)))
test

; 大きい数
gosh> (test 999999999)
999999999.0000159
gosh> (test 1000000000)
1.0000000000000161e9

; 小さい数
gosh> (test 0.1)
0.10001125566203942
gosh> (test 0.01)
0.01006526315785885
gosh> (test 0.002)
0.002513152551653305
gosh> (test 0.001)
0.0017011851721075596
gosh> (test 0.0009)
0.0016241401856992538 ; 0.001を下回る辺りから誤差が目立つ
gosh> (test 0.0005)
0.001325348019146404
gosh> (test 0.0001)
0.0010438358335233748

; square-root を設計せよ
gosh> (define (sqrt-root guess x)
        (if (< (abs (- guess (improve guess x))) 0.001)
          guess
          (sqrt-root (improve guess x) x))
        )
sqrt-root
gosh> (define (sqrt x) (sqrt-root 1.0 x))
sqrt

; 大きい数（sqrt-iterと同じ結果）
gosh> (test 999999999)
999999999.0000159
gosh> (test 1000000000)
1.0000000000000161e9

; 小さい数（sqrt-iterよりもより良く働く）
gosh> (test 0.1)
0.10001125566203942
gosh> (test 0.01)
0.01006526315785885
gosh> (test 0.002)
0.0020261947430424655
gosh> (test 0.001)
0.0010012171682319481
gosh> (test 0.0009)
9.016608107957646e-4
gosh> (test 0.0005)
5.065676073392379e-4
gosh> (test 0.0001)
1.0241881976244732e-4

