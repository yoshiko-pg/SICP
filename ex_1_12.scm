gosh> (define (pascal a b)
        (cond ((= b 1) 1)
              ((= a b) 1)
              (else (+ (pascal (- a 1) (- b 1)) (pascal (- a 1) b)))))

pascal
gosh> (pascal 4 3)
3
gosh> (pascal 5 3)
6
gosh> (pascal 10 10)
1
gosh> (pascal 6 3)
10

gosh> (pascal 1 1)
1
gosh> 
