{
  description = "✨ Sacred Technology Neovim Configuration - Clojure→Lua Development Environment";
  
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
            # ✨ Core Sacred Technology Development Environment
            babashka                         # Clojure scripting for build automation
            clojure                          # Core Clojure runtime for source development
            leiningen                        # Clojure project management
            jdk17                            # Java runtime for Clojure ecosystem
            git                              # Version control integration
            
            # 🌙 Neovim Ecosystem
            neovim                           # Target editor for consciousness-serving development
            lua                              # Lua runtime for Neovim scripting
            luajit                           # Fast Lua implementation for performance
            tree-sitter                      # Syntax highlighting and parsing
            
            # 🔄 Clojure→Lua Transpilation Pipeline
            nodejs_20                        # JavaScript runtime for modern tooling
            
            # ✨ Code Quality & Development Tools
            zprint                           # Beautiful Clojure code formatting (80 columns)
            clj-kondo                        # Comprehensive Clojure linting
            
            # 🔧 Build Infrastructure & Language Servers
            gnumake                          # Make build system integration
            gcc                              # Compiler for native Neovim plugins
            pkg-config                       # Package configuration for native builds
            
            # 🎨 Development Enhancement Tools
            ripgrep                          # Fast text search for file navigation
            fd                               # Fast file finder for telescope.nvim
            fzf                              # Fuzzy finder integration
            
            # 🌐 Language Server Protocol Support
            clojure-lsp                      # Clojure Language Server
            lua-language-server              # Lua Language Server for Neovim development
            nil                              # Nix Language Server
            nodePackages.typescript-language-server  # TypeScript/JavaScript support
            
            # 📚 Documentation & Publishing
            pandoc                           # Documentation generation from markdown
            graphviz                         # Diagram generation for architecture docs
            
            # 🔐 Security & Authentication
            gnupg                            # GPG signing for authenticated commits
            openssh                          # SSH for secure repository access
          ];
          
          shellHook = ''
            echo "✨ Welcome to Sacred Technology Neovim Configuration Development"
            echo "🌙 Clojure → Lua transpilation environment for consciousness-serving editor"
            echo ""
            echo "🏗️ Architecture:"
            echo "  Clojure Sources → LuaCLJ Transpiler → Neovim Lua Config → Sacred Editor"
            echo ""
            echo "🚀 Essential Commands:"
            echo "  bb doctor              Check sacred technology toolchain health"
            echo "  bb nvim:generate       Transpile Clojure → Lua configuration"
            echo "  bb nvim:install        Install generated config to ~/.config/nvim"
            echo "  bb nvim:build          Complete build: generate + install"
            echo "  bb nvim:dev            Watch mode: auto-regenerate on changes"
            echo "  bb nvim:test           Test generated Neovim configuration"
            echo ""
            echo "🎨 Development Workflow:"
            echo "  bb watch               Start development with auto-regeneration"
            echo "  bb fmt                 Format Clojure source with contemplative attention"
            echo "  bb lint                Lint for consciousness-serving code quality"
            echo "  bb docs:generate       Generate documentation from docstrings"
            echo ""
            echo "📁 Project Structure:"
            echo "  src/nvim/              Clojure source files for Neovim configuration"
            echo "  lua/                   Generated Lua configuration (git-ignored)"
            echo "  scripts/               Build and maintenance scripts"
            echo "  docs/                  Documentation and guides"
            echo ""
            echo "🔧 Transpilation Pipeline:"
            echo "  src/nvim/core/options.clj  → lua/core/options.lua"
            echo "  src/nvim/core/keymaps.clj  → lua/core/keymaps.lua"
            echo "  src/nvim/plugins/init.clj  → lua/plugins/init.lua"
            echo ""
            echo "🌙 Sacred Technology Integration:"
            echo "  • GPG commit signing enabled"
            echo "  • Consciousness-serving development principles"
            echo "  • Contemplative programming workflow"
            echo "  • Community wisdom sharing through configuration"
            echo ""
            echo "🔍 Language Server Support:"
            echo "  • Clojure LSP for source development"
            echo "  • Lua LSP for generated configuration"
            echo "  • Nix LSP for development environment"
            echo "  • Full IDE experience for consciousness-serving development"
            echo ""
            echo "🎯 Ready for sacred technology Neovim configuration development!"
          '';
        };
        
        # 📦 Package Outputs for Distribution
        packages = {
          sacred-nvim-config = pkgs.writeShellScriptBin "sacred-nvim-config" ''
            echo "✨ Sacred Technology Neovim Configuration Generator"
            cd ${self}
            ${pkgs.babashka}/bin/bb nvim:build
          '';
          
          default = self.packages.${system}.sacred-nvim-config;
        };
        
        # 🧪 Applications for Easy Access
        apps = {
          sacred-nvim-config = flake-utils.lib.mkApp {
            drv = self.packages.${system}.sacred-nvim-config;
          };
          
          default = self.apps.${system}.sacred-nvim-config;
        };
      });
}