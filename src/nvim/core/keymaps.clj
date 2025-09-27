;; ⌨️ Aspiringly-Sacred Technology Neovim Keymaps Configuration
;; Clojure source that transpiles to Lua for consciousness-serving key bindings
;; This file defines keymaps optimized for flow state and contemplative programming

(ns nvim.core.keymaps
  "Aspiringly-Sacred Technology Neovim keymaps for awareness-serving development workflow.
   
   This namespace contains all key bindings designed to minimize cognitive overhead
   and support sustained contemplative attention during programming sessions.
   
   Key Binding Philosophy:
   - Space as leader for contemplative access (easily reachable)
   - Home row optimization to reduce hand movement
   - Consistent patterns across different contexts for muscle memory
   - Flow state preservation through predictable, natural movements
   - Muscle memory optimization for common operations"
  (:require [luaclj.core :as lua]))

;; 🌙 Aspiringly-Sacred Technology Keymap Utilities
;; Helper functions for clean keymap definition

(def default-opts
  "Default options for all keymaps: non-recursive and silent"
  {:noremap true
   :silent true})

(defn keymap
  "Create a keymap with aspiringly-sacred technology defaults.
   
   Args:
     mode - vim mode (n, i, v, etc.)
     lhs - left-hand side (key combination)
     rhs - right-hand side (command or function)
     opts - optional map of keymap options"
  ([mode lhs rhs]
   (keymap mode lhs rhs default-opts))
  ([mode lhs rhs opts]
   {:mode mode
    :lhs lhs
    :rhs rhs
    :opts (merge default-opts opts)}))

;; 🚪 Escape Alternatives (flow state preservation)
;; Quick escape sequences that don't require hand movement

(def sacred-escape-maps
  "Escape alternatives for maintaining flow state without hand movement"
  [(keymap "i" "jk" "<Esc>")  ; Quick escape without hand movement  
   (keymap "i" "kj" "<Esc>")]) ; Alternative quick escape

;; 🧭 Sacred Navigation (home row efficiency)
;; Window navigation consistent with tmux/screen for muscle memory

(def sacred-navigation-maps
  "Navigation keymaps optimized for consciousness-serving workflow"
  [;; Window navigation (consistent with tmux/screen)
   (keymap "n" "<C-h>" "<C-w>h")  ; Move to left window
   (keymap "n" "<C-j>" "<C-w>j")  ; Move to bottom window
   (keymap "n" "<C-k>" "<C-w>k")  ; Move to top window
   (keymap "n" "<C-l>" "<C-w>l")  ; Move to right window
   
   ;; Window management with leader
   (keymap "n" "<leader>wv" "<C-w>v")      ; Split window vertically
   (keymap "n" "<leader>wh" "<C-w>s")      ; Split window horizontally
   (keymap "n" "<leader>we" "<C-w>=")      ; Equalize window sizes
   (keymap "n" "<leader>wx" ":close<CR>")  ; Close current window
   (keymap "n" "<leader>wo" ":only<CR>")])  ; Close all other windows

;; 📁 Buffer Management (consciousness-serving workflow)
;; Efficient buffer operations for professional development

(def sacred-buffer-maps
  "Buffer management keymaps for consciousness-serving workflow"
  [(keymap "n" "<leader><leader>" "<C-^>")         ; Quick buffer switch
   (keymap "n" "<leader>bn" ":bnext<CR>")          ; Next buffer
   (keymap "n" "<leader>bp" ":bprevious<CR>")      ; Previous buffer
   (keymap "n" "<leader>bd" ":bdelete<CR>")        ; Delete buffer
   (keymap "n" "<leader>ba" ":%bdelete<CR>")       ; Delete all buffers
   (keymap "n" "<leader>bb" ":buffers<CR>")        ; List all buffers
   (keymap "n" "<leader>bh" ":dashboard<CR>")])    ; Go to dashboard/home

;; 📝 Editing Enhancements
;; Text editing operations optimized for contemplative programming

