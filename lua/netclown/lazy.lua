local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
	    'nvim-telescope/telescope.nvim', tag = '0.1.2',
	    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
	    'numToStr/Comment.nvim',
	    lazy = false,
    },
    {
        'kylechui/nvim-surround',
	    lazy = false,
    },
    {
	    'rose-pine/neovim',
	    name = 'rose-pine',
	    lazy = false,
	    priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
	    'nvim-treesitter/nvim-treesitter',
	    lazy = false, -- make sure we load this during startup
	    run = ':TSUpdate'
    },
    {
	    'mbbill/undotree',
	    lazy = false,
    },
    {
	    'tpope/vim-fugitive',
	    lazy = false,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
}
})

