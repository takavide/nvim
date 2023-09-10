require "user.options"
require "user.keymaps"
require "user.plugins"
require 'user.impatient'
require "user.colorscheme"
require "user.lsp" -- lag on large files small culprit - already has latency
require "user.cmp" -- lag on large files small cuplrit fix by adding latency or keymap to disable cmp on buffer?
require "user.telescope" -- live grep laggy not useful(maybe fixed with turning of indentline?
require "user.treesitter" -- lag large files big culprit - changed treesitter conf to turn off on large files but can still cause lag
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.indentline" -- lag fixed with turning off treesitter
require "user.toggleterm"
require "user.colorizer"
require "user.whichkey"
require "user.dashboard"
require "user.cybu"
require "user.orgmode"
--require "user.trouble"
--require "user.discord-presence

