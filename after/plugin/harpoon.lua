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

vim.keymap.set("n", "<leader>fx", require('harpoon.mark').add_file)
vim.keymap.set("n", "L", "<nop>")
vim.keymap.set("n", "H", "<nop>")
vim.keymap.set("n", "L", require('harpoon.ui').nav_next)
vim.keymap.set("n", "H", require('harpoon.ui').nav_prev)
vim.keymap.set('n', '<leader>fh', ':Telescope harpoon marks<CR>')
