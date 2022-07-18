;1.c. prepositional formula
;IT IS SATISFIABLE BUT NOT TOUTOLOGY


(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(define-fun conjecture () Bool
   (and (and (implies p r) (implies q r)) (not (and (not q) (or (not r) p))))
)


(check-sat)
(get-value (conjecture))
(get-model)

