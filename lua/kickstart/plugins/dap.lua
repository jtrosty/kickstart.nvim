do
    -- Helper function for GitHub specs
    local function github(repo, name)
        local spec = { src = 'https://github.com' .. repo }
        if name then spec.name = name end
        return spec
    end

    -- Install nvim-dap via vim.pack
    vim.pack.add({
        github('mfussenegger/nvim-dap'),
    })

    -- Configure the probe-rs adapter for embedded hardware debugging
    local dap = require('dap')
    dap.adapters.probe_rs = {
        type = 'server',
        port = '${port}',
        executable = {
            command = 'probe-rs',
            args = { 'dap-server', '--port', '${port}' },
        },
    }

    -- Set up basic debugging keymaps
    -- vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    -- vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
    -- vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
    -- vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    local keymap = vim.keymap.set
    keymap(
        { 'n', 'v' },
        '<F3>',
        "<cmd>lua require('dap-view').toggle()<CR>",
        { silent = true, desc = 'DAP toggle UI' }
    )
    keymap(
        { 'n', 'v' },
        '<F4>',
        "<cmd>lua require('dap').pause()<CR>",
        { silent = true, desc = 'DAP pause (thread)' }
    )
    keymap(
        { 'n', 'v' },
        '<F5>',
        "<cmd>lua require('dap').continue()<CR>",
        { silent = true, desc = 'DAP launch or continue' }
    )
    keymap(
        { 'n', 'v' },
        '<F6>',
        "<cmd>lua require('dap').step_into()<CR>",
        { silent = true, desc = 'DAP step into' }
    )
    keymap(
        { 'n', 'v' },
        '<F7>',
        "<cmd>lua require('dap').step_over()<CR>",
        { silent = true, desc = 'DAP step over' }
    )
    keymap(
        { 'n', 'v' },
        '<F8>',
        "<cmd>lua require('dap').step_out()<CR>",
        { silent = true, desc = 'DAP step out' }
    )
    keymap(
        { 'n', 'v' },
        '<F9>',
        "<cmd>lua require('dap').step_back()<CR>",
        { silent = true, desc = 'DAP step back' }
    )
    keymap({ 'n', 'v' }, '<F10>', function()
        dap_run_last()
    end, { silent = true, desc = 'DAP run last' })
    -- F11 is used by KDE for fullscreen
    keymap(
        { 'n', 'v' },
        '<F12>',
        "<cmd>lua require('dap').terminate()<CR>",
        { silent = true, desc = 'DAP terminate' }
)
end
