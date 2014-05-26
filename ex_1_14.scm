; 1.2.2章 count-change
gosh> (define (count-change amount)  (cc amount 5))
count-change
gosh> (define (cc amount kind-of-coins)
        (cond ((= amount 0) 1)
              ((or (< amount 0) (= kind-of-coins 0)) 0)
              (else (+ (cc amount
                           (- kind-of-coins 1))
                       (cc (- amount
                              (first-denomination
                               kind-of-coins))
                           kind-of-coins)))))
cc
gosh> (define (first-denomination kind-of-coins)
        (cond ((= kind-of-coins 1) 1)
              ((= kind-of-coins 2) 5)
              ((= kind-of-coins 3) 10)
              ((= kind-of-coins 4) 25)
              ((= kind-of-coins 5) 50)))
first-denomination
gosh> (count-change 50)
50
gosh> (count-change 100)
292


; 課題1.14 11セントの両替を求める際のプロセスの木を図示せよ
gosh> (count-change 11)
4

(count-change 11)
(cc 11 5)
(cc 11 4) + (cc -39 5)
(cc 11 3) + (cc -14 4) + (cc -39 5)
(cc 11 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
(cc 11 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
(cc 11 0) + (cc 10 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + (cc 10 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + (cc 9 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + (cc 8 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + (cc 7 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + 0 + (cc 6 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + 0 + 0 + (cc 5 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + (cc 4 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + (cc 3 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + (cc 2 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + (cc 1 1) + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + (cc 6 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + (cc 6 1) + (cc 1 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + (cc 5 1) + (cc 1 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + (cc 4 1) + (cc 1 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + 0 + (cc 3 1) + (cc 1 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + 0 + 0 + (cc 2 1) + (cc 1 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + 0 + 0 + 0 + (cc 1 1) + (cc 1 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + 0 + 0 + 0 + 1 + (cc 1 2) + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + 0 + 0 + 0 + 1 + 1 + (cc 1 3) + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + 0 + 0 + 0 + 1 + 1 + 1 + (cc -14 4) + (cc -39 5)
0...0 + 1 + 0 + 0 + 0 + 0 + 0 + 1 + 1 + 1 + 0 + 0
= 4


; 記憶域：Θ(n)
; ステップ数：Θ(n^2)
