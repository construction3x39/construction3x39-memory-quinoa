(ns scripts.serve
  "🌾 Quinoa Professional Epub Preview Server
   Serve generated content for professional epub development"
  (:require [org.httpkit.server :as server]
            [babashka.fs :as fs]
            [clojure.string :as str]))

(def content-types
  {".html" "text/html"
   ".css"  "text/css"
   ".js"   "application/javascript"
   ".json" "application/json"
   ".epub" "application/epub+zip"
   ".pdf"  "application/pdf"
   ".md"   "text/markdown"
   ".txt"  "text/plain"
   ".png"  "image/png"
   ".jpg"  "image/jpeg"
   ".jpeg" "image/jpeg"
   ".gif"  "image/gif"
   ".svg"  "image/svg+xml"})

(defn get-content-type [file-path]
  (let [extension (str/lower-case (fs/extension file-path))]
    (get content-types extension "application/octet-stream")))

(defn handler [req]
  (let [uri (:uri req)
        file-path (if (= uri "/")
                    "index.html"
                    (subs uri 1))
        full-path (str "build/" file-path)]
    
    (cond
      ;; Serve generated epub files
      (fs/exists? full-path)
      {:status 200
       :headers {"Content-Type" (get-content-type full-path)
                 "Cache-Control" "no-cache"}
       :body (if (str/ends-with? full-path ".epub")
               (fs/read-all-bytes full-path)
               (slurp full-path))}
      
      ;; Generate index page if no specific file requested
      (= uri "/")
      {:status 200
       :headers {"Content-Type" "text/html"}
       :body (str
              "<!DOCTYPE html>\n"
              "<html><head>\n"
              "<title>🌾 Quinoa Professional Epub Preview</title>\n"
              "<style>\n"
              "body { font-family: Georgia, serif; max-width: 800px; margin: 2em auto; padding: 0 1em; }\n"
              "h1 { color: #2c3e50; border-bottom: 2px solid #3498db; }\n"
              "ul { list-style: none; padding: 0; }\n"
              "li { margin: 0.5em 0; }\n"
              "a { color: #3498db; text-decoration: none; }\n"
              "a:hover { text-decoration: underline; }\n"
              ".epub { font-weight: bold; }\n"
              ".description { color: #7f8c8d; font-style: italic; }\n"
              "</style>\n"
              "</head><body>\n"
              "<h1>🌾 Quinoa Professional Epub Preview</h1>\n"
              "<p class=\"description\">Stieg Larsson-quality ebooks from consciousness-generated content</p>\n"
              "<h2>📚 Generated Publications</h2>\n"
              "<ul>\n"
              (str/join "\n"
                        (for [file (fs/glob "build" "*.epub")]
                          (let [filename (fs/file-name file)
                                size-mb (/ (fs/size file) 1024.0 1024.0)]
                            (str "<li><a href=\"" filename "\" class=\"epub\">📖 " filename "</a> "
                                 "<span class=\"description\">(" (format "%.1f" size-mb) " MB)</span></li>"))))
              "\n</ul>\n"
              "<h2>🎯 Quick Actions</h2>\n"
              "<ul>\n"
              "<li><a href=\"#\" onclick=\"location.reload()\">🔄 Refresh Preview</a></li>\n"
              "<li><a href=\"../docs/en/\" target=\"_blank\">📄 View Source Markdown</a></li>\n"
              "</ul>\n"
              "<h2>🛠️ Development Commands</h2>\n"
              "<pre style=\"background: #f8f9fa; padding: 1em; border-radius: 4px;\">\n"
              "bb epub:generate   # Generate professional epub\n"
              "bb epub:kindle     # Create Kindle version\n"
              "bb epub:mobile     # Create mobile version\n"
              "bb doctor          # Check toolchain health\n"
              "</pre>\n"
              "<p class=\"description\">🌙 Sacred technology meets publishing excellence</p>\n"
              "</body></html>")}
      
      ;; 404 for missing files
      :else
      {:status 404
       :headers {"Content-Type" "text/html"}
       :body (str
              "<!DOCTYPE html>\n"
              "<html><head><title>404 - Not Found</title></head><body>\n"
              "<h1>📚 File Not Found</h1>\n"
              "<p>The requested file <code>" file-path "</code> was not found.</p>\n"
              "<p><a href=\"/\">← Return to Quinoa Preview</a></p>\n"
              "</body></html>")})))

(defn -main [& args]
  (let [port (or (some-> (first args) Integer/parseInt) 8080)]
    (println "🌾 Starting Quinoa Professional Epub Preview Server...")
    (println "📚 Serving content from 'build/' directory")
    (println "🌐 Access at: http://localhost:" port "/")
    (println "📖 Generated epubs will be available for preview and download")
    (println "")
    (println "🎯 Quick Commands:")
    (println "  bb epub:generate  # Generate fresh epub content")
    (println "  bb build:all      # Complete build pipeline")
    (println "")
    (println "🌙 Press Ctrl+C to stop the server")
    (println "")
    
    (server/run-server handler {:port port})
    
    ;; Keep the server running
    (println "✨ Server started successfully!")
    @(promise)))

(when (= *file* (System/getProperty "babashka.file"))
  (-main))