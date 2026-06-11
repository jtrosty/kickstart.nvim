do
    -- Helper function that consistently returns a plugin table
    local function github(repo, name)
        local spec = { src = 'https://github.com/' .. repo }
        if name then spec.name = name end
        return spec
    end

    -- 1. Install Expanded List of Themes via vim.pack
    vim.pack.add({
        -- Core Themes
        github('ellisonleao/gruvbox.nvim'),
        github('catppuccin/nvim', 'catppuccin'),
        github('rebelot/kanagawa.nvim'),
        github('folke/tokyonight.nvim'),

        -- Added Extra Themes
        github('sainnhe/everforest'),
        github('EdenEast/nightfox.nvim'),
        github('sonph/onehalf', 'onehalf'), -- Aliased to target the /neovim directory cleanly
    })

    -- 2. Configure Gruvbox parameters (Startup Default)
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_italic = 1
    vim.g.gruvbox_bold = 1

    -- Set Gruvbox as active startup colorscheme
    vim.cmd.colorscheme('gruvbox')

    -- 3. Live Preview Theme Selector Keymap
    -- This activates the floating list; use J/K to scroll and watch themes swap live.
    vim.keymap.set('n', '<leader>ts', '<cmd>Telescope colorscheme enable_preview=true<cr>', {
        desc = '[T]heme [S]elector Picker (Live Preview)',
    })
end
