;1.d. prepositional formula
;iff is translated to two implications
; ITS A TAUTOLOGY

(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(define-fun conjecture () Bool
   (or (and (implies (or p q) r) (implies r (or p q))) (or (not r) (not p)))
)

(check-sat)
(get-value (conjecture))

