(defn second
  "Get the second element from an indexed data structure."
  [xs]
  (in xs 1))

(defn flatten-once [xs]
  (let [into @[]]
    (each x xs
      (each y x (array/push into y)))
    into))

(defmacro defmacro! [name args body]
  (let [replacers (map |[(gensym) $] args)]
    (let [args (map second replacers)
          lookup (table ;(flatten (map |[(second $) (first $)] replacers)))]
      ~(defmacro ,name ,(tuple/brackets ;args)
          ~(let ,(tuple/brackets ;(flatten-once (map |[(first $) (tuple 'unquote (second $))] replacers)))
             ,(macex body |(in lookup $ $)))))))

(comment
  (defmacro! square [x]
    ~(* ,x ,x))
)
