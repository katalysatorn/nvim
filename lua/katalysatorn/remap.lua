vim.g.mapleader = " "

-- Go back to file tree (:Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode move lines up or down when selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Similar to the above - but in normal mode - move the line below *up*
vim.keymap.set("n", "J", "mzJ`z")

-- Jump up a page(?)
vim.keymap.set("n", "<C-J>", "<C-d>zz")
vim.keymap.set("n", "<C-K>", "<C-u>zz")

