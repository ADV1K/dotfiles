local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.relativenumber = true
opt.wrap = false

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.scrolloff = 10
