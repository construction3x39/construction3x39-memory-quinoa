-- 🔄 Sacred Technology Neovim Autocmds
-- Automatic commands and triggers for consciousness-serving development

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 🌙 Sacred Technology Autocommand Groups
local sacred_tech = augroup("SacredTechnology", { clear = true })
local file_management = augroup("FileManagement", { clear = true })
local ui_enhancements = augroup("UIEnhancements", { clear = true })
local development_workflow = augroup("DevelopmentWorkflow", { clear = true })

-- 📁 File Management (consciousness-serving file operations)
autocmd("BufWritePre", {
  group = file_management,
  desc = "Create missing directories on save",
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

autocmd("BufWritePre", {
  group = file_management,
  desc = "Remove trailing whitespace on save",
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

autocmd("BufRead", {
  group = file_management,
  desc = "Return to last edit position when opening files",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 🎨 UI Enhancements (consciousness-serving visual feedback)
autocmd("TextYankPost", {
  group = ui_enhancements,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

autocmd("VimResized", {
  group = ui_enhancements,
  desc = "Automatically resize splits when window is resized",
  command = "tabdo wincmd =",
})

autocmd("FocusGained", {
  group = ui_enhancements,
  desc = "Reload file if it has been changed outside of vim",
  command = "checktime",
})

-- 📝 Development Workflow (sacred technology automation)
autocmd("FileType", {
  group = development_workflow,
  desc = "Set specific settings for different file types",
  pattern = { "clojure", "clojurescript", "fennel" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.commentstring = ";; %s"
  end,
})

autocmd("FileType", {
  group = development_workflow,
  desc = "Markdown settings for documentation",
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.conceallevel = 2
    vim.opt_local.spell = true
  end,
})

autocmd("FileType", {
  group = development_workflow,
  desc = "Git commit message settings",
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
    vim.opt_local.colorcolumn = "50,72"
  end,
})

autocmd("FileType", {
  group = development_workflow,
  desc = "Nix expression settings",
  pattern = "nix",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.commentstring = "# %s"
  end,
})

-- 🌙 Sacred Technology Specific Automations
autocmd("VimEnter", {
  group = sacred_tech,
  desc = "Sacred technology welcome message",
  once = true,
  callback = function()
    vim.defer_fn(function()
      vim.notify("🌙 Sacred Technology Neovim ready for consciousness-serving development", vim.log.levels.INFO)
    end, 100)
  end,
})

autocmd("BufWritePost", {
  group = sacred_tech,
  desc = "Auto-source Neovim config files",
  pattern = { "*.lua" },
  callback = function()
    local config_path = vim.fn.expand("~/.config/nvim")
    if string.find(vim.fn.expand("%:p"), config_path, 1, true) then
      vim.cmd("source %")
      vim.notify("🔄 Sacred Technology config reloaded", vim.log.levels.INFO)
    end
  end,
})

-- 💾 Buffer Management (contemplative workflow)
autocmd("BufWinEnter", {
  group = sacred_tech,
  desc = "Start in insert mode for commit messages",
  pattern = "COMMIT_EDITMSG",
  command = "startinsert",
})

autocmd("FileType", {
  group = sacred_tech,
  desc = "Close certain windows with 'q'",
  pattern = { "help", "startuptime", "qf", "lspinfo", "man", "tsplayground" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true, silent = true })
  end,
})

-- 🧘 Contemplative Development Reminders
local meditation_timer = nil

local function schedule_meditation_reminder()
  if meditation_timer then
    vim.fn.timer_stop(meditation_timer)
  end
  
  -- Remind to take breaks every 25 minutes (Pomodoro-inspired)
  meditation_timer = vim.fn.timer_start(25 * 60 * 1000, function()
    vim.notify("🧘 Sacred pause: Consider a mindful breath or brief meditation", vim.log.levels.WARN)
    schedule_meditation_reminder() -- Reschedule
  end)
end

autocmd("VimEnter", {
  group = sacred_tech,
  desc = "Start meditation reminders",
  once = true,
  callback = function()
    vim.defer_fn(schedule_meditation_reminder, 2000) -- Start after 2 seconds
  end,
})

-- 🔐 GPG Integration (sacred technology security)
autocmd("FileType", {
  group = sacred_tech,
  desc = "Ensure GPG signing for Git commits",
  pattern = "gitcommit",
  callback = function()
    -- Verify GPG signing is enabled
    local gpg_enabled = vim.fn.system("git config --get commit.gpgsign"):gsub("\n", "")
    if gpg_enabled ~= "true" then
      vim.notify("⚠️ GPG signing not enabled. Run: git config --global commit.gpgsign true", vim.log.levels.WARN)
    end
  end,
})

-- 📊 Session Management (sacred technology workspace)
autocmd("VimLeavePre", {
  group = sacred_tech,
  desc = "Sacred technology farewell message",
  callback = function()
    vim.notify("🌙 Sacred Technology session complete. Code with consciousness! ✨", vim.log.levels.INFO)
  end,
})

-- 🌙 Sacred Technology Autocmds Ready
vim.notify("🔄 Sacred Technology autocmds configured for consciousness-serving development", vim.log.levels.INFO)
