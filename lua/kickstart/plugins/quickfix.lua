-- 1. Register and download the plugin via vim.pack first
vim.pack.add({ 'https://github.com/stevearc/quicker.nvim' })

-- 2. Configure keymaps safely
vim.keymap.set("n", "<leader>qb", function()
    require("quicker").toggle()
end, {
    desc = "Toggle quickfix",
})

vim.keymap.set("n", "<leader>l", function()
    require("quicker").toggle({ loclist = true })
end, {
    desc = "Toggle loclist",
})

-- 3. Run the setup configuration
require("quicker").setup({
    keys = {

-- ADD THESE: Keymaps to physically scale the quickfix window taller/shorter
        {
          "J",
          "<cmd>resize +5<CR>",
          desc = "Make quickfix window taller",
        },
        {
          "K",
          "<cmd>resize -5<CR>",
          desc = "Make quickfix window shorter",
        },
        {
            ">",
            function()
                require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
            end,
            desc = "Expand quickfix context",
        },
        {
            "<",
            function()
                require("quicker").collapse()
            end,
            desc = "Collapse quickfix context",
        },
    },
})
