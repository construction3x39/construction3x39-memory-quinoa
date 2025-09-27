(ns site.core
  "🌾 Quinoa Professional Epub Generation System
   Transform consciousness-generated markdown into Stieg Larsson-quality ebooks"
  (:require [clojure.string :as str]
            [clojure.java.io :as io]
            [babashka.fs :as fs]))

(defn gather-markdown-files
  "Collect all markdown files from docs directory with proper ordering"
  []
  (let [docs-dir "docs/en"
        markdown-files (->> (fs/glob docs-dir "*.md")
                            (filter fs/file?)
                            (sort-by fs/file-name))]
    (println "📚 Found" (count markdown-files) "markdown files for professional epub generation")
    (doseq [file markdown-files]
      (println "  📄" (fs/file-name file)))
    (mapv str markdown-files)))

(defn generate-professional-metadata
  "Generate professional publishing metadata for Stieg Larsson-quality output"
  [output-dir]
  (let [metadata-file (str output-dir "/metadata.yaml")
        title "Quinoa Memory Repository: Sacred Technology Wisdom"
        author "construction3x39"
        current-date (str (java.time.LocalDate/now))]
    
    (spit metadata-file
          (str "---\n"
               "title: \"" title "\"\n"
               "author: \"" author "\"\n"
               "language: \"en-US\"\n"
               "rights: \"The Unlicense - Public Domain\"\n"
               "publisher: \"Quinoa Memory Press\"\n"
               "date: \"" current-date "\"\n"
               "description: \"Professional epub generation from consciousness-generated markdown content\"\n"
               "subject: \"Sacred Technology, Contemplative Programming, Spiritual Development\"\n"
               "creator: \"Quinoa Professional Epub Generator\"\n"
               "identifier: \"quinoa-memory-" current-date "\"\n"
               "---\n"))
    
    (println "📝 Generated professional metadata:" metadata-file)
    metadata-file))

(defn generate-professional-epub
  "Generate professional epub using pandoc with Stieg Larsson-quality formatting"
  [markdown-files]
  (let [output-dir "build"
        output-file (str output-dir "/quinoa-wisdom.epub")
        css-file "assets/epub.css"
        cover-file "assets/cover.jpg"]
    
    ;; Ensure build directory exists
    (fs/create-dirs output-dir)
    
    ;; Generate professional metadata
    (let [metadata-file (generate-professional-metadata output-dir)]
      
      ;; Build pandoc command for professional epub generation
      (let [pandoc-cmd (concat
                        ["pandoc"
                         "--from=markdown+yaml_metadata_block+smart+pipe_tables+fenced_code_blocks"
                         "--to=epub3"
                         "--output" output-file
                         "--metadata-file" metadata-file
                         "--css" css-file
                         "--epub-chapter-level=2"
                         "--toc"
                         "--toc-depth=3"
                         "--number-sections"
                         "--standalone"
                         "--self-contained"
                         "--highlight-style=pygments"
                         "--template=epub3"]
                        (when (fs/exists? cover-file)
                          ["--epub-cover-image" cover-file])
                        markdown-files)]
        
        (println "🔄 Generating professional epub with Stieg Larsson-quality typography...")
        (println "📚 Command:" (str/join " " pandoc-cmd))
        
        ;; Execute pandoc command
        (apply shell pandoc-cmd)
        
        (println "✨ Professional epub generated:" output-file)
        output-file))))

(defn generate-kindle-epub
  "Generate Kindle-optimized epub for maximum e-reader compatibility"
  []
  (let [input-file "build/quinoa-wisdom.epub"
        output-file "build/quinoa-wisdom-kindle.azw3"]
    
    (when-not (fs/exists? input-file)
      (println "📚 Generating base epub first...")
      (let [markdown-files (gather-markdown-files)]
        (generate-professional-epub markdown-files)))
    
    (println "📖 Creating Kindle-optimized version...")
    (shell "ebook-convert" input-file output-file
           "--output-profile=kindle_oasis"
           "--mobi-file-type=both"
           "--personal-doc=true"
           "--chapter-mark=pagebreak"
           "--disable-remove-fake-margins=true"
           "--smarten-punctuation=true")
    
    (println "📱 Kindle-optimized epub ready:" output-file)
    output-file))

(defn -main
  "Main entry point for quinoa professional epub generation"
  [& args]
  (println "🌾 Starting Quinoa Professional Epub Generation System...")
  (println "🎯 Target: Stieg Larsson-quality ebooks from consciousness-generated content")
  (println "")
  
  (let [markdown-files (gather-markdown-files)]
    (when (empty? markdown-files)
      (println "❌ No markdown files found in docs/en/ directory")
      (println "💡 Add markdown files to get started with professional epub generation")
      (System/exit 1))
    
    (let [epub-file (generate-professional-epub markdown-files)]
      (println "")
      (println "🎉 Professional epub generation complete!")
      (println "📚 Generated:" epub-file)
      (println "🌙 Sacred technology meets publishing excellence!"))))

(when (= *file* (System/getProperty "babashka.file"))
  (-main))