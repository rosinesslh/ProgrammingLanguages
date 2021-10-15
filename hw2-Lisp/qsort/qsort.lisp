
(defun cmp(n xs lft rgt)
(cond
  ((null xs) 
    (list lft rgt))
  ((or(< n (car xs))(equal n (car xs)))
    (cmp n (cdr xs) lft (append rgt (list(car xs)))))
  ((> n (car xs))
    (cmp n (cdr xs) (append lft (list(car xs))) rgt))))

(defun pivot (n xs)
  (cmp n xs nil nil))

(defun lftlist (n xs)
  (cond
    ((or (null n) (null xs)) nil)
    ((< n (car xs)) (lftlist n (cdr xs)))
    (t (cons (car xs) (lftlist n (cdr xs))))))

(defun rgtlist (n xs)
  (cond
    ((or (null n) (null xs)) nil)
    ((>= n (car xs)) (rgtlist n (cdr xs)))
    (t (cons (car xs) (rgtlist n (cdr xs))))))


(defun quicksort (xs)
  (cond 
    ((null xs) nil)
    (t 
      (append
        (quicksort (lftlist (car xs) (cdr xs)))
        (cons (car xs) nil) 
        (quicksort (rgtlist (car xs) (cdr xs)))))))