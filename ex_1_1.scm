gosh> 10
10
gosh> (+ 5 3 4)
12
gosh> (- 9 1)
8
gosh> (/ 6 2)
3
gosh> (+ (* 2 4) (- 4 6))
6
gosh> (define a 3)
a
gosh> (define b (+ a 1))
b
gosh> (+ a b (* a b))
19
gosh> (= a b)
#f
gosh> (if (and (> b a) (< b (* a b)))
        b
        a)
4
gosh> (cond ((= a 4) 6)
            ((= b 4) (+ 6 7 a))
            (else 25))
16
gosh> (+ 2 (if (> b a) b a))
6
gosh> (* (cond ((> a b) a)
               ((< a b) b)
               (else -1))
         (+ a 1))
16
