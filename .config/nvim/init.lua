-- Indentation settings
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Line numbers and relative number
vim.opt.relativenumber = true      -- Shows relative numbers to current line
vim.opt.number = true              -- Show absolute line numbers

-- Terminal and cursor settings
vim.opt.hidden = true              -- Allow hidden buffers
vim.opt.cursorline = true          -- Highlight the current line
vim.opt.colorcolumn = "80"         -- Highlight column 80
vim.opt.backspace = "indent,eol,start"  -- Make backspace behave more intuitively
vim.opt.ignorecase = true          -- Ignore case in searches
vim.opt.smartcase = true           -- Override ignorecase when uppercase is used

-- Autocorrect line mappings for brackets and braces
vim.api.nvim_set_keymap('i', '{<cr>', '{<cr>}<c-o><s-o>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[<cr>', '[<cr>]<c-o><s-o>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(<cr>', '(<cr>)<c-o><s-o>', { noremap = true, silent = true })

