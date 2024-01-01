vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- DiffView  - pretty version to do diffs 
-- cycle through files with Tab and s-Tab
vim.keymap.set("n", "<leader>gh", vim.cmd.DiffviewFileHistory); -- current repo
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory %<CR>'); --current file
vim.keymap.set("n", "<leader>gc", vim.cmd.DiffviewClose); --also :tabclose
