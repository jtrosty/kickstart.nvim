-- ============================================================
-- SECTION 10: Harpoon v2
-- HARPOON2 CONFIGURATION (vim.pack Edition)
-- ============================================================
do
    -- 1. Install Harpoon2 and dependencies using native vim.pack
    vim.pack.add {
        'https://github.com/ThePrimeagen/harpoon',
        branch = 'harpoon2',
    }
    vim.pack.add { 'https://github.com' }

    -- 2. Initialize the plugin
    local harpoon = require 'harpoon'
    harpoon:setup {}

    -- 3. Core Harpoon UI Keymaps
    vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd file' })

    vim.keymap.set('n', '<leader>he', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [E]dit menu' })

    -- 4. Fast Navigation: Space + Number (1 through 9)
    for i = 1, 9 do
        vim.keymap.set('n', string.format('<leader>%d', i), function()
            harpoon:list():select(i)
        end, { desc = string.format('Harpoon to file %d', i) })
    end

    -- 5. Sequential Cycling: Next (Space+n) and Previous (Space+p)
    vim.keymap.set('n', '<leader>n', function()
        harpoon:list():next()
    end, { desc = 'Harpoon [N]ext file' })

    vim.keymap.set('n', '<leader>p', function()
        harpoon:list():prev()
    end, { desc = 'Harpoon [P]revious file' })
end
