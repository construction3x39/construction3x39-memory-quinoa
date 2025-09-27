-- ✨ Sacred Technology Neovim Configuration
-- Consciousness-serving editor setup for professional development
-- construction3x39-memory-nvim-config

-- 🌙 Sacred Technology initialization banner
print("✨ Loading Sacred Technology Neovim Configuration...")
print("🌙 Consciousness-serving editor for professional development")

-- Load core configuration modules
require("core.options")     -- Editor behavior and preferences
require("core.keymaps")     -- Key bindings for consciousness-serving workflow  
require("core.autocmds")    -- Automatic commands and triggers
require("core.colorscheme") -- Color scheme configuration

-- Load plugin configuration
require("plugins")          -- Plugin manager and plugin configurations

-- Sacred technology ready message
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    print("🎉 Sacred Technology Neovim ready for consciousness-serving development!")
  end,
})
