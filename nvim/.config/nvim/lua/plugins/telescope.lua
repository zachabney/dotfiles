-- Searching
return {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = function()
        local actions = require('telescope.actions')
        return {
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-v>"] = actions.file_vsplit,
                        ["<C-h>"] = actions.file_split,
                    }
                }
            }
        }
    end
}
