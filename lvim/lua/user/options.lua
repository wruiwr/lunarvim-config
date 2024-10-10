if vim.g.neovide then
    vim.opt.guifont = "JetBrainsMono Nerd Font:h13"

    -- Helper function for transparency formatting
    local alpha = function()
        return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_transparency = 0.0
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#0f1117" .. alpha()
    -- Add keybinds to change transparency
    local change_transparency = function(delta)
        vim.g.transparency = vim.g.transparency + delta
        vim.g.neovide_background_color = "#0f1117" .. alpha()
    end
    vim.keymap.set({ "n", "v", "o" }, "<C-+>", function()
        change_transparency(0.1)
    end)
    vim.keymap.set({ "n", "v", "o" }, "<C-->", function()
        change_transparency(-0.1)
    end)

    vim.g.neovide_scroll_animation_length = 0.3
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_input_macos_alt_is_meta = false

    -- Dynamically Change The Scale At Runtime
    vim.g.neovide_scale_factor = 1.
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<D-+>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<D-->", function()
        change_scale_factor(1/1.25)
    end)

    vim.g.neovide_remember_window_size = true

    vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
    vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
    vim.keymap.set('v', '<D-c>', '"+y') -- Copy
    vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

lvim.log.level = "warn"
lvim.format_on_save = true

lvim.transparent_window = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "haskell",
  "scala",
  "go",
  "comment",
  "awk",
  "bibtex",
  "cmake",
  "cpp",
  "diff",
  "dockerfile",
  "dot",
  "html",
  "kotlin",
  "make",
  "markdown",
  "markdown_inline",
  "php",
  "proto",
  "regex",
  "scheme",
  "sql",
  "vim",
}

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = {}

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
  ".git",
  "package-lock.json",
  "yarn.lock",
  "package.json",
  "requirements.txt",
}

vim.opt.shell = "/bin/bash"
lvim.format_on_save = true

vim.o.linebreak = true
vim.o.wrap = false
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

lvim.builtin.telescope.defaults.path_display = {
  shorten = 4,
}

lvim.builtin.dap.active = true

-- -- other vim settings
-- spell checking
vim.opt_local.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spellfile = vim.fn.expand("~/.local/share/nvim/site/spell/spf.%s.add"):format(vim.o.encoding)
vim.opt.thesaurusfunc = "v:lua.vim.openoffice.thesaurusfunc" -- support openoffice thesauri, see plugin/thesaurus.lua
vim.opt.thesaurus = {
  -- archlinux packages extra/mythes-{en,de,..}
  "/usr/share/mythes/th_en_US_v2.dat",
  "/usr/share/mythes/th_de_DE_v2.dat"
}

vim.opt.history = 500

-- Be smart when using tabs
vim.opt.smarttab = true
-- 1 tab == 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- line break configuration
vim.opt.textwidth = 79
vim.opt.colorcolumn = { 80, 120 }
vim.opt.breakindent = true
vim.opt.linebreak = true

-- smart search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- markdown-preview-settings
vim.g.mkdp_auto_start = 1
vim.g.mkdp_theme = 'light'

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})