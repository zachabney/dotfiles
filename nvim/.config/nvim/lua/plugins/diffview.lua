local close_keymap = { "n", "<leader>v", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } }
return {
    'sindrets/diffview.nvim',
    opts = {
        keymaps = {
            view = {
                close_keymap
            },
            diff1 = {
                close_keymap
            },
            diff2 = {
                close_keymap
            },
            diff3 = {
                close_keymap
            },
            diff4 = {
                close_keymap
            },
            file_panel = {
                close_keymap
            },
            file_history_panel = {
                close_keymap
            },
            option_panel = {
                close_keymap
            },
            help_panel = {
                close_keymap
            }
        }
    }
}
