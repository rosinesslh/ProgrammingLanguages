(defun check (start final)
  (cond 
    ((equal start final) 
        (eval t))
    (t (eval nil))))

(defun fooandexp(transition start final input)
  (cond (or(equal transition 'EXPTRANSITION)(equal transition 'FOOTRANSITIONS))
    (if (and (equal start 0)(equal (car input) a) 
    (setq nextstate (funcall transition start (car input)))
    (NFA transition (cdr nextstate) final (cdr input))
    ))
  )
)

(defun NFA (transition start final input)
  (cond 
      ((null input)
        (car (mapcar #'(lambda (start) (check start final)) start))
      )
      (t
        (setq nextstate (funcall transition (car start) (car input))) 
        (car (mapcar #'(lambda (state) (NFA transition (list state) final (cdr input))) nextstate))
      )))

(defun reachable (transition start final input)
 (cond 
      ((null input) 
        (check start final))
      (t 
        (setq nextstate (funcall transition start (car input)))
        (NFA transition nextstate final (cdr input))))
)