--require('rose-pine').setup({
--})
--
--function ColorMyPencils(color) 
--	color = color or "rose-pine"
--	vim.cmd.colorscheme(color)
--
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
--end
--
--ColorMyPencils()
-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
    italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },

  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = true,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
