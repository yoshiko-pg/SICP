gosh> (define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))
sqrt-iter
gosh> (define (improve guess x)
        (average guess (/ x guess)))
improve
gosh> (define (average x y)
        (/ (+ x y) 2))
average
gosh> (define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
good-enough?
gosh> (define (sqrt x)
        (sqrt-iter 1.0 x))
sqrt
gosh> (define (square x) (* x x))
square
gosh> (sqrt 9)
3.00009155413138
gosh> (sqrt (+ 100 37))
11.704699917758145
gosh> (sqrt (+ (sqrt 2) (sqrt 3)))
1.7739279023207892
gosh> (square (sqrt 1000))
1000.000369924366
gosh> 
