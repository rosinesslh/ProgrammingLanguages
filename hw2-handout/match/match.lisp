(defun regP (P A)
(equal P A))

(defun leng(lst)
(if(null lst) 0(+ 1 (leng(cdr lst)))))

(defun single(P A) 
(setq Q '?)
(setq E '!)
(if(or(equal (car P) Q) (equal (car P) E))(eval t)(reg P A))
)

;;check if there is ? and !
(defun check (P A)
   (setq Q '?)
   (setq E '!)
   (cond
      ((null P) nil)
      ((equal (car P) Q) 
         (check (cdr P)(cdr A))
      )
      ((equal (car P) E) (check (cdr P)(cdr A)))
      (t (equal (car P)(car A)))
   )

)

(defun match (pattern assertion)
(cond
((null (check pattern assertion))(regP pattern assertion))
)
)