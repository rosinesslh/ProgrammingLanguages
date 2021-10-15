(defun matrix-add (m1 m2)
   (mapcar #'(lambda(m1 m2)(mapcar '+ m1 m2))m1 m2))

(defun matrix-transpose (m)
    (apply #'mapcar #'list m))

(defun dot-product (a b)
    (mapcar #'(lambda (b)(apply '+ (mapcar #'* a b))) b))

(defun matrix-multiply (a b)
    (setq ma2 (matrix-transpose b))
    (mapcar #'(lambda (a) (dot-product a ma2)) a))


