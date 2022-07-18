;;  true if a person order wine.
;;  false if a person order beer
;; every person declare is bool const. if person value is false it's means person ordering beer and if true it means person is ordering wine


(declare-const S Bool)
(declare-const B Bool)
(declare-const N Bool)
(declare-const G Bool)
(declare-const F Bool)
(declare-const L Bool)
(declare-const I Bool)


; Constraint 1: Everybody must order either beer, or wine.

(assert (or (or (not G) (not N) (not B) (not L) (not F) (not S) (not I))(or G N B L F S I)))

; Constraint 2: Seifred will definitely order a wine.
(assert S)

; Constraint 3: Bob orders a beer if and only if Frank orders a beer.
(assert (and 
      (implies (not B) (not F))
      (implies (not F) (not B))))


;; Contraint 4: If both Lise and Bob order a beer, then Natasha also orders a beer.
(assert (implies (and (not L) (not B)) (not N)))

;; Constraint 5. Either Gregor and Lise both order a beer, or they both order a wine.
(assert (or (and (not G)(not L))(and G L) ))

;; Constraint 6. If Frank orders a wine, then Gregor does not order a beer.
(assert (implies F G))

;; Constraint 7. At least one of Ivan, Gregor, and Lise orders a beer.
(assert (or (not I) (not G) (not L)))
;; Contraint 8. At least one of Ivan, Gregor, and Lise orders a beer.
(assert (and (implies  (not L) S)(implies S (not L))))




(check-sat)
(echo "Geogor order beer")
(get-value(G))
(echo "Natasha order beer")
(get-value(N))
(echo "Bob order beer")
(get-value(B))
(echo "Lise order beer")
(get-value(L))
(echo "Frank order beer")
(get-value(F))
(echo "Seifred order Wine")
(get-value(S))
(echo "Ivar order beer")
(get-value(I))


