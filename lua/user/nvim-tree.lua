local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end


nvimtree.setup({
  sync_root_with_cwd = true,
  hijack_unnamed_buffer_when_opening = true,
  sort_by = "case_sensitive",
  hijack_cursor = true,
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


