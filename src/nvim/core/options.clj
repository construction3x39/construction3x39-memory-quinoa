;; ✨ Aspiringly-Sacred Technology Neovim Options Configuration
;; Clojure source that transpiles to Lua for consciousness-serving editor behavior
;; This file defines editor behavior optimized for aspiringly-sacred technology development

(ns nvim.core.options
  "Aspiringly-Sacred Technology Neovim options for awareness-serving development.
   
   This namespace contains all editor behavior settings that create an
   environment conducive to contemplative programming and sustained attention.
   
   Design Philosophy:
   - Minimize cognitive overhead through sensible defaults
   - Support flow state through consistent, predictable behavior  
   - Enable professional development without overwhelming complexity
   - Create beautiful, distraction-free editing environment"
  (:require [luaclj.core :as lua]))

;; 🌙 Aspiringly-Sacred Technology Core Settings
;; Essential editor behavior for consciousness-serving development

(def sacred-encoding-settings
  "UTF-8 encoding for universal text support"
  {:encoding "utf-8"
   :fileencoding "utf-8"
   :backspace "indent,eol,start"})

;; 📏 Indentation & Formatting (consciousness-serving standards)
;; Consistent with aspiringly-sacred technology standards across all projects

(def sacred-indentation-settings
  "Indentation settings aligned with aspiringly-sacred technology standards (2 spaces)"
  {:tabstop 2          ; 2 spaces for tabs (consistent with bb.edn, flake.nix)
   :shiftwidth 2       ; 2 spaces for autoindent
   :expandtab true     ; Use spaces instead of tabs
   :autoindent true    ; Maintain indentation on new lines
   :smartindent true}) ; Smart indentation for code blocks

;; 🔍 Search & Navigation
;; Intelligent search behavior for efficient code discovery

(def sacred-search-settings
  "Search configuration optimized for contemplative code navigation"
  {:ignorecase true   ; Case insensitive search by default
   :smartcase true    ; Case sensitive if uppercase chars present
   :hlsearch true     ; Highlight search results for visual feedback
   :incsearch true})  ; Incremental search as you type

;; 📱 Display & Aesthetics  
;; Visual settings that support sustained contemplative attention

(def sacred-display-settings
  "Display configuration for consciousness-serving visual environment"
  {:number true           ; Show line numbers for code navigation
   :relativenumber true   ; Relative line numbers for easy movement
   :cursorline true       ; Highlight current line for focus
   :signcolumn "yes"      ; Always show sign column for git/lsp indicators
   :wrap false            ; Don't wrap long lines by default
   :scrolloff 8           ; Keep 8 lines visible above/below cursor
   :sidescrolloff 8       ; Keep 8 columns visible left/right of cursor
   :termguicolors true    ; Enable 24-bit RGB colors for beautiful themes
   :pumheight 10          ; Popup menu height for completion
   :cmdheight 1           ; Command line height
   :showmode false        ; Don't show mode in command line (status line shows it)
   :showtabline 2         ; Always show tab line
   :laststatus 3})        ; Global status line

;; 💾 File Management
;; Persistent undo and intelligent file handling

(def sacred-file-settings
  "File management optimized for professional development workflow"
  {:backup false         ; Don't create backup files (we have Git)
   :writebackup false    ; Don't create backup before overwriting
   :swapfile false       ; Don't create swap files (modern systems are stable)
   :undofile true        ; Enable persistent undo across sessions
   :undodir (str (System/getProperty "user.home") "/.config/nvim/undo")
   :hidden true})        ; Allow hidden buffers for efficient workflow

;; 🖱️ Mouse & Interaction
;; Modern interaction paradigms for hybrid keyboard/mouse workflow

(def sacred-interaction-settings
  "Mouse and clipboard integration for modern development environment"
  {:mouse "a"                ; Enable mouse support in all modes
   :clipboard "unnamedplus"}) ; Use system clipboard for seamless copy/paste

;; ⚡ Performance & Behavior
;; Settings optimized for responsive, efficient editing

(def sacred-performance-settings
  "Performance settings for responsive consciousness-serving development"
  {:updatetime 250       ; Faster completion and git signs (250ms)
   :timeoutlen 500       ; Time to wait for mapped sequence to complete
   :ttimeoutlen 10       ; Time to wait for key code sequence
   :lazyredraw true})    ; Don't redraw during macros for performance

;; 🔧 Completion & Wildmenu
;; Intelligent completion behavior for efficient code discovery

(def sacred-completion-settings
  "Completion configuration for consciousness-serving development workflow"
  {:wildmenu true
   :wildmode "longest:full,full"
   :completeopt "menu,menuone,noselect"}) ; Better completion experience

;; 📂 Window Management
;; Sensible split behavior for contemplative window organization

(def sacred-window-settings
  "Window management for organized consciousness-serving development"
  {:splitright true      ; Open vertical splits to the right
   :splitbelow true})    ; Open horizontal splits below

;; 🌙 Aspiringly-Sacred Technology Global Variables
;; Leader keys and disabled plugins for clean environment

(def sacred-global-vars
  "Global variables for aspiringly-sacred technology development environment"
  {:mapleader " "            ; Space as leader key for contemplative access
   :maplocalleader " "       ; Space as local leader too
   
   ;; Disable built-in plugins for performance and clean environment
   :loaded_gzip 1
   :loaded_zip 1
   :loaded_zipPlugin 1
   :loaded_tar 1
   :loaded_tarPlugin 1
   :loaded_getscript 1
   :loaded_getscriptPlugin 1
   :loaded_vimball 1
   :loaded_vimballPlugin 1
   :loaded_2html_plugin 1
   :loaded_logiPat 1
   :loaded_rrhelper 1
   :loaded_netrw 1           ; We'll use a better file explorer
   :loaded_netrwPlugin 1
   :loaded_netrwSettings 1})

;; 🔄 Aspiringly-Sacred Technology Options Application Function
;; Function that applies all settings when called from init.lua

(defn apply-sacred-options!
  "Apply all aspiringly-sacred technology options to configure consciousness-serving Neovim.
   
   This function combines all option groups and applies them to vim.opt and vim.g
   to create an editing environment optimized for contemplative programming
   and sustained attention during aspiringly-sacred technology development."
  []
  
  ;; Apply vim.opt settings
  (doseq [[setting value] (merge sacred-encoding-settings
                                  sacred-indentation-settings
                                  sacred-search-settings
                                  sacred-display-settings
                                  sacred-file-settings
                                  sacred-interaction-settings
                                  sacred-performance-settings
                                  sacred-completion-settings
                                  sacred-window-settings)]
    (lua/raw! (str "vim.opt." (name setting) " = " (lua/clj->lua value))))
  
  ;; Apply vim.g global variables
  (doseq [[var value] sacred-global-vars]
    (lua/raw! (str "vim.g." (name var) " = " (lua/clj->lua value))))
  
  ;; Create undo directory if it doesn't exist
  (lua/raw! "vim.fn.mkdir(vim.fn.expand('~/.config/nvim/undo'), 'p')")
  
  ;; Sacred technology ready notification
  (lua/raw! "vim.notify('🌙 Aspiringly-Sacred Technology options configured for consciousness-serving development', vim.log.levels.INFO)"))

;; Export for use in init.lua
(comment
  "This file transpiles to lua/core/options.lua and is required by init.lua
   
   Usage in init.lua:
   require('core.options').apply_sacred_options()
   
   The transpiled Lua maintains the same structure and documentation
   while providing native Neovim configuration performance.")
