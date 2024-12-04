(require '[clojure.string])

(let [[list1 list2] (->> (slurp "input.txt")
                         (clojure.string/split-lines)
                         (map #(clojure.string/split % #"\s+"))
                         (reduce (fn [[list1 list2] [n1 n2]]
                                   [(conj list1 (parse-long n1))
                                    (conj list2 (parse-long n2))])
                                 [[] []]))
      sorted-list1 (sort list1)
      sorted-list2 (sort list2)
      total-distance (reduce + (map #(Math/abs (- %1 %2)) sorted-list1 sorted-list2))
      freq (frequencies sorted-list2)
      similarity-score (reduce + (map #(* %1 (get freq %1 0)) sorted-list1))]
  (println "Solution 1:" total-distance)
  (println "Solution 2:" similarity-score))
