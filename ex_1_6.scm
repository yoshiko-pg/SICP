(define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))
sqrt-iter
(define (improve guess x)
        (average guess (/ x guess)))
improve
(define (average x y)
        (/ (+ x y) 2))
average
(define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
good-enough?
(define (sqrt x)
        (sqrt-iter 1.0 x))
sqrt
(define (square x) (* x x))
square
(sqrt 9)
3.00009155413138
(sqrt (+ 100 37))
11.704699917758145
(sqrt (+ (sqrt 2) (sqrt 3)))
1.7739279023207892
(square (sqrt 1000))
1000.000369924366
(define (new-if predicate then-clause else-clause)
        (cond (predicate then-clause)
              (else else-clause)))
new-if
(new-if (= 2 3) 0 5)
5
(new-if (= 1 1) 0 5)
0
(define (sqrt-iter guess x)
        (new-if (good-enough? guess x)
                guess
                (sqrt-iter (improve guess x) x)))
sqrt-iter
; new-ifの場合、new-ifを展開する前に、new-ifに渡された第三引数(sqrt-iter (improve guess x) x)が評価され続けて無限ループに陥る。
; ifの場合は条件式(good-enough? guess x)が先に評価され、真の場合はguessが返されてsqrt-iterの評価が終わるので正常に処理を終了することができる。

