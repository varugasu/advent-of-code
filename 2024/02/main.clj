(require '[clojure.string :as clj-string])

(defn is-safe? [report]
  (let [deltas (map - (rest report) report)]
    (and
     (or (every? pos? deltas) (every? neg? deltas))
     (every? #(<= 1 (Math/abs %) 3) deltas))))

(let [reports (->> (slurp "input.txt")
                   (clj-string/split-lines)
                   (map #(clj-string/split % #"\s+"))
                   (map #(map parse-long %)))
      safe-reports (reduce
                    (fn [acc report]
                      (if (is-safe? report)
                        (inc acc) acc))
                    0
                    reports)]
  (println "Solution 1:" safe-reports))