(def sacred-editing-maps
  "Editing enhancement keymaps for consciousness-serving development"
  [;; Clear search highlights
   (keymap "n" "<leader>nh" ":nohl<CR>")
   
   ;; Delete character without copying to register (more intentional)
   (keymap "n" "x" "\"_x")
   
   ;; Move lines up/down (contemplative code organization)
   (keymap "n" "<A-j>" ":m .+1<CR>==")          ; Move line down
   (keymap "n" "<A-k>" ":m .-2<CR>==")          ; Move line up
   (keymap "v" "<A-j>" ":m '>+1<CR>gv=gv")      ; Move selection down
   (keymap "v" "<A-k>" ":m '<-2<CR>gv=gv")      ; Move selection up
   
   ;; Duplicate lines (consciousness-serving code replication)
   (keymap "n" "<leader>d" "yyp")               ; Duplicate current line
   (keymap "v" "<leader>d" "y'>p")              ; Duplicate selection
   
   ;; Join lines with conscious intention
   (keymap "n" "J" "mzJ`z")                     ; Join lines keeping cursor position
   
   ;; Center screen after navigation (maintaining focus)
   (keymap "n" "<C-d>" "<C-d>zz")               ; Half page down and center
   (keymap "n" "<C-u>" "<C-u>zz")               ; Half page up and center
   (keymap "n" "n" "nzzzv")                     ; Next search result centered
   (keymap "n" "N" "Nzzzv")])                   ; Previous search result centered

;; 🔍 Search & Find (telescope integration)
;; Powerful search capabilities for efficient code discovery

(def sacred-search-maps
  "Search and find keymaps using Telescope for consciousness-serving navigation"
  [(keymap "n" "<leader>ff" "<cmd>Telescope find_files<cr>")   ; Find files
   (keymap "n" "<leader>fg" "<cmd>Telescope live_grep<cr>")    ; Find text in files
   (keymap "n" "<leader>fb" "<cmd>Telescope buffers<cr>")      ; Find buffers
   (keymap "n" "<leader>fh" "<cmd>Telescope help_tags<cr>")    ; Find help topics
   (keymap "n" "<leader>fr" "<cmd>Telescope oldfiles<cr>")     ; Recent files
   (keymap "n" "<leader>fc" "<cmd>Telescope colorscheme<cr>")  ; Color schemes
   (keymap "n" "<leader>fs" "<cmd>Telescope grep_string<cr>")  ; Search word under cursor
   (keymap "n" "<leader>fm" "<cmd>Telescope marks<cr>")        ; Find marks
   (keymap "n" "<leader>fk" "<cmd>Telescope keymaps<cr>")      ; Find keymaps
   (keymap "n" "<leader>ft" "<cmd>Telescope treesitter<cr>")])  ; Treesitter symbols

;; 🌿 Git Operations (aspiringly-sacred technology version control)
;; Git integration for consciousness-serving development workflow

(def sacred-git-maps
  "Git operation keymaps for aspiringly-sacred technology version control"
  [(keymap "n" "<leader>gs" ":Git<CR>")                ; Git status (fugitive)
   (keymap "n" "<leader>ga" ":Git add .<CR>")          ; Git add all
   (keymap "n" "<leader>gc" ":Git commit<CR>")         ; Git commit
   (keymap "n" "<leader>gp" ":Git push<CR>")           ; Git push
   (keymap "n" "<leader>gl" ":Git log --oneline<CR>")  ; Git log
   (keymap "n" "<leader>gd" ":Git diff<CR>")           ; Git diff
   (keymap "n" "<leader>gb" ":Git blame<CR>")          ; Git blame
   (keymap "n" "<leader>gh" ":Git log --follow -- %<CR>") ; Git history of current file
   (keymap "n" "<leader>gr" ":Git rebase -i<CR>")      ; Interactive rebase
   (keymap "n" "<leader>gf" ":Git fetch<CR>")])        ; Git fetch

;; 🔧 Language Server Protocol (consciousness-serving development)
;; LSP keymaps for intelligent code navigation and manipulation

