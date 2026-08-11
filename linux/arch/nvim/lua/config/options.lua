-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.keymap.set("n", "<F12>", function()
  vim.cmd("write")
  vim.cmd("botright split | terminal node " .. vim.fn.expand("%:p"))
end, { desc = "Run current JavaScript file" })
