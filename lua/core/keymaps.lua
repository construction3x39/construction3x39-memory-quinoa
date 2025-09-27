-- ⌨️ Sacred Technology Neovim Keymaps
-- Key bindings optimized for consciousness-serving development workflow

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 🌙 Sacred Technology Leader Key
-- Space as leader for contemplative access (set in options.lua)

-- 🚪 Escape Alternatives (flow state preservation)
map("i", "jk", "<Esc>", opts) -- Quick escape without hand movement
map("i", "kj", "<Esc>", opts) -- Alternative quick escape

-- 🧭 Sacred Navigation (home row efficiency)
-- Window navigation (consistent with tmux/screen)
map("n", "<C-h>", "<C-w>h", opts) -- Move to left window
map("n", "<C-j>", "<C-w>j", opts) -- Move to bottom window
map("n", "<C-k>", "<C-w>k", opts) -- Move to top window
map("n", "<C-l>", "<C-w>l", opts) -- Move to right window

-- Window management
map("n", "<leader>wv", "<C-w>v", opts) -- Split window vertically
map("n", "<leader>wh", "<C-w>s", opts) -- Split window horizontally
map("n", "<leader>we", "<C-w>=", opts) -- Equalize window sizes
map("n", "<leader>wx", ":close<CR>", opts) -- Close current window

-- 📁 Buffer Management (consciousness-serving workflow)
map("n", "<leader><leader>", "<C-^>", opts) -- Quick buffer switch
map("n", "<leader>bn", ":bnext<CR>", opts) -- Next buffer
map("n", "<leader>bp", ":bprevious<CR>", opts) -- Previous buffer
map("n", "<leader>bd", ":bdelete<CR>", opts) -- Delete buffer
map("n", "<leader>ba", ":%bdelete<CR>", opts) -- Delete all buffers

-- 📝 Editing Enhancements
map("n", "<leader>nh", ":nohl<CR>", opts) -- Clear search highlights
map("n", "x", '"_x', opts) -- Delete character without copying to register

-- Move lines up/down (contemplative code organization)
map("n", "<A-j>", ":m .+1<CR>==", opts) -- Move line down
map("n", "<A-k>", ":m .-2<CR>==", opts) -- Move line up
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- Move selection down
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- Move selection up

-- 🔍 Search & Find (telescope integration)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- Find files
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts) -- Find text
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- Find buffers
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- Find help
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts) -- Recent files
map("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", opts) -- Color schemes

-- 🌿 Git Operations (sacred technology version control)
map("n", "<leader>gs", ":Git<CR>", opts) -- Git status
map("n", "<leader>ga", ":Git add .<CR>", opts) -- Git add all
map("n", "<leader>gc", ":Git commit<CR>", opts) -- Git commit
map("n", "<leader>gp", ":Git push<CR>", opts) -- Git push
map("n", "<leader>gl", ":Git log --oneline<CR>", opts) -- Git log
map("n", "<leader>gd", ":Git diff<CR>", opts) -- Git diff
map("n", "<leader>gb", ":Git blame<CR>", opts) -- Git blame

-- 🔧 Language Server Protocol (consciousness-serving development)
map("n", "<leader>ld", vim.lsp.buf.definition, opts) -- Go to definition
map("n", "<leader>lr", vim.lsp.buf.references, opts) -- Find references
map("n", "<leader>li", vim.lsp.buf.implementation, opts) -- Go to implementation
map("n", "<leader>lt", vim.lsp.buf.type_definition, opts) -- Type definition
map("n", "<leader>lh", vim.lsp.buf.hover, opts) -- Hover information
map("n", "<leader>ls", vim.lsp.buf.signature_help, opts) -- Signature help
map("n", "<leader>ln", vim.lsp.buf.rename, opts) -- Rename symbol
map("n", "<leader>la", vim.lsp.buf.code_action, opts) -- Code actions
map("n", "<leader>lf", vim.lsp.buf.format, opts) -- Format document

-- 📂 File Explorer (sacred technology navigation)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Toggle file explorer
map("n", "<leader>o", ":NvimTreeFocus<CR>", opts) -- Focus file explorer

-- 🎨 Visual Mode Enhancements
map("v", "<", "<gv", opts) -- Stay in indent mode when indenting left
map("v", ">", ">gv", opts) -- Stay in indent mode when indenting right

-- 📋 Clipboard Operations (system integration)
map("v", "<leader>y", '"+y', opts) -- Copy to system clipboard
map("n", "<leader>p", '"+p', opts) -- Paste from system clipboard
map("n", "<leader>P", '"+P', opts) -- Paste before from system clipboard

-- 🔄 Tab Management
map("n", "<leader>to", ":tabnew<CR>", opts) -- Open new tab
map("n", "<leader>tx", ":tabclose<CR>", opts) -- Close current tab
map("n", "<leader>tn", ":tabn<CR>", opts) -- Go to next tab
map("n", "<leader>tp", ":tabp<CR>", opts) -- Go to previous tab

-- 🌙 Sacred Technology Special Functions
map("n", "<leader>zm", ":ZenMode<CR>", opts) -- Toggle zen mode for contemplative coding
map("n", "<leader>tw", ":set wrap!<CR>", opts) -- Toggle line wrapping
map("n", "<leader>tn", ":set number!<CR>", opts) -- Toggle line numbers
map("n", "<leader>tr", ":set relativenumber!<CR>", opts) -- Toggle relative numbers

-- 🧘 Contemplative Development (custom sacred technology functions)
map("n", "<leader>cc", ":lua SacredCommit()<CR>", opts) -- Sacred technology commit
map("n", "<leader>cm", ":lua SacredMeditation()<CR>", opts) -- Meditation break reminder
map("n", "<leader>cf", ":lua SacredFocus()<CR>", opts) -- Focus mode activation

-- 📚 Documentation & Help
map("n", "<leader>hh", ":help<CR>", opts) -- Open help
map("n", "<leader>hk", ":help keymaps<CR>", opts) -- Keymap help
map("n", "<leader>hp", ":help plugins<CR>", opts) -- Plugin help

-- 🌙 Sacred Technology Notification
vim.notify("⌨️ Sacred Technology keymaps configured for consciousness-serving workflow", vim.log.levels.INFO)
