require("yash")
require("yash.packer")
require("mason").setup()
 require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

