; 立方根を求める cube-root を実装せよ
gosh> (define (cube-root guess x)
        (if (< (abs (- guess (improve guess x))) 0.001)
          guess
          (cube-root (improve guess x) x)))
cube-root
gosh> (define (improve guess x)
        (/ (+ (/ x (square guess)) (* guess 2)) 3))
improve
gosh> (define (square x) (* x x))
square
gosh> (define (cube x) (cube-root 1.0 x))
cube

gosh> (define (triple x) (* x x x))
triple
gosh> (define (test-3 x) (triple (cube x)))
test-3

gosh> (test-3 1000)
1000.0000435797309
gosh> (test-3 123456)
123456.0017619686
gosh> (test-3 9999999)
10000001.280166762

