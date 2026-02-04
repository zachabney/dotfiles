local group = vim.api.nvim_create_augroup('Markdown Wrap Settings', { clear = true })

-- Enable wrap for markdown files
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {'*.md'},
    group = group,
    command = 'setlocal wrap'
})
