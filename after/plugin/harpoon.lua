require('harpoon').setup {
  global_settings = {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },

      -- set marks specific to each git branch inside git repository
      mark_branch = true,

      -- enable tabline with harpoon marks
      tabline = false,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
  }
}

-- make harpoon work in telescope
require("telescope").load_extension("harpoon")
vim.keymap.set('n', '<leader>fh', ':Telescope harpoon marks<CR>')
-- in telescope:
-- <c-d> - delete mark
-- <c-n> - mover mark down
-- <c-p> - mover mark up

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
-- vim.keymap.set('n', '<leader>fh', ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>fx", mark.add_file)
vim.keymap.set("n", "L", "<nop>")
vim.keymap.set("n", "H", "<nop>")
vim.keymap.set("n", "L", ui.nav_next)
vim.keymap.set("n", "H", ui.nav_prev)
-- navigation by number
vim.keymap.set("n", '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set("n", '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set("n", '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set("n", '<leader>4', function() ui.nav_file(4) end)