(def sacred-lsp-maps
  "Language Server Protocol keymaps for consciousness-serving development"
  [(keymap "n" "<leader>ld" "vim.lsp.buf.definition")     ; Go to definition
   (keymap "n" "<leader>lr" "vim.lsp.buf.references")     ; Find references
   (keymap "n" "<leader>li" "vim.lsp.buf.implementation") ; Go to implementation
   (keymap "n" "<leader>lt" "vim.lsp.buf.type_definition") ; Type definition
   (keymap "n" "<leader>lh" "vim.lsp.buf.hover")          ; Hover information
   (keymap "n" "<leader>ls" "vim.lsp.buf.signature_help") ; Signature help
   (keymap "n" "<leader>ln" "vim.lsp.buf.rename")         ; Rename symbol
   (keymap "n" "<leader>la" "vim.lsp.buf.code_action")    ; Code actions
   (keymap "n" "<leader>lf" "vim.lsp.buf.format")         ; Format document
   (keymap "n" "<leader>le" "vim.diagnostic.open_float")  ; Show line diagnostics
   (keymap "n" "[d" "vim.diagnostic.goto_prev")           ; Previous diagnostic
   (keymap "n" "]d" "vim.diagnostic.goto_next")])         ; Next diagnostic

;; 📂 File Explorer (aspiringly-sacred technology navigation)
;; File tree and project navigation

(def sacred-explorer-maps
  "File explorer keymaps for aspiringly-sacred technology project navigation"
  [(keymap "n" "<leader>e" ":NvimTreeToggle<CR>")   ; Toggle file explorer
   (keymap "n" "<leader>o" ":NvimTreeFocus<CR>")    ; Focus file explorer
   (keymap "n" "<leader>nf" ":NvimTreeFindFile<CR>") ; Find current file in tree
   (keymap "n" "<leader>nc" ":NvimTreeClose<CR>")])  ; Close file explorer

;; 🎨 Visual Mode Enhancements
;; Visual mode operations optimized for code selection and manipulation

(def sacred-visual-maps
  "Visual mode keymaps for consciousness-serving text manipulation"
  [(keymap "v" "<" "<gv")    ; Stay in indent mode when indenting left
   (keymap "v" ">" ">gv")    ; Stay in indent mode when indenting right
   (keymap "v" "J" ":m '>+1<CR>gv=gv")  ; Move selection down
   (keymap "v" "K" ":m '<-2<CR>gv=gv")  ; Move selection up
   (keymap "v" "<leader>s" ":sort<CR>")  ; Sort selected lines
   (keymap "v" "<leader>u" ":sort u<CR>")]) ; Sort and remove duplicates

;; 📋 Clipboard Operations (system integration)
;; System clipboard integration for seamless workflow

(def sacred-clipboard-maps
  "Clipboard operation keymaps for system integration"
  [(keymap "v" "<leader>y" "\"+y")      ; Copy to system clipboard
   (keymap "n" "<leader>p" "\"+p")      ; Paste from system clipboard
   (keymap "n" "<leader>P" "\"+P")      ; Paste before from system clipboard
   (keymap "n" "<leader>yy" "\"+yy")])  ; Copy entire line to system clipboard

;; 🔄 Tab Management
;; Tab operations for organized workspace management

