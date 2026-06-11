do
vim.pack.add {{
   src = 'https://github.com/mrcjkb/rustaceanvim',
  -- To avoid being surprised by breaking changes,
  -- I recommend you set a version range
  version = vim.version.range('^9')
}}
end
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)

server = {
    settings = {
      ['rust-analyzer'] = {
-- ADD THESE: Keymaps to physically scale the quickfix window taller/shorter
        checkOnSave = true,
        check = {
          command = "clippy", -- Swaps cargo check for cargo clippy
          extraArgs = { "--no-deps" }, -- Speeds up calculation significantly
        },
      },
    },
  }
