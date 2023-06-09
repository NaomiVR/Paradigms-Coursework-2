(module sn-graph racket
  (provide sn-consistent
           sn-empty
           sn-add-user
           sn-users
           sn-add-frndshp
           )

  ;; required libraries. (imported above)
  (require racket/dict)
  (require racket/set)

  (define (sn-consistent p) #t)

  ;; This simply creates the sn-empty variable as an empty list
  (define sn-empty
    (list))

  ;; This returns the list of unique users in the network
  (define (sn-users graph)
      dict-keys graph)


  ;; This first checks the existence of the user in the network, the if statement returns the inputted graph if true
  ;; if false the if statement will create a new constant using the graph and attatches a new list constant containing
  ;; the user
  (define (sn-add-user graph user)
    (if (member user (map car graph))
        graph
        (cons graph (list (cons user '())))
        )
  )

  ;; This takes in 2 user IDs and the network, it then appens these users as friends of
;; each other in the returned network
(define (sn-add-frndshp graph u1 u2)
  (define (update-friends key friends)
    (dict-update graph key (lambda (old-friends)
                             (set-union old-friends (list friends)))))
  (update-friends u1 (set u2))
  (update-friends u2 (set u1))
  (dict-map graph (lambda (k v) (list k (set->list v))))
  )


  )
