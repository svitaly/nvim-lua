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
    }, {
	     "nvim-telescope/telescope-file-browser.nvim",
         dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }, {
	    'numToStr/Comment.nvim', lazy = false,
    }, {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }, {
	    'windwp/nvim-autopairs', event = 'InsertEnter', opts = {}
    }, {
	    'Mofiqul/dracula.nvim', name = 'dracula', lazy = false, priority = 1000,
    }, {
	    'nvim-treesitter/nvim-treesitter', lazy = false, run = ':TSUpdate'
    }, {
	    'mbbill/undotree', lazy = false,
    }, {
	    'tpope/vim-fugitive', lazy = false,
    }, {
	    'lewis6991/gitsigns.nvim', lazy = false,
    }, {
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