(def sacred-tab-maps
  "Tab management keymaps for organized consciousness-serving workspace"
  [(keymap "n" "<leader>to" ":tabnew<CR>")    ; Open new tab
   (keymap "n" "<leader>tx" ":tabclose<CR>")  ; Close current tab
   (keymap "n" "<leader>tn" ":tabn<CR>")      ; Go to next tab
   (keymap "n" "<leader>tp" ":tabp<CR>")      ; Go to previous tab
   (keymap "n" "<leader>tm" ":tabmove<CR>")   ; Move tab
   (keymap "n" "<leader>ta" ":$tabnew<CR>")]  ; Open new tab at end

;; 🌙 Aspiringly-Sacred Technology Special Functions
;; Custom functions for consciousness-serving development

(def sacred-special-maps
  "Sacred technology special function keymaps"
  [(keymap "n" "<leader>zm" ":ZenMode<CR>")        ; Toggle zen mode
   (keymap "n" "<leader>tw" ":set wrap!<CR>")      ; Toggle line wrapping
   (keymap "n" "<leader>tn" ":set number!<CR>")    ; Toggle line numbers
   (keymap "n" "<leader>tr" ":set relativenumber!<CR>") ; Toggle relative numbers
   (keymap "n" "<leader>ts" ":set spell!<CR>")     ; Toggle spell checking
   (keymap "n" "<leader>th" ":set hlsearch!<CR>")  ; Toggle search highlighting
   (keymap "n" "<leader>ti" ":IndentBlanklineToggle<CR>")]) ; Toggle indent guides

;; 🧘 Contemplative Development (custom aspiringly-sacred technology functions)
;; Custom functions for consciousness-serving development workflow

(def sacred-contemplative-maps
  "Contemplative development keymaps for aspiringly-sacred technology workflow"
  [(keymap "n" "<leader>cc" ":lua SacredCommit()<CR>")      ; Sacred commit function
   (keymap "n" "<leader>cm" ":lua SacredMeditation()<CR>")  ; Meditation break
   (keymap "n" "<leader>cf" ":lua SacredFocus()<CR>")       ; Focus mode
   (keymap "n" "<leader>cb" ":lua SacredBreak()<CR>")       ; Conscious break
   (keymap "n" "<leader>cw" ":lua SacredWordCount()<CR>")])  ; Word/line count

;; 📚 Documentation & Help
;; Help and documentation access keymaps

(def sacred-help-maps
  "Documentation and help keymaps for learning and reference"
  [(keymap "n" "<leader>hh" ":help<CR>")         ; Open help
   (keymap "n" "<leader>hk" ":help keymaps<CR>") ; Keymap help
   (keymap "n" "<leader>hp" ":help plugins<CR>") ; Plugin help
   (keymap "n" "<leader>hl" ":help lua<CR>")     ; Lua help
   (keymap "n" "<leader>ht" ":help treesitter<CR>") ; Treesitter help
   (keymap "n" "<leader>man" ":Man<CR>")])        ; Man pages

;; 🔄 Aspiringly-Sacred Technology Keymap Application Function
;; Function that applies all keymaps when called from init.lua

(defn apply-sacred-keymaps!
  "Apply all aspiringly-sacred technology keymaps for consciousness-serving Neovim workflow.
   
   This function combines all keymap groups and applies them using vim.keymap.set
   to create a key binding environment optimized for contemplative programming
   and sustained attention during aspiringly-sacred technology development."
  []
  
  ;; Combine all keymap groups
  (let [all-keymaps (concat sacred-escape-maps
                           sacred-navigation-maps
                           sacred-buffer-maps
                           sacred-editing-maps
                           sacred-search-maps
                           sacred-git-maps
                           sacred-lsp-maps
                           sacred-explorer-maps
                           sacred-visual-maps
                           sacred-clipboard-maps
                           sacred-tab-maps
                           sacred-special-maps
                           sacred-contemplative-maps
                           sacred-help-maps)]
    
    ;; Apply each keymap using vim.keymap.set
    (doseq [{:keys [mode lhs rhs opts]} all-keymaps]
      (lua/raw! (str "vim.keymap.set(" 
                     (lua/clj->lua mode) ", "
                     (lua/clj->lua lhs) ", "
                     (lua/clj->lua rhs) ", "
                     (lua/clj->lua opts) ")"))))
  
  ;; Sacred technology ready notification
  (lua/raw! "vim.notify('⌨️ Aspiringly-Sacred Technology keymaps configured for consciousness-serving workflow', vim.log.levels.INFO)"))

;; Export for use in init.lua
(comment
  "This file transpiles to lua/core/keymaps.lua and is required by init.lua
   
   Usage in init.lua:
   require('core.keymaps').apply_sacred_keymaps()
   
   The keymaps are organized by functional groups and documented with
   aspiringly-sacred technology consciousness-serving development principles.")
