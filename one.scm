; call-by name compile to s,k,i
(define lat?
  (lambda (lat)
    (cond
     ((null? lat) #t)
     ((atom? (car lat)) (lat? (cdr lat)))
     (else #f))))
(define member?
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     ((equal? (car lat) a) #t)
     (else (member? a (cdr lat))))))
(define rember
  (lambda (a lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) a) (cdr lat))
     (else (cons (car lat)
		 (rember a (cdr lat)))))))

(define firsts
  (lambda (l)
    (cond
     ((null? l) (quote ()))
     (else (cons (car (car l))
		 (firsts (cdr l)))))))
(define insertR
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) old) (cons old (cons new (cdr lat))))
     (else (cons (car lat) (insertR new old (cdr lat)))))))

(define insertL
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) old) (cons new lat))
     (else (cons (car lat) (insertL new old (cdr lat)))))))


(define subst
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) old) (cons new (cdr lat)))
     (else (cons (car lat) (subst new old (cdr lat)))))))

(define subst2
  (lambda (new o1 o2 lat)
    (cond
     ((null? lat) (quote ()))
     ((or (eq? (car lat) o1) (eq? (car lat) o2)) (cons new (cdr lat)))
     (else (cons (car lat) (subst2 new o1 o2 (cdr lat)))))))

(define multirember
  (lambda (a lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) a) (multirember a (cdr lat)))
     (else (cons (car lat) (multirember a (cdr lat)))))))


(define multiinsertR
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) old)
      (cons old (cons new (multiinsertR new old (cdr lat)))))
     (else (cons (car lat) (multiinsertR new old (cdr lat)))))))

(define multiinsertL
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) old)
      (cons new (cons old (multiinsertL new old (cdr lat)))))
     (else (cons (car lat) (multiinsertL new old (cdr lat)))))))

(define multisubst
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) old) (cons new (multisubst new old (cdr lat))))
     (else (cons (car lat) (multisubst new old (cdr lat)))))))

(define add
  (lambda (n m)
    (cond
     ((zero? n) m)
     (else (+ 1
	      (add (- n 1) m))))))

(define sub
  (lambda (n m)
    (cond
     ((zero? m) n)
     (else (- 
	    (sub n (- m 1)) 1)))))

(define addtup
  (lambda (tup)
    (cond
     ((null? tup) 0)
     (else (+ (car tup) (addtup (cdr tup)))))))

(define multiply
  (lambda (n m)
    (cond
     ((zero? n) 0)
     (else (+ m (multiply (- n 1) m))))))

