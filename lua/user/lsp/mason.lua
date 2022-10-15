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
      package_installed = "﫟 ",
      package_pending = "",
      package_uninstalled = " ",
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


require'lspconfig'.sumneko_lua.setup{

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

require'lspconfig'.tsserver.setup{
  flags = lsp_flags,
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}


vim.api.nvim_set_hl(0, "NormalFloat", {bg="#16161e"})
vim.api.nvim_set_hl(0, "FloatBorder", {bg="#16161e",fg="#16161e"})

