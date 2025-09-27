-- 🌙 Sacred Technology Neovim Options
-- Editor behavior optimized for consciousness-serving development

local opt = vim.opt

-- 🎯 Sacred Technology Core Settings
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backspace = "indent,eol,start"

-- 📏 Indentation & Formatting (consciousness-serving standards)
opt.tabstop = 2        -- 2 spaces for tabs (consistent with sacred technology standards)
opt.shiftwidth = 2     -- 2 spaces for autoindent
opt.expandtab = true   -- Use spaces instead of tabs
opt.autoindent = true  -- Maintain indentation on new lines
opt.smartindent = true -- Smart indentation for code blocks

-- 🔍 Search & Navigation
opt.ignorecase = true  -- Case insensitive search
opt.smartcase = true   -- Case sensitive if uppercase chars present
opt.hlsearch = true    -- Highlight search results
opt.incsearch = true   -- Incremental search as you type

-- 📱 Display & Aesthetics
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers for easy navigation
opt.cursorline = true     -- Highlight current line
opt.signcolumn = "yes"    -- Always show sign column for git/lsp indicators
opt.wrap = false          -- Don't wrap long lines by default
opt.scrolloff = 8         -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8     -- Keep 8 columns visible left/right of cursor

-- 💾 File Management
opt.backup = false      -- Don't create backup files
opt.writebackup = false -- Don't create backup before overwriting
opt.swapfile = false    -- Don't create swap files
opt.undofile = true     -- Enable persistent undo
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo"

-- 🖱️ Mouse & Interaction
opt.mouse = "a"         -- Enable mouse support in all modes
opt.clipboard = "unnamedplus" -- Use system clipboard

-- ⚡ Performance & Behavior
opt.updatetime = 250    -- Faster completion and git signs
opt.timeoutlen = 500    -- Time to wait for mapped sequence to complete
opt.ttimeoutlen = 10    -- Time to wait for key code sequence
opt.hidden = true       -- Allow hidden buffers
opt.lazyredraw = true   -- Don't redraw during macros

-- 🎨 Visual Enhancements
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.pumheight = 10       -- Popup menu height
opt.cmdheight = 1        -- Command line height
opt.showmode = false     -- Don't show mode in command line (status line shows it)
opt.showtabline = 2      -- Always show tab line
opt.laststatus = 3       -- Global status line

-- 🔧 Completion & Wildmenu
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.completeopt = "menu,menuone,noselect" -- Better completion experience

-- 📂 File Explorer
opt.splitright = true   -- Open vertical splits to the right
opt.splitbelow = true   -- Open horizontal splits below

-- 🌙 Sacred Technology Specific Settings
-- Set leader key for contemplative access
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable some built-in plugins for performance
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1

-- Sacred technology message
vim.notify("🌙 Sacred Technology options configured for consciousness-serving development", vim.log.levels.INFO)
