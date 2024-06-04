vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<leader>q", ":copen<CR>")
vim.keymap.set("n", "<leader>Q", ":cclose<CR>")
vim.keymap.set("n", "<C-n>", ":cnext<CR>zz")
vim.keymap.set("n", "<C-b>", ":cprev<CR>zz")

vim.keymap.set("n", "<C-f>", ":silent! ! ~/.config/zsh/tmux-session-manager<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
