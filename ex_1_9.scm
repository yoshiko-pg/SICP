; slib読み込み
gosh> (use slib)
#<undef>
gosh> (require 'trace)
#t

; 必要な関数の定義
gosh> (define (inc x) (+ x 1))
inc
gosh> (define (dec x) (- x 1))
dec


; 前者の+定義
gosh> (define (+ a b)
        (if (= a 0) b (inc (+ (dec a) b))))
+
gosh> (trace +)
#<closure (debug:trace-procedure debug:trace-procedure)>

gosh> (+ 4 5)
CALL + 4 5
  CALL + 3 5
    CALL + 2 5
      CALL + 1 5
        CALL + 0 5
        RETN + 5
      RETN + 6
    RETN + 7
  RETN + 8
RETN + 9
9

; (+ 4 5)の評価プロセスを順に記す
; プロセスの種類：再帰プロセス
; 自身で呼び出した自身(+)の返り値に計算を加えている
;
; メモ：inc内の+はデフォルトの動作（inc定義時の+の動作）をする。
; 新しく定義した動作が使用されていれば(inc 1)が循環して無限ループに入ってしまうが、そうならない。
; 試しに+を定義したあとでincを再定義して(+ 4 5)を実行したところ、無限ループに入った。
; 関数の中で使う自由変数は、その関数が定義された時の内容が保持されるようだ。クロージャを思い出す。  
(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ (- 4 1) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ (- 3 1) 5)))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ (- 2 1) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ (- 1 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc (+ 5 1))))
(inc (inc (inc 6)))
(inc (inc (+ 6 1)))
(inc (inc 7))
(inc (+ 7 1))
(inc 8)
(+ 8 1)
9


; 後者の+定義
gosh> (define (+ a b)
        (if (= a 0) b (+ (dec a) (inc b))))
+

gosh> (+ 4 5)
CALL + 4 5
  CALL + 3 6
    CALL + 2 7
      CALL + 1 8
        CALL + 0 9
        RETN + 9
      RETN + 9
    RETN + 9
  RETN + 9
RETN + 9
9

; (+ 4 5)の評価プロセスを順に記す
; プロセスの種類：反復プロセス
; 展開も縮小もしていない
; 自身で呼び出した自身(+)の返り値に計算を加えていない
(+ 4 5)
(+ (dec 4) (inc 5))
(+ (- 4 1) (+ 5 1))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ (- 3 1) (+ 6 1))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ (- 2 1) (+ 7 1))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ (- 1 1) (+ 8 1))
(+ 0 9)
9
