local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local colors = {
  black      = "#16161E",
  magenta    = "#bb9af7",
  fg_gutter  = "#3B4261",
  fg_gutter2 = "#26293B",
  fg_sidebar = "#a9b1d6",
  blue       = "#7aa2f7",
  dark       = "#16161e",
  red        = "#f7768e",
  green      = "#c3e88d",
  yellow     = "#e0af68",
}

local tokyoballs = {
  visual = {
    a = { bg = colors.magenta, fg = colors.black, "bold" },
    b = { bg = colors.fg_gutter, fg = colors.magenta },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.red },
  },
  inactive = {
    a = { bg = colors.dark, fg = colors.blue },
    b = { bg = colors.dark, fg = colors.fg_gutter, "bold" },
    c = { bg = colors.dark, fg = colors.fg_gutter },
  },
  insert = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.green },
  },
  normal = {
    a = { bg = colors.blue, fg = colors.black, "bold" },
    b = { bg = colors.fg_gutter2, fg = colors.blue },
    c = { bg = colors.dark, fg = colors.fg_gutter },
  },
  command = {
    a = { bg = colors.yellow, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.yellow },
}
}


local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic", "nvim_lsp" },
	sections = { "error", "warn"},
	--[[ sections = { "error", "warn", "info", "hint"}, ]]
	symbols = { error = "E:", warn = "W:"},
	--[[ symbols = { error = " ", warn = " ", info = " ", hint = " " }, ]]
	colored = true,
	update_in_insert = false,
	always_visible = true,
}


local diff = {
	"diff",
	colored = true,
	symbols = { added = "+ ", modified = "~ ", removed = "- " }, -- changes diff symbols
	--symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		--return " " .. str .. " "
		return " " .. str
	end,
}


local filename = {
  "filename",
  path= 2,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	--icon = nil,
  colored = false,
}

local fileformat = {
	"fileformat",
  fmt = string.upper,
	icons_enabled = false,
	--icon = nil,
  colored = false,
}

local branch = {
	"branch",
	icons_enabled = true,
}

local location = {
	"location",
  --If weird prob cuz this
	padding = 1,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

--[[ local spaces = function() ]]
--[[ 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") ]]
--[[ end ]]

lualine.setup({
	options = {
		icons_enabled = true,
		theme = tokyoballs,
		component_separators = { left = "▎", right = "▎" },
		--component_separators = { left = "⢸", right = "⢸" },
    --icons;  
		--section_separators = { left = "█▒░", right = "░▒█" },
		--section_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch},
		lualine_c = { "filename" },
	  --lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, diagnostics, fileformat, filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { filename },
		lualine_x = { "encoding" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
