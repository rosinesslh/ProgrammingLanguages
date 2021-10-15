(defun findMin (xs min)
    (cond ((null xs) 
            min) 
 ((not (null xs))            
  (if (> min (car xs)) (findMin (cdr xs) (car xs)) (findMin (cdr xs) min)))))

(defun findMean (xs sum len)
    (cond((null xs)
            (/ sum len))
        ((not (null xs))
            (setq sum1 (+ sum (car xs)))
            (setq len1 (+ len 1))
            (setq xs1 (cdr xs))
            (findMean xs1 sum1 len1))))

(defun findMax (xs max)
    (cond ((null xs) 
            max)
        ((not (null xs))
            (if (< max (car xs)) (findMax (cdr xs) (car xs)) (findMax (cdr xs) max)))))

(defun min-mean-max (xs)
    (setq min (findMin (cdr xs)(car xs)))
    (setq max (findMax (cdr xs)(car xs)))
    (setq mean (findMean xs 0 0))

    (list min mean max))


