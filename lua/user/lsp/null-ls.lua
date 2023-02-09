local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

null_ls.setup({
    debug = false,
    sources = {
        require("null-ls").builtins.formatting.stylua,
       -- require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.diagnostics.shellcheck,
       -- require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.formatting.autopep8,
        --require("null-ls").builtins.completion.prettierd,
    },
})
