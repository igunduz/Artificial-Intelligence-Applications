(define (domain robot)
(:requirements :strips)
(:predicates
    (robot ?x)
    (location ?x)
    (key ?x)
    (connected ?l1 ?l2)

    (at ?x ?y)
    (holding ?r ?k)
    (free ?l)
    (locked ?l ?k)

    (fuel ?f)
    (fuel-predecessor ?f1 ?f2)
    (fuel-level ?r ?f)
)

(:action move-robot
 :parameters (?r ?f ?t ?f1 ?f2)
 :precondition (and (robot ?r) (location ?f) (location ?t)
                    (fuel ?f1) (fuel ?f2)
                    (at ?r ?f) ;; robot is at location f
                    ;;(fuel-level ?r ?f1)
                    (Connected ?f ?t) ;; locations must be connected so we can move
		            ;;(not (at ?r2 ?t)) ;; there is no robot2 should be present on the destined location
		            (free ?t) ;; location must be free
		            (fuel-predecessor ?f1 ?f2)
		            (fuel-level ?r ?f2)
		          
               )
 :effect (and (not (free ?t)) ;; now that Robot moved to destined location, it's not free anymore
	       (free ?f) ;; the location of the robot before move is free now
	       (fuel-level ?r ?f1) ;; The current fuel level is f2 (After move)
	       (at ?r ?t) ;; robot is at the destined location now
	       (not (at ?r ?f))
	      (not (fuel-level ?r ?f2))
	       (free ?f)
         )
)

(:action take-key
 :parameters (?r ?k ?l)
 :precondition (and (robot ?r) (key ?k) (location ?l)
                (at ?r ?l) (at ?k ?l) ;; if robot and the key is at the same location
               ;;(not (holding ?r ?k)) ;;this is false because of we carry two keys at same time ;; robot is not holding the key
               )
 :effect (and (holding ?r ?k) ;; the robot holds the key
         (not (at ?k ?l)) ;; key is not at location l anymore
         )
)

(:action drop-key
 :parameters (?r ?k ?l)
 :precondition (and (robot ?r) (key ?k) (location ?l)
                (holding ?r ?k) ;; the robot holds the key
                (at ?r ?l) ;; robot must be at the final location
               )
 :effect (and (not (holding ?r ?k)) ;; the robot not holds the key
	      (at ?k ?l) ;; key is now at the final location
         )
)

(:action unlock
 :parameters (?r ?k ?f ?t)
 :precondition (and (robot ?r) (key ?k) (location ?f) (location ?t)
		            (at ?r ?f) ;; robot is at the location
		            (not ( free ?t))
                    (locked ?t ?k) (holding ?r ?k) ;; if the locations is locked and robot has the key, it can unlock
                    (connected ?f ?t)
               )
 :effect (and (not (locked ?t ?k))
	       (free ?t) ;; location is now free
	       
         )
)

)