(define divide
  (lambda (n m)
    (cond
     ((zero? m) #f)
     ((< n m) 0)
     (else (+ 1 (divide (- n m) m)))))) 

(define tup+
  (lambda (tup1 tup2)
    (cond
     ((null? tup1) tup2)
     ((null? tup2) tup1)
     (else (cons
	    (+ (car tup1) (car tup2))
	    (tup+ (cdr tup1) (cdr tup2)))))))
(define greater
  (lambda (n m)
    (cond
     ((= n 0) #f)
     ((= m 0) #t)
     (else (greater (- n 1) (- m 1))))))

(define less
  (lambda (n m)
    (cond
     ((= n 0) #t)
     ((= m 0) #f)
     (else (less (- n 1) (- m 1))))))

(define equal
  (lambda (n m)
    (cond
     ((zero? m) (zero? n))
     ((or (zero? m) (zero? n)) #f)
     (else (equal (- n 1) (- m 1))))))

(define power
  (lambda (n m)
    (cond
     ((zero? m) 1)
     (else (* n (power n (- m 1))))))) 
(define length
  (lambda (lat)
    (cond
     ((null? lat) 0)
     (else
      (+ 1 (length (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
     ((= n 0) #f)
     ((= n 1) (car lat))
     (else (pick (- n 1) (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond
     ((zero? (- n 1)) (cdr lat))
     (else (cons (car lat)
		 (rempick (- n 1) (cdr lat)))))))

(define all-nums
  (lambda (lat)
    (cond
     ((null? lat) (quote ()))
     ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
     (else (all-nums (cdr lat)))))) 

(define no-nums
  (lambda (lat)
    (cond
     ((null? lat) (quote ()))
     ((number? (car lat)) (no-nums (cdr lat)))
     (else
      (cons (car lat) (no-nums (cdr lat)))))))

(define occur
  (lambda (lat)
    (cond
     ((null? lat) 0)
     ((number? (car lat)) (+ 1 (occur (cdr lat))))
     (else (occur (cdr lat))))))

(define occur
  (lambda (a lat)
    (cond
     ((null? lat) 0)
     ((eq? (car lat) a) (+ 1 (occur a (cdr lat))))
     (else (occur a (cdr lat))))))

(define one?
  (lambda (num)
    ((zero? (- 1 num)))))

(define one?
  (lambda (num)
    (= num 1)))

(define rempick
  (lambda (n lat)
    (cond
     ((null? lat) lat)
     ((zero? (- n 1)) (cdr lat))
     (else (cons
	    (car lat) (rempick (- n 1) (cdr lat)))))))

(define rember*
  (lambda (a l)
    (cond
     ((null? l) (quote ()))
     ((atom? (car l))
      (cond
       ((eq? (car l) a) (rember* a (cdr l)))
       (else (cons (car l)
		   (rember* a (cdr l))))))
     (else (cons (rember* a (car l)) (rember* a (cdr l)))))))


(define insertR*
  (lambda (new old l)
    (cond
     ((null? l) (quote ()))
     ((atom? (car l))
      (cond
       ((eq? (car l) old) (cons old (cons new (cdr l))))
       (else (cons (car l) (insertR* new old (cdr l))))))
     (else
      (cons (insertR* new old (car l))
	    (insertR* new old (cdr l)))))))

(define insertL*
  (lambda (new old l)
    (cond
     ((null? l) (quote ()))
     ((atom? (car l))
      (cond
       ((eq? (car l) old)
	(cons new
	      (cons old
		    (insertL* new old (cdr l)))))
       (else (cons (car l)
		   (insertL* new old (cdr l))))))
     (else (cons
	    (insertL* new old (car l))
	    (insertL* new old (cdr l)))))))

(define occur*
  (lambda (a lat)
    (cond
     ((null? lat) 0)
     ((eq? (car lat) a) (+ 1 (occur* a (cdr lat))))
     (else (occur* a (cdr lat))))))

(define occur*
  (lambda (a l)
    (cond
     ((null? l) 0)
     ((atom? (car l))
      (cond
       ((eq? (car l) a) (+ 1 (occur* a (cdr l))))
       (else
	(occur* a (cdr l)))))
     (else
      (+ (occur* a (car l)) (occur* a (cdr l)))))))

(define subst*
  (lambda (new old l)
    (cond
     ((null? l) (quote ()))
     ((atom? (car l))
      (cond
       ((eq? (car l) old)
	(cons new (subst* new old (cdr l))))
       (else (cons (car l) (subst* new old (cdr l))))))
     (else (cons (subst* new old (car l)) (subst* new old (cdr l)))))))


(define member*
  (lambda (a l)
    (cond
     ((null? l) (quote ()))
     ((atom? (car l))
      (cond
       ((eq? (car l) a) #t)
       (else (member* a (cdr l)))))
     (else (or
	    (member* a (car l)) (member* a (cdr l)))))))

(define leftmost
  (lambda (l)
    (cond
     ((atom? (car l)) (car l))
     (else (leftmost (car l))))))

(define eqlist?
  (lambda (l1 l2)
    (cond
     ((and (null? l1) (null? l2)) #t)
     ((or (null? l1) (null? l2)) #f)
     ((and (atom? (car l1)) (atom? (car l2)))
      (and (eq? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2))))
     ((or (atom? (car l1)) (atom? (car l2))) #f)
     (else (and (eqlist? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))))))



(define equal?
  (lambda (s1 s2)
    (cond
     ((and (atom? s1) (atom? s2)) (eq? s1 s2))
     ((or (atom? s1) (atom? s2)) #f)
     (else (eqlist? s1 s2)))))

(define rember
  (lambda (s l)
    (cond
     ((null? l) (quote ()))
     ((equal? (car l) s) (cdr l))
     (else (cons (car l) (rember s (cdr l)))))))


(define numbered
  (lambda (l)
    (cond
     ((atom? l) (number? l))
     ((eq? (car (cdr l)) (quote +))
      (and (number? (car l)) (number? (car (cdr (cdr l))))))
     ((eq? (car (cdr l)) (quote -))
      (and (number? (car l)) (number? (car (cdr (cdr l))))))
     ((eq? (car (cdr l)) (quote *))
      (and (number? (car l)) (number? (car (cdr (cdr l)))))))))

(define operational '(plus reduce ride except remainder involution square))

(define arithtic
  (lambda (s  l)
    (cond
     ((null? l) #f )
     ((atom? s)
      (or (eq? (car l) s) (arithtic s (cdr l))))
     (else #f))))

(define numbered?
  (lambda (exp)
    (cond
     ((null? exp) 'null)
     ((atom? exp) (numbere? exp)
     ((arithtic (car (cdr exp)) operational)
      (and (number? (car exp)) (number? (car (cdr (cdr exp))))))))))

(define cutl
  (lambda (e)
    (cond
     ((null? e) (quote ()))
     ((number? (car e)) (cons (car e) (cutl (cdr e)))))))

(define value
  (lambda (nexp)
    (cond
     ((atom? nexp) nexp)
     ((eq? (car nexp) (quote add))
      (+ (1st nexp) (2nd nexp)))
     ((eq? (car nexp) (quote reduce))
      (- (1st nexp) (2nd nexp)))
     ((eq? (car nexp) (quote ride))
      (* (1st nexp) (2nd nexp)))
     ((eq? (car nexp) (quote except))
      (/ (1st nexp) (2nd nexp)))
     (else
      (% (1st nexp) (2nd nexp))))))

(define 1st
  (lambda (exp)
    (value (car (cdr exp)))))

(define 2nd
  (lambda (exp)
    (value (car (cdr (cdr exp))))))


(define set?
  (lambda (lat)
    (cond
     ((null? lat) #t)
     ((member? (car lat) (cdr lat)) #f)
     (else
      (set? (cdr lat))))))

(define mkset
  (lambda (lat)
    (cond
     ((null? lat) (quote ()))
     ((member? (car lat) (cdr lat))
      (mkset (cdr lat)))
     (else
      (cons (car lat) (mkset (cdr lat)))))))

(define makeset
  (lambda (lat)
    (cond
     ((null? lat) (quote ()))
     (else (cons (car lat)
		 (makeset
		  (multirember (car lat) (cdr lat))))))))


(define subset?
  (lambda (set1 set2)
    (cond
     ((null? set1) #t)
     ((member? (car set1) set2)
      (subset? (cdr set1) set2))
     (else #f))))

(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
	 (subset? set2 set1))))

(define intersect?
  (lambda (set1 set2)
    (cond
     ((null? set1) #f)
     (else (or (member? (car set1) set2)
	 (intersect? (cdr set1) set2)J)))))

(define intersect
  (lambda (set1 set2)
    (cond
     ((null? set1) (quote ()))
     ((member? (car set1) set2)
      (cons (car set1) (intersect (cdr set1) set2)))
     (else
      (intersect (cdr set1) set2)))))

(define union
  (lambda (set1 set2)
    (cond
     ((null? set1) set2)
     ((member? (car set1) set2)
      (union (cdr set1) set2))
     (else
      (cons (car set1)
	    (union (cdr set1) set2))))))
(define supplement
  (lambda (set1 set2)
    (cond
     ((null? set1) (quote ()))
     ((member? (car set1) set2)
      (supplement (cdr set1) set2))
     (else
      (cons (car set1)
	    (cupplement (cdr set1) set2))))))

(define intersectall
  (lambda (l)
    (cond
     ((null? (cdr l)) (car l))
     (else
      (intersect (car l)
		 (intersectall (cdr l)))))))

(define  a-pair?
  (lambda (x)
    (cond
     ((null? x) #f)
     ((atom? x) #f)
     ((null? (cdr x)) #f)
     ((null? (cdr (cdr x))) #t)
     (else #f))))

(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define build
  (lambda (s1 s2)
    (cond
     (else (cons s1 (cons s2 (quote())))))))

(define third
  (lambda (p)
    (car (cdr (cdr p)))))

(define fun?
  (lambda (rel)
    (set? (firsts rel))))

(define revrel
  (lambda (rel)
    (cond
     ((null? rel) (quote ()))
     (else (cons (build
		  (second (car rel))
		  (first (car rel)))
		 (revrel (cdr rel)))))))

(define revpair
  (lambda (p)
    (cond
     (build (second p) (first p)))))

(define revrel
  (lambda (rel)
    (cond
     ((null? rel) (quote ()))
     (else (cons (revpair (car rel))
		 (revrel (cdr rel)))))))


(define fullfun?
  (lambda (fun)
    (set? (seconds fun))))

(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))))

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
       ((null? l) (quote ()))
       ((test? (car l) a) (cdr l))
       (else (cons (car l)
		   ((rember-f test?) a (cdr l))))))))

(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
       ((null? l) (quote ()))
       ((test? (car l) old)
	(cons new l))
       (else
	(cons (car l)
	      ((insertL-f test?) new old (cdr l))))))))

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
       ((null? l) (quote ()))
       ((test? (car l) old)
	(cons old (cons new
			(cdr l))))
       (else
	(cons (car l)
	      ((insertR-f test?) new old (cdr l))))))))

(define seqL
  (lambda (new old l)
    (cons new (cons old l))))

(define seqR
  (lambda (new old l)
    (cons old (cons new l))))

(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
       ((null? l) (quote ()))
       ((eq? (car l) old)
	(seq new old (cdr l)))
       (else
	(cons (car l)
	      ((insert-g seq) new old (cdr l))))))))

(define insertL-l
  (insert-g
   (lambda (new old l)
     (cons new (cons old l)))))

(define insertR-r
  (insert-g
   (lambda (new old l)
     (cons old (cons new l)))))

(define seqS
  (lambda (new old l)
    (cons new l)))

(define subst-n
  (insert-g
   (lambda (new old l)
     (cons new l))))

(define seqrem
  (lambda (new old l)
    l))

(define rember-n
  (insert-g seqrem))

;; The Ninth Commandment

;; Abstract common patterns with a enw function.

;; (define operational '(plus reduce ride except remainder involution square))

(define atom-to-function
  (lambda (x)
    (cond
     ((eq? x (quote +)) (quote plus))
     ((eq? x (quote -)) (quote reduce))
     ((eq? x (quote *)) (quote ride))
     ((eq? x (quote /)) (quote except))
     ((eq? x (quote %)) (quote remainder))
     ((eq? x (quote ^)) (quote involution))
     (else square))))

(define value
  (lambda (nexp)
    (cond
     ((atom? nexp) nexp)
     (else
      ((atom-to-function
	(operator nexp))
       (value (1st nexp))
       (value (2nd nexp)))))))

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond
       ((null? lat) (quote ()))
       ((test? (car lat) a)
	((multirember-f test?) a (cdr lat)))
       (else
	(cons (car lat)
	      ((multirember-f test?) a (cdr lat))))))))

(define eq?-tuna
  (eq?-c (quote tuna)))

(define multiremberT
  (lambda (test? lat)
    (cond
     ((null? lat) (quote ()))
     ((test? (car lat))
      (multiremberT test? (cdr lat)))
     (else
      (cons (car lat)
	    (multiremberT test? (cdr lat)))))))

(define multirember&co
  (lambda (a lat col)
    (cond
     ((null? lat) (col (quote ()) (quote ())))
     ((eq? (car lat) a)
      (multirember&co a
		     (cdr lat)
		     (lambda (newlat seen)
		       (col newlat
			    (cons (car lat) seen)))))
     (else
      (multirember&co a
		     (cdr lat)
		     (lambda (newlat seen)
		       (col (cons (car lat) newlat)
			    seen)))))))

(define a-friend
  (lambda (x y)
    (null? y)))

(define new-friend
  (lambda (newlat seen)
    (col newlat
	 (cons 'tuna seen))))

(define col a-friend)
(define last-friend
  (lambda (x y)
    (length x)))

(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond
     ((null? lat) (quote ()))
     ((eq? (car lat) oldL)
      (cons new (cons oldL
		      (multiinsertLR new oldL oldR (cdr lat)))))
     ((eq? (car lat) oldR)
      (cons oldR (cons new
		       (multiinsertLR new oldL oldR (cdr lat)))))
     (else
      (cons (car lat)
	    (multiinsertLR new oldL oldR (cdr lat)))))))

(define multiinsertLR&co
  (lambda (new oldL oldR lat col)
    (cond
     ((null? lat)
      (col (quote ()) 0 0))
     ((eq? (car lat) oldL)
      (multiinsertLR&co new oldL oldR (cdr lat)
			(lambda (newlat L R)
			  (col (cons new (cons oldL newlat)) (add1 L) R))))
     ((eq? (car lat) oldR)
      (multiinsertLR&co new oldL oldR (cdr lat)
			(lambda (newlat L R)
			  (col (cons oldR (cons new newlat)) L (add1 R)))))
     (else
      (multiinsertLR&co new oldL oldR (cdr lat)
			(lambda (newlat L R)
			  (col (cons (car lat) newlat) L R)))))))




(define even?
  (lambda (n)
    (cond
     ((= (- n 2) 0) #t)
     ((> (- n 2) 0)
      (even? (- n 2)))
     (else #f))))

(define even-only*
  (lambda (l)
    (cond
     ((null? l) (quote ()))
     ((atom? (car l))
      (cond
       ((even? (car l))
	(cons (car l)
	      (even-only* (cdr l))))
       (else
	(even-only* (cdr l)))))
     (else
      (cons (even-only* (car l))
	    (even-only* (cdr l)))))))

(define even-only*&co
  (lambda (l col)
    (cond
     ((null? l)
      (col (quote ()) 1 0))
     ((atom? (car l))
      (cond
       ((even? (car l))
	(even-only*&co (cdr l)
		       (lambda (newlat n m)
			 (col (cons (car l) newlat)
			      (* (car l) n) m))))
       (else
	(even-only*&co (cdr l)
		       (lambda (newlat n m)
			 (col newlat n (+ (car l) m)))))))
     (else
      ((even-only*&co (car l)
			   (lambda (al ap as)
			     (even-only*&co (cdr l)
					    (lambda (dl dp ds)
					      (col (cons al dl)
						   (* ap dp)
						   (+ as ds)))))))))))

(define the-last-friend
  (lambda (newlat product sum)
    (cons sum
	  (cons product
		newlat))))



(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))

(define keep-looking
  (lambda (a sorn lat)
    (cond
     ((number? sorn)
      (keep-looking a (pick sorn lat) lat))
     (else
      (eq? (car lat) a)))))

;((a b) (c d) (a (b (c d))))

(define shift
  (lambda (pair)
    (build (first (first pair))
	    (build (second (first pair))
		   (second pair)))))

(define align
  (lambda (pora)
    (cond
     ((atom? pora) pora)
     ((a-pair? (first pora))
      (align (shift pora)))
     (else (build (first pora)
		  (align (second pora)))))))


(define length*
  (lambda (pora)
    (cond
     ((atom? (first pora)) 1)
     (else
      (+ (length* (car pora))
	 (length* (cdr pora)))))))

(define weight*
  (lambda (pora)
    (cond
     ((atom? pora) pora)
     (else
      (+ (* (weight* (first pora)) 2)
	 (weight* (second pora)))))))

(define shuffle
  (lambda (pora)
    (cond
     ((atom? pora) pora)
     ((a-pair? (first pora))
      (shuffle (revpair pora)))
     (else
      (build (first pora)
	     (shuffle (second pora)))))))

(define C
  (lambda (n)
    (cond
     ((one? n) 1)
     (else
      (cond
       ((even? n) (C (+ n 2)))
       (else (C (+ 1 (* 3 n)))))))))

(define A
  (lambda (n m)
    (cond
     ((zero? n) (add1 m))
     ((zero? m) (A (sub1 n) 1))
     (else (A (sub1 n)
	      (A n (sub1 m)))))))

(define eternity
  (lambda (l)
    (eternity l)))

;; (define last-try
;;   (lambda (x)
;;     (and (will-stop? last-try)
;; 	 (eternity x))))

;; (define length
;;   (lambda (l)
;;     (cond
;;      ((null? l) 0)
;;      (else
;;       (+ 1 (length (cdr l)))))))

(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
			  (first entry)
			  (second entry)
			  entry-f)))

(define entry-f
  (lambda (x)
    (cons x '(not found))))
(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
     ((null? names) (entry-f name))
     ((eq? (car names) name)
      (car values))
     (else
      (lookup-in-entry-help name
			    (cdr names)
			    (cdr values)
			    entry-f)))))

(define extend-table cons)

(define lookup-in-table
  (lambda (name table table-f)
    (cond
     ((null? table) (table-f name))
     (else
      (lookup-in-entry name (car table)
		       (lambda (name)
			 (lookup-in-table name
					  (cdr table) table-f)))))))

(define expression-to-action
  (lambda (e)
    (cond
     ((atom? e) (atom-to-acton e))
     (else (list-to-action e)))))

(define atom-to-acton
  (lambda (e)
    (cond
     ((number? e) *const)
     ((eq? e #t) *const)
     ((eq? e #f) *const)
     ((eq? e (quote cons)) *const)
     ((eq? e (quote car)) *const)
     ((eq? e (quote cdr)) *const)
     ((eq? e (quote null?)) *const)
     ((eq? e (quote eq?)) *const)
     ((eq? e (quote atom?)) *const)
     ((eq? e (quote zero?)) *const)
     ((eq? e (quote add1)) *const)
     ((eq? e (quote sub1)) *const)
     ((eq? e (quote number?)) *const)
     (else *identifier))))

(define list-to-action
  (lambda (e)
    (cond 
     ((atom? (car e))
      (cond
       ((eq? (car e) (quote quote))
	*quote)
       ((eq? (car e) (quote lambda))
	*lambda)
       ((eq? (car e) (quote cond))
	*cond)
       (else *application)))
     (else *application))))

(define value
  (lambda (e)
    (meaning e (quote ()))))

(define meaning
  (lambda (e table)
    ((expression-to-action) e table)))

(define *const
  (lambda (e table)
    (cond
     ((number? e) e)
     ((eq? e #t) #t)
     ((eq? e #f) #f)
     (else (build (quote primitive) e)))))

(define *quote
  (lambda (e table)
    (text-of e)))

(define text-of second)


(define *identifier
  (lambda (e table)
    (lookup-in-table e table initial-table)))

(define initial-table
  (lambda (name)
    (car (quote ()))))

(define *lambda
  (lambda (e table)
    (build (quote non-primitive)
	   (cons table (cdr e)))))
(define table-of first)
(define formals-of second)
(define body-of third)


(define evcon
  (lambda (lines table)
    (cond
     ((else? (question-of (car lines)))
      (meaning (answer-of (car lines))
	       table ) )
     ((meaning (question-of (car lines))
	       table )
      (meaning (answer-of (car lines))
	       table))
     (else (evcon (cdr lines) table)))))

(define else?
  (lambda (x)
    (cond
     ((atom? x) (eq? x (quote else)))
     (else #f))))

(define question-of first)
(define answer-of second)

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))

(define cond-lines-of cdr)

(define evlis
  (lambda (args table)
    (cond
     ((null? args) (quote ()))
     (else
      (cons (meaning (car args)
		     table)
	    (evlis (cdr args) table))))))

(define *application
  (lambda (e table)
    (apply
     (meaning (function-of e) table)
     (evlis (arguments-of e) table))))

(define function-of car)
(define arguments-of cdr)

(define primitive?
  (lambda (l)
    (eq? (first l) (quote primitive))))

(define non-primitive?
  (lambda (l)
    (eq? (first l) (quote non-primitive))))

(define apply
  (lambda (fun vals)
    (cond
     ((primitive? fun)
      (apply-primitive (second fun) vals))
     ((non-primitive? fun)
      (apply-closure
       (second fun) vals)))))

(define apply-primitive
  (lambda (name vals)
    (cond
     ((eq? name (quote cons))
      (cons (first vals) (second vals)))
     ((eq? name (quote car))
      (car (first vals)))
     ((eq? name (quote cdr))
      (cdr (first vals)))
     ((eq? name (quote null?))
      (null? (first vals)))
     ((eq? name (quote eq?))
      (eq? (first vals) (second vals)))
     ((eq? name (quote zeor?))
      (zero? (first vals)))
     ((eq? name (quote add1))
      (add1 (first vals)))
     ((eq? name (quote sub1))
      (sub1 (first vals)))
     ((eq? name (quote number?))
      (number? (first vals))))))

(define atom?
  (lambda (x)
    (cond
     ((atom? x) #t)
     ((null? x) #f)
     ((eq? (car x) (quote primitive))
      #t)
     ((eq? (car x) (quote non-primitive))
      #t)
     (else #f))))

(define apply-closure
  (lambda (closure vals)
    (meaning (body-of closure)
	     (extend-table
	      (new-entry
	       (formals-of closure)
	       vals)
	      (table-of closure)))))

