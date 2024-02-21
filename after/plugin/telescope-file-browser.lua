-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!

require("telescope").setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
    },
}
vim.api.nvim_set_keymap(
    "n",
    "<space>pwd",
    ":Telescope file_browser path=%:p:h select_buffer=true",
    { noremap = true }
)
require("telescope").load_extension "file_browser"
