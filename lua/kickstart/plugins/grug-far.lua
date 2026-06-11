-- 1. Register and automatically download the plugin via vim.pack
vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })

-- 2. Configure the plugin
require('grug-far').setup({
    -- Leave blank for defaults, or add custom configuration options here
})

-- 3. Set up a convenient keymap to open the search and replace interface
vim.keymap.set('n', '<leader>gs', function()
    require('grug-far').open()
end, { desc = 'GrugFar: Search and Replace' })
