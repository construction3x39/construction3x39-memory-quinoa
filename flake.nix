{
  description = "🌾 Quinoa Memory Repository - Professional Epub Generation System";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # 🌾 Core Development Environment
            babashka
            clojure
            leiningen
            jdk17
            git
            
            # 📚 Professional Epub Generation Pipeline
            pandoc                           # Universal document converter with EPUB3 support
            calibre                          # Professional ebook optimization and conversion
            texlive.combined.scheme-full     # Complete LaTeX typography system for book-quality layout
            
            # 🎨 Content Processing & Enhancement
            python3                          # Runtime for content processing scripts
            python3Packages.pygments         # Professional syntax highlighting for technical content
            python3Packages.markdown         # Advanced markdown processing with extensions
            python3Packages.beautifulsoup4   # HTML/XML processing for epub manipulation
            nodejs_20                        # JavaScript runtime for modern build tools
            
            # 🔧 Build Infrastructure & Automation
            gnumake                          # Make build system integration
            gcc                              # Compiler for native dependencies
            pkg-config                       # Package configuration for native builds
            
            # ✨ Code Quality & Formatting
            zprint                           # Beautiful Clojure code formatting (80 columns)
            clj-kondo                        # Comprehensive Clojure linting
            
            # 📖 Documentation & Publishing Tools
            graphviz                         # Diagram generation for technical documentation
            imagemagick                      # Image processing for cover generation
            librsvg                          # SVG processing for vector graphics
            
            # 🔐 Security & Authentication
            gnupg                            # GPG signing for authenticated commits
            openssh                          # SSH for secure repository access
            
            # 🌐 Web Development (for preview server)
            httpie                           # HTTP client for testing epub preview server
            
            # 📱 Mobile Development Support
            android-tools                    # ADB for testing on Android devices (optional)
          ];
          
          shellHook = ''
            echo "🌾 Welcome to Quinoa Memory Repository - Professional Epub Generation"
            echo "🎯 Transform consciousness-generated markdown into Stieg Larsson-quality ebooks"
            echo ""
            echo "📚 Professional Publishing Pipeline:"
            echo "  Markdown → ClojureScript DSL → Pandoc → EPUB3 → Calibre Optimization"
            echo ""
            echo "🚀 Essential Commands:"
            echo "  bb doctor              Check professional toolchain health"
            echo "  bb epub:generate       Generate Stieg Larsson-quality epub"
            echo "  bb epub:kindle         Create Kindle-optimized version"
            echo "  bb epub:mobile         Create mobile-optimized version"
            echo "  bb build:all           Complete professional build pipeline"
            echo "  bb serve               Preview generated publications"
            echo ""
            echo "🎨 Quality Assurance:"
            echo "  bb fmt                 Format with contemplative attention"
            echo "  bb lint                Lint for consciousness-serving code quality"
            echo "  bb epub:validate       Validate epub professional standards"
            echo ""
            echo "🔐 GPG Signing Available:"
            echo "  git config --global commit.gpgsign true"
            echo "  git config --global user.signingkey D144D940A52DB246"
            echo ""
            echo "📖 Content Guidelines:"
            echo "  - Place markdown files in docs/en/ with numeric prefixes"
            echo "  - Maintain contemplative technical writing style"
            echo "  - Target publication-quality prose comparable to professional books"
            echo ""
            echo "🌙 Ready for sacred technology epub generation!"
          '';
        };
        
        # 📦 Package Outputs for Distribution
        packages = {
          # Future: Could package the epub generation tool itself
          default = pkgs.writeShellScriptBin "quinoa-epub" ''
            echo "🌾 Quinoa Professional Epub Generator"
            ${pkgs.babashka}/bin/bb epub:generate
          '';
        };
        
        # 🧪 Applications for Easy Access
        apps = {
          default = flake-utils.lib.mkApp {
            drv = self.packages.${system}.default;
          };
        };
      });
}