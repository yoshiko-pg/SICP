gosh> (define (cube x) (* x x x))
cube
gosh> (define (p x) (- (* 3 x) (* 4 (cube x))))
p
gosh> (define (sine angle)
        (if (not (> (abs angle) 0.1))
          angle
          (p (sine (/ angle 3.0)))))
sine
gosh> (trace sine)
#<closure (debug:trace-procedure debug:trace-procedure)>
gosh> (trace p)
#<closure (debug:trace-procedure debug:trace-procedure)>
gosh> (sine 12.15)
CALL sine 12.15
  CALL sine 4.05
    CALL sine 1.3499999999999999
      CALL sine 0.44999999999999996
        CALL sine 0.15
          CALL p 0.049999999999999996
          RETN p 0.1495
        RETN sine 0.1495
        CALL p 0.1495
        RETN p 0.4351345505
      RETN sine 0.4351345505
      CALL p 0.4351345505
      RETN p 0.9758465331678772
    RETN sine 0.9758465331678772
    CALL p 0.9758465331678772
    RETN p -0.7895631144708228
  RETN sine -0.7895631144708228
  CALL p -0.7895631144708228
  RETN p -0.39980345741334
RETN sine -0.39980345741334
-0.39980345741334

; a: 手続 p は (sine 12.15) を評価した時、何回適用されるか?
; -> 10回

; b:(sine a) が評価された時、sine 手続により生成されたプロセスにより使用された (a の関数としての) 記憶域とステップ数の増加の次数を求めよ。
; -> 記憶域：Θ(1)
; -> ステップ数：Θ(log 3)


gosh> (sine 20)
CALL sine 20
  CALL sine 6.666666666666667
    CALL sine 2.2222222222222223
      CALL sine 0.7407407407407408
        CALL sine 0.2469135802469136
          CALL p 0.0823045267489712
          RETN p 0.24468344522687335
        RETN sine 0.24468344522687335
        CALL p 0.24468344522687335
        RETN p 0.6754535556022294
      RETN sine 0.6754535556022294
      CALL p 0.6754535556022294
      RETN p 0.7936916849055475
    RETN sine 0.7936916849055475
    CALL p 0.7936916849055475
    RETN p 0.38114188833800355
  RETN sine 0.38114188833800355
  CALL p 0.38114188833800355
  RETN p 0.9219530491213116
RETN sine 0.9219530491213116
0.9219530491213116

gosh> (sine 66)
CALL sine 66
  CALL sine 22.0
    CALL sine 7.333333333333333
      CALL sine 2.444444444444444
        CALL sine 0.8148148148148148
          CALL p 0.0905349794238683
          RETN p 0.2686366285599314
          CALL p 0.2686366285599314
          RETN p 0.7283645506997508
        RETN sine 0.7283645506997508
        CALL p 0.7283645506997508
        RETN p 0.6394606104587308
      RETN sine 0.6394606104587308
      CALL p 0.6394606104587308
      RETN p 0.8724548050496879
    RETN sine 0.8724548050496879
    CALL p 0.8724548050496879
    RETN p -0.03900705947569394
  RETN sine -0.03900705947569394
  CALL p -0.03900705947569394
  RETN p -0.1167837735542067
RETN sine -0.1167837735542067
-0.1167837735542067

gosh> (sine 300)
CALL sine 300
  CALL sine 100.0
    CALL sine 33.333333333333336
      CALL sine 11.111111111111112
        CALL sine 3.703703703703704
          CALL p 0.045724737082761785
          RETN p 0.13679181498284637
          CALL p 0.13679181498284637
          RETN p 0.4001368508270681
          CALL p 0.4001368508270681
          RETN p 0.9441477089878672
          CALL p 0.9441477089878672
          RETN p -0.5340662017623155
        RETN sine -0.5340662017623155
        CALL p -0.5340662017623155
        RETN p -0.9928788272447971
      RETN sine -0.9928788272447971
      CALL p -0.9928788272447971
      RETN p 0.9365165339300328
    RETN sine 0.9365165339300328
    CALL p 0.9365165339300328
    RETN p -0.4759872192603569
  RETN sine -0.4759872192603569
  CALL p -0.4759872192603569
  RETN p -0.9965957025544238
RETN sine -0.9965957025544238
-0.9965957025544238

gosh> (sine 3000)
CALL sine 3000
  CALL sine 1000.0
    CALL sine 333.3333333333333
      CALL sine 111.1111111111111
        CALL sine 37.03703703703703
          CALL p 0.05080526342529085
          RETN p 0.1518912412149137
          CALL p 0.1518912412149137
          RETN p 0.44165662323039917
          CALL p 0.44165662323039917
          RETN p 0.9803706939817984
          CALL p 0.9803706939817984
          RETN p -0.8279297082487607
          CALL p -0.8279297082487607
          RETN p -0.21371315845436767
          CALL p -0.21371315845436767
          RETN p -0.6020955225125018
        RETN sine -0.6020955225125018
        CALL p -0.6020955225125018
        RETN p -0.9332022567308186
      RETN sine -0.9332022567308186
      CALL p -0.9332022567308186
      RETN p 0.45117138295644477
    RETN sine 0.45117138295644477
    CALL p 0.45117138295644477
    RETN p 0.9861602723106115
  RETN sine 0.9861602723106115
  CALL p 0.9861602723106115
  RETN p -0.8777303042071911
RETN sine -0.8777303042071911
-0.8777303042071911

gosh> (sine 30000)
CALL sine 30000
  CALL sine 10000.0
    CALL sine 3333.3333333333335
      CALL sine 1111.111111111111
        CALL sine 370.3703703703704
          CALL p 0.05645029269476764
          RETN p 0.16863133204732234
          CALL p 0.16863133204732234
          RETN p 0.48671283900938744
          CALL p 0.48671283900938744
          RETN p 0.9989500914380487
          CALL p 0.9989500914380487
          RETN p -0.9905640460090095
          CALL p -0.9905640460090095
          RETN p 0.9161415002089899
          CALL p 0.9161415002089899
          RETN p -0.3273016226618357
          CALL p -0.3273016226618357
          RETN p -0.841654352369729
          CALL p -0.841654352369729
          RETN p -0.14011171884497697
        RETN sine -0.14011171884497697
        CALL p -0.14011171884497697
        RETN p -0.4093328592887663
      RETN sine -0.4093328592887663
      CALL p -0.4093328592887663
      RETN p -0.9536581455192099
    RETN sine -0.9536581455192099
    CALL p -0.9536581455192099
    RETN p 0.6082960303555387
  RETN sine 0.6082960303555387
  CALL p 0.6082960303555387
  RETN p 0.9245514224011933
RETN sine 0.9245514224011933
0.9245514224011933