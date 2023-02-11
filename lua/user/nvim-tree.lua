local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvimtree.setup({
  hijack_netrw=true,
  hijack_unnamed_buffer_when_opening = true,
  sync_root_with_cwd=true,
  sort_by = "case_sensitive",
  filesystem_watchers={
    enable=true,
  },
  update_focused_file={
    enable=true,
    update_root=true,
  },
  modified={
    enable=false,
  },
  respect_buf_cwd=true,
  hijack_cursor = true,
  prefer_startup_root=true,
  view = {
    side = "left",
    width = 30,
    adaptive_size = false,
    hide_root_folder = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },

  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
    ignore = true,
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",
    add_trailing = false,
    indent_markers = {
      enable = true,
    },

    icons = {
      --webdev_colors = false,
      show = {
        file = false,
        folder = false,
        folder_arrow = true,
        git = false,
      },

--      glyphs = {
--        default = "",
--        symlink = "",
--        folder = {
--          default = "",
--          empty = "",
--          empty_open = "",
--          open = "",
--          symlink = "",
--          symlink_open = "",
--          arrow_open = "",
--          --arrow_open = "",
--          arrow_closed = "",
--          --arrow_closed = "",
--        },
--        git = {
--          unstaged = "✗",
--          staged = "✓",
--          unmerged = "",
--          renamed = "➜",
--          untracked = "★",
--          deleted = "",
--          ignored = "◌",
--        },
--      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "-",
          --arrow_open = "",
          arrow_closed = "+",
          --arrow_closed = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
})

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- change to the directory

  if not directory then
    return
  end

  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end



vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
