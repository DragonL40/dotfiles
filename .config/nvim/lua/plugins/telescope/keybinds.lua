-- BROWSING
Keybind.g({
	-- search entered word within project
	{ 'n', '<Leader>fs', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], { noremap = true, silent = true } },
	-- search by selected word
	{ 'n', '<Leader>fw', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], { noremap = true, silent = true } },
	-- search by filename in git files
	{ 'n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true } },
	-- buffer list window
	{ 'n', '<Leader>pb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true } },
	-- search by filename in all project files
	{ 'n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true } },
	-- telescope through dotfiles
	{ 'n', '<Leader>vrc', [[<Cmd>lua require('plugins.telescope.settings').search_dotfiles()<CR>]], { noremap = true } },
    -- telescope help tags
	{ 'n', '<Leader>vh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true } },
})


-- GIT
Keybind.g({
	-- git branches
	{ 'n', '<Leader>gc', [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true } },
})
