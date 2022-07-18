; Testing 1.e. prepositional formula
; IT IS UNSATISFIABLE

(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

    (assert (and (and p q) (implies q (not r))  (implies p r) (implies (not q) r)))

(check-sat)
