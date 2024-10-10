lvim.plugins = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestions = { enabled = false },
          panel = { enabled = false },
        })
      end,
    },
  
  -- extra features work with LSP
   { "jose-elias-alvarez/typescript.nvim" },
  
  -- colorschemes
   { "lunarvim/lunar.nvim" },
   { "morhetz/gruvbox" },
   { "sainnhe/gruvbox-material" },
   { "sainnhe/sonokai" },
   { "sainnhe/edge" },
   { "lunarvim/horizon.nvim" },
   { "tomasr/molokai" },
   { "ayu-theme/ayu-vim" },
   { "nordtheme/vim" },
  
   {
     "folke/trouble.nvim",
     cmd = "TroubleToggle",
   },
  
  -- TODO: colors
   {
     "folke/todo-comments.nvim",
     event = "BufRead",
     config = function()
       require("todo-comments").setup()
     end
   },
  
  --
   {
     "folke/persistence.nvim",
     event = "BufReadPre",
     config = function()
       require("persistence").setup({
         dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
         options = { "buffers", "curdir", "tabpages", "winsize" }
       })
     end
   },
  
  -- Jump between tmux terminal window and Lvim window
  --  { "christoomey/vim-tmux-navigator" },
  
  -- vim-surround is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
   { "tpope/vim-surround" },
   { "felipec/vim-sanegx", event = "BufRead" },
   {
     "windwp/nvim-ts-autotag",
     config = function()
       require("nvim-ts-autotag").setup()
     end,
   },
   { "tpope/vim-repeat" },
  
   { "ThePrimeagen/harpoon" },
  
   {
     "phaazon/hop.nvim",
     branch = 'v2',
     config = function()
       require('hop').setup()
     end
   },
  
   {
     "nvim-telescope/telescope-frecency.nvim",
     dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
   },
  
   {
     "AckslD/nvim-trevJ.lua",
     config = 'require("trevj").setup()',
     init = function()
       vim.keymap.set('n', '<leader>j', function()
         require('trevj').format_at_cursor()
       end)
     end,
   },
  
  -- scala
  --  {
  --    "nvim-lua/plenary.nvim",
  --  },
   {
     "scalameta/nvim-metals",
     config = function()
       require("user.metals").config()
     end,
   },
  
   {	"ntpeters/vim-better-whitespace",
        config = function(_)
            -- Configure vim-better-whitespace
          vim.g.better_whitespace_enabled = 1
          vim.g.strip_whitespace_on_save = 1
        end,
        lazy = false
   },
   {
     "sindrets/diffview.nvim",
     event = "BufRead",
   },
   {
     "iamcco/markdown-preview.nvim",
     build = "cd app && npm install",
     ft = "markdown",
     config = function()
       vim.g.mkdp_auto_start = 1
     end,
   },
  }
  
  table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      local ok, cmp = pcall(require, "copilot_cmp")
      if ok then cmp.setup({}) end
    end,
  })
  
  lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "frecency")
  end