local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        -- available analysers https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        unusedParams = true,
      },
    },
  },
}

lspconfig.rustanalyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer' },
  filetypes = {"rs"},
  root_dir = util.root_pattern("Cargo.toml"),
})

lspconfig.jsonnet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
