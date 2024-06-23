local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.relativenumber = true
opt.wrap = false

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.scrolloff = 10

--local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.go",
--  callback = function()
--    require("go.format").goimport()
--  end,
--  group = format_sync_grp,
--})
--require("go").setup()
