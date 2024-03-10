local home = vim.fn.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local jdtls = require('jdtls')

local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)



local on_attach = function(client, bufnr)
  -- Regular Neovim LSP client keymappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
--  nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
--  nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
--  nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
--  nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
--  nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
--  nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
--  nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
--  nnoremap('<space>wl', function()
--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  end, bufopts, "List workspace folders")
--  nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
--  nnoremap('<space>rn', vim.lsp.buf.rename, bufopts, "Rename")
--  nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts, "Code actions")
--  vim.keymap.set('v', "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
--    { noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
--  nnoremap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
--
  -- Java extensions provided by jdtls
  nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
end





local workspace_dir = home .. '/java/'
local config = {
    cmd = {
        "java" ,
	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product ',
	'-Dlog.level=ALL ',
	'-noverify',
	'-Xmx1G',
    '-javaagent:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
	--add-modules=ALL-SYSTEM \
	--add-opens java.base/java.util=ALL-UNNAMED \
	--add-opens java.base/java.lang=ALL-UNNAMED \
--	'-jar', '/home/thermodynamics/Downloads/nvim/jdt-language-server-1.20.0-202302201605/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--	'-configuration', '/home/thermodynamics/Downloads/nvim/jdt-language-server-1.20.0-202302201605/config_linux/',
    '-jar','~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar',
    '-configuration' , '~/.local/share/nvim/mason/packages/jdtls/config_linux/',
	'-data', workspace_dir .. project_name
},

    flags={
        on_attach=on_attach,
    },
configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = home .." /usr/lib/jvm/java-17-openjdk-amd64/bin/java",
          },
      }
}
}
    --root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
require('jdtls').start_or_attach(config)
