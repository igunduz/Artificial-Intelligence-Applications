;1.a. prepositional formula
;IT IS TAUTOLOGY

(declare-const p Bool)
(declare-const q Bool)

(define-fun conjecture () Bool
  (or (implies p q) (implies q p))
)
(check-sat)
(get-value (conjecture))
