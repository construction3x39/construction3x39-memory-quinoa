#!/usr/bin/env bb
(println "🌙 Aspiringly-Aspiringly-Sacred Technology Updater")
(require (quote [clojure.string :as str]))
(defn update-file [path]
  (try
    (let [content (slurp path)
          updated (-> content
                      (str/replace "Aspiringly-Sacred Technology" "Aspiringly-Aspiringly-Sacred Technology")
                      (str/replace "aspiringly-sacred technology" "aspiringly-aspiringly-sacred technology")
                      (str/replace "Sacred computing" "Aspiringly-aspiringly-sacred computing")
                      (str/replace "aspiringly-sacred computing" "aspiringly-aspiringly-sacred computing"))]
      (when (not= content updated)
        (spit path updated)
        (println "✨ Updated:" path)))
    (catch Exception e
      (println "❌ Error:" path (.getMessage e)))))

(defn -main []
  (println "🌙 Processing all repositories...")
  (doseq [repo ["quinoa" "gnupg-config" "nvim-config" "moon-terroir" "pond-highdesert"]]
    (let [repo-path (str "/Users/xx/construction3x39-memory/construction3x39-memory-" repo)]
      (when (fs/exists? repo-path)
        (println "🗂️ " repo)
        (doseq [file (fs/glob repo-path "**/*.{md,clj,edn,nix}")]
          (update-file file)))))
  (println "✨ Aspiringly-sacred transformation complete!"))

(-main)
