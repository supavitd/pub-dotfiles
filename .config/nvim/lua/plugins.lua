return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
    config = function()
      -- document existing key chains
    --   require('which-key').register {
    --     -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    --     -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    --     -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    --     -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
    --     -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    --     -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    --     -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    --     { "<leader>c", group = "[C]ode" },
    --     { "<leader>c_", hidden = true },
    --     { "<leader>d", group = "[D]ocument" },
    --     { "<leader>d_", hidden = true },
    --     { "<leader>g", group = "[G]it" },
    --     { "<leader>g_", hidden = true },
    --     { "<leader>h", group = "More git" },
    --     { "<leader>h_", hidden = true },
    --     { "<leader>r", group = "[R]ename" },
    --     { "<leader>r_", hidden = true },
    --     { "<leader>s", group = "[S]earch" },
    --     { "<leader>s_", hidden = true },
    --     { "<leader>w", group = "[W]orkspace" },
    --     { "<leader>w_", hidden = true },
    --   }
    end,
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  { 'rafamadriz/friendly-snippets' },
}
