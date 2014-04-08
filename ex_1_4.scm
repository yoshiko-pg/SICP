; bの絶対値とaを加えた値を返す。
; bが負の値ならオペレータをマイナスに、0以上ならプラスにする。
gosh> (define (a-plus-abs-b a b)
        ((if (> b 0) + -) a b))
a-plus-abs-b
gosh> (a-plus-abs-b 40 -22)
62
gosh> (a-plus-abs-b -55 20)
-35
gosh> (a-plus-abs-b 55 -20)
75

