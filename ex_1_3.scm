gosh> (define (square_add a b c)
              (- (+ (double a) (double b) (double c))
                 (double (min a b c))
              )
      )
square_add
gosh> (define (double x) (* x x))
double
gosh> (square_add 3 8 4)
80
gosh> (square_add 33 84 92)
15520
gosh> (square_add 8 8 3)
128
