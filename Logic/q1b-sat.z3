;1.b. prepositional formula
;IT IS SATISFIABLE BUT NOT TOUTOLOGY


(declare-const p Bool)
(declare-const r Bool)

(define-fun conjecture () Bool
   (implies r (and (or r p) (not p)))
)


(check-sat)
(get-value (conjecture))
(get-model)


