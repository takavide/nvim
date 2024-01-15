local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok2 then
  return
end

local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jdtls",
  "jsonls",
  "solc",
  "solidity_ls",
  "sumneko_lua",
  "tflint",
  "terraformls",
  "tsserver",
  "pyright",
  "yamlls",
  "bashls",
  "clangd",
  "rust_analyzer",
  "taplo",
  "zk@v0.10.1",
  "lemminx"
}

mason.setup {
  ui = {
    icons = {
      --[[ package_installed = "﫟 ", ]]
      --[[ package_pending = "", ]]
      --[[ package_uninstalled = " ", ]]
      package_installed = "◆",
      package_pending = "P",
      package_uninstalled = "◊",
    },
    border = "single",
  },
  log_level = vim.log.levels.INFO,
}

mason_lspconfig.setup {
}

local lsp_flags = {
  debounce_text_changes = 150,
}

require'lspconfig'.rust_analyzer.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.pyright.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.svelte.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.lua_ls.setup{

  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
  settings = {
    Lua = {
      type = {
        -- weakUnionCheck = true,
        -- weakNilCheck = true,
        -- castNumberToInteger = true,
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
        arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
        await = true,
        paramName = "Disable", -- "All", "Literal", "Disable"
        paramType = false,
        semicolon = "Disable", -- "All", "SameLine", "Disable"
        setType = true,
      },
      -- spell = {"the"}
      runtime = {
        version = "LuaJIT",
        special = {
          reload = "require",
        },
      },
      diagnostics = {
        globals = { "vim" },

      },
      workspace = {
        library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}


require'lspconfig'.cssls.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require("lspconfig").intelephense.setup {
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require("lspconfig").emmet_ls.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.cssmodules_ls.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.bashls.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.eslint.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.tsserver.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.html.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

require'lspconfig'.clangd.setup{

  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

require'lspconfig'.als.setup{
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    settings = {
        ada = {
          filetypes ={
            "ads",
            "adb",
            "ada"
        }
      },
    },
    flags = lsp_flags,
}

require'lspconfig'.asm_lsp.setup{
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    flags = lsp_flags,
}

vim.api.nvim_set_hl(0, "NormalFloat", {bg="#16161e"})
vim.api.nvim_set_hl(0, "FloatBorder", {bg="#16161e",fg="#16161e"})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {underline=true, undercurl=false, sp="#db4b4b"})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {underline=true, undercurl=false, sp="#e0af68"})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  {underline=true, undercurl=false, sp="#0db9d7"})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  {underline=true, undercurl=false, sp="#1abc9c"})
