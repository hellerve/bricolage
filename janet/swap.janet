(defmacro swap
  "Swaps the values of two variables in-place."
  [a b]
  (def tmp (gensym))
  ~(do (var ,tmp ,a)
       (set ,a ,b)
       (set ,b ,tmp)))

