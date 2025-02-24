return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions
    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          theme = 'dropdown',
          hijack_netrw = true,
          mappings = {
            ['i'] = {
              ["<C-r>"] = fb_actions.rename,
              ["<C-y>"] = fb_actions.copy,
              ["<C-d>"] = fb_actions.remove,
              ["<C-o>"] = fb_actions.open,
              ["<C-n>"] = fb_actions.create,
              ["<C-k>"] = actions.preview_scrolling_up,
              ["<C-j>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.move_selection_previous,
              ["<PageDown>"] = actions.move_selection_next,
            },
            ['n'] = {
              ["r"] = fb_actions.rename,
              ["h"] = fb_actions.toggle_hidden,
              ["a"] = fb_actions.toggle_all,
              ["y"] = fb_actions.copy,
              ["d"] = fb_actions.remove,
              ["o"] = fb_actions.open,
              ["N"] = fb_actions.create,
              ["<bs>"] = fb_actions.backspace,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-k>"] = actions.preview_scrolling_up,
              ["<C-j>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.move_selection_previous,
              ["<PageDown>"] = actions.move_selection_next,
            }
          }
        }
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
    -- open file_browser with the path of the current buffer
    keymap.set("n", "<leader>fs", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
  end,
}
