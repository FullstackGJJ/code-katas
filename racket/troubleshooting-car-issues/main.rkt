#lang racket/base

(require readline/readline)
(require racket/match)

(struct node (type payload left right))

(define (traverse-decision-tree tree)
  (match (node-type tree)
    ["A" 
     (displayln (node-payload tree))]
    ["Q"
     (define input (readline (node-payload tree)))
     (match input
       ["Y"
        (traverse-decision-tree (node-left tree))]
       ["N"
        (traverse-decision-tree (node-right tree))]
       [_ 
        (displayln "Invalid input")])]))

(module+ main
  (require racket/cmdline)

  (define clean-terminals-answer (node "A" "Clean terminals and try starting again" #f #f))
  (define replace-cables-answer (node "A" "Replace cables and try again" #f #f))
  (define replace-battery-answer (node "A" "Replace the battery" #f #f))
  (define check-spark-plug-answer (node "A" "Check spark plug connections" #f #f))
  (define check-choke-answer (node "A" "Check to ensure the choke is opening and closing" #f #f))
  (define service-answer (node "A" "Get it in for service" #f #f))
  (define new-vehicle-answer (node "A" "Time for a new vehicle" #f #f))
  (define fuel-injection-question (node "Q" "Does your car have fuel injection? " check-choke-answer service-answer))
  (define engine-start-and-die-question (node "Q" "Does your engine start and then die? " fuel-injection-question new-vehicle-answer))
  (define crank-but-fail-start-question (node "Q" "Does your car crank up but fail to start? " check-spark-plug-answer engine-start-and-die-question))
  (define car-clicking-noise-question (node "Q" "Does the car  make a clicking noise? " replace-battery-answer crank-but-fail-start-question))
  (define battery-terminals-corroded-question (node "Q" "Are the battery terminals corroded? " clean-terminals-answer replace-cables-answer))
  (define car-silent-during-keyturn-question (node "Q" "Is the car silent when you turn the key? " battery-terminals-corroded-question car-clicking-noise-question))
  (displayln "Answer Y to indicate yes or N to indicate no")
  (traverse-decision-tree car-silent-during-keyturn-question))
