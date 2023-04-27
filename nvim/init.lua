
local util = require "util"
local packer_bootstrap = util.ensure_packer()
local packer = require "packer"

-- helpers


return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    
    -- vim enhancements
    use { 'ciaranm/securemodelines',
        config = function()
            vim.g.secure_modelines_allowed_items = {
                "textwidth",   "tw",
                "softtabstop", "sts",
                "tabstop",     "ts",
                "shiftwidth",  "sw",
                "expandtab",   "et",
                "noexpandtab", "noet",
                "filetype",    "ft",
                "foldmethod",  "fdm",
                "readonly",    "ro",
                "noreadonly",  "noro",
                "rightleft",   "rl",
                "norightleft", "norl",
                "colorcolumn"
            }
        end
    }
    use 'editorconfig/editorconfig-vim'
    use 'justinmk/vim-sneak'
    
    -- GUI enhancements
    use { 'danilo-augusto/vim-afterglow',
        config = function()
            vim.cmd.colorscheme('afterglow')
        end
    }
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = require 'plugins.lualine'
    }
    use 'machakann/vim-highlightedyank'
    use 'andymass/vim-matchup'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local tree = require "nvim-tree"
            tree.setup {}
    	    vim.keymap.set('', '<C-p>', ':NvimTreeToggle<cr>')
        end
    }
    use {
        'antosha417/nvim-lsp-file-operations',
        requires = {
          { "nvim-lua/plenary.nvim" },
          { "kyazdani42/nvim-tree.lua" },
        }
     }
    
    -- Fuzzy finder
    use 'airblade/vim-rooter'
    use { 'ibhagwan/fzf-lua',
      -- optional for icon support
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local fzf = require 'fzf-lua'
            vim.keymap.set('', '<leader>;', fzf.buffers) 
            vim.keymap.set('', '<leader>s', fzf.grep)
        end,
    }
    
    -- Semantic language support
    use { 'neovim/nvim-lspconfig',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp', branch = 'main' },
            { 'ray-x/lsp_signature.nvim' },
        },
        config = require 'plugins.lspconfig'
    }
    use { 'nvim-lua/lsp_extensions.nvim',
        config = function()
            -- Enable type inlay hints
            vim.cmd.autocmd(
                "CursorHold,CursorHoldI",
                "*.rs",
                ":lua require('lsp-extensions').inlay_hints { only_current_line = true }"
            )
        end
    }

    use { 'hrsh7th/nvim-cmp',
        branch = 'main',
        config = require 'plugins.cmp',
        requires = {
            { 'hrsh7th/cmp-path', branch = 'main' },
            { 'hrsh7th/cmp-buffer', branch = 'main' },
            { 'hrsh7th/cmp-vsnip', branch = 'main' },
            { 'hrsh7th/vim-vsnip' },
        },
    }
    
    -- Only because nvim-cmp _requires_ snippets
    
    -- Syntactic language support
    use 'cespare/vim-toml'
    use 'stephpy/vim-yaml'
    use 'rust-lang/rust.vim'
    use 'rhysd/vim-clang-format'
    use 'tbastos/vim-lua'
    -- use 'fatih/vim-go'
    use 'dag/vim-fish'
    use 'godlygeek/tabular'
    use 'plasticboy/vim-markdown'
  

    vim.cmd.filetype("plugin", "indent", "on") 

    local term = vim.env.TERM
    local options = {
    	guicursor = 'n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor',
    	inccommand = 'nosplit',
    
        -- deal with colors
    	t_Co = (not util.has 'gui_running' and 256),
    
    	termguicolors = term:find '-256color' and 
    	    not term:find 'screen-256color', -- `screen` does not (yet) support truecolor
    
    	-- use ag or ripgrep if found
    	grepprg =
    	    (vim.fn.executable 'ag' and 'ag --nogroup --nocolor') or
    	    (vim.fn.executable 'rg' and 'rg --no-heading --vimgrep') or
    	    nil,
    
    	grepformat = (vim.fn.executable 'rg' and '%f:%l:%c:%m') or
    	    nil,
    
        	--== Completion ==--
        	-- Better completion
        	-- menuone: popup even there's only one match
        	-- noinsert: Do not insert text until a selection is made
        	-- noselect: Do not select, force user to select one from the menu
    	completeopt = 'menuone,noinsert,noselect',

    	-- Better display for messages
    	cmdheight = 2,

    	-- You'll have a bad experience for diagnostic messages when it's the default 4000.
    	updatetime = 300,

    	--== Editor Settings ==--
    	autoindent = true,
    	
    	-- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
    	timeoutlen = 300,
    	encoding = 'utf-8',
	    scrolloff = 2,
	    showmode = false,
	    hidden = true,
	    wrap = false,
	    joinspaces = false,

	    -- Printer settings
	    printfont = ':h10',
	    printencoding = 'utf-8',

	    -- Always draw sign column. Prevent buffer moving when adding/deleting sign.
	    signcolumn = 'yes',
	    
	    -- Settings needed for .lvimrc
	    exrc = true,
	    secure = true,

	    -- Sane splits
	    splitright = true,
	    splitbelow = true,

	    -- Permanent undo
	    undodir = '~/.vimdid/',
	    undofile = true,

	    -- Decent wildmenu
	    wildmenu = true,
	    wildmode = 'list:longest',
	    wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor',

	    -- Use wide tabs
	    shiftwidth = 4,
	    softtabstop = 4,
	    tabstop = 4,
	    expandtab = true,

        -- Wrapping options
        formatoptions =
            'tc'..   -- wrap text and comments using textwidth
            'r'..    -- continue comments when pressing ENTER in I mode
            'q'..    -- enable formatting of comments with gq
            'n'..    -- detect lists for formatting
            'b'..    -- auto-wrap in insert mode, and do not wrap old long lines
            '',

        -- Proper search
        incsearch = true,
        ignorecase = true,
        smartcase = true,
        gdefault = true,

        --== GUI settings ==--
        guioptions = util.has 'gui_running' and vim.o.guioptions:gsub('T', ''), -- Remove toolbar 
        belloff = 'all',
        backspace = 2, -- Backspace over newlines
        foldenable = false,
        ttyfast = true,
        lazyredraw = true, -- https://github.com/vim/vim/issues/1735#issuecomment-383353563
        synmaxcol = 500,
        laststatus = 2,
        
        relativenumber = true,  -- Relative line numbers
        number = true,          -- Also show current absolute line
        
        diffopt = vim.o.diffopt..
            ',iwhite'..             -- No whitespace in vimdiff
            ',algorithm:patience'.. -- Make diffing better: https://vimways.org/2018/the-power-of-diff/
            ',indent-heuristic'..
            '',
        
        colorcolumn = 80,   -- Gimme a colored column
        showcmd = true,     -- Show partial command in status line.
        mouse = 'a',        -- Enable mouse usage for all modes in terminals
        -- Don't give |ins-completion-menu| messages.
        shortmess = vim.o.shortmess..'c',

        -- Show those damn hidden characters
        -- Verbose: listchars='nbsp:¬,eol:¶,extends:»,precedes:«,trail:•'
        listchars='nbsp:¬,extends:»,precedes:«,trail:•'
    }

    for k, v in pairs(options) do
	    if v then vim.o[k] = v end
    end

    local globals = {
	    mapleader = ' ',

    	-- Don't confirm .lvimrc
	    localvimrc_ask = 0,

    	--== Language-specific settings ==--
    	-- JavaScript
    	javaScript_fold = 0,

    	-- Java
    	java_ignore_javadoc = 1,
    	
    	-- Latex
    	latex_indent_enabled = 1,
    	latex_fold_envs = 0,
    	latex_fold_sections = {},

    	-- Rust
    	rustfmt_autosave = 1,
    	rustfmt_emit_files = 1,
    	rustfmt_fail_silently = 0,
    	rust_clip_command = 'xclip -selection clipboard',

    	-- Golang
    	go_play_open_browser = 0,
    	go_fmt_fail_silently = 1,
    	go_fmt_command = 'goimports',
        
        -- Python
        python3_host_prog = "/usr/bin/python3"
    }
    for k, v in pairs(globals) do 
    	if v then vim.g[k] = v end
    end

    --== Neovide settings ==--
    if vim.g.neovide then
        vim.g.default_font_size = 14

        local function update_font(new_size)
            vim.g.font_size = new_size
            vim.defer_fn(function()
                print('Font size: '..vim.g.font_size..'pt')
            end, 400)

            vim.o.guifont = 'Iosevka_Term_Light_Extended:h'..vim.g.font_size
        end

        vim.g.neovide_refresh_rate = 144 -- Butter smooth perfection
        vim.g.neovide_hide_mouse_when_typing = false
        vim.g.neovide_remember_window_size = true

        vim.keymap.set('n', '<C-=>', function() 
            update_font(vim.g.font_size + 1) 
        end, { noremap = true })
        vim.keymap.set('n', '<C-->', function() 
            update_font(vim.g.font_size - 1)
        end, { noremap = true })
        vim.keymap.set('n', '<C-0>', function() 
            update_font(vim.g.default_font_size) 
        end, { noremap = true })

        if not vim.g.font_size then
            update_font(vim.g.default_font_size)
        end
            
    end

    require "keymap"
    require "plugins.autocmd"

    vim.cmd.syntax 'on'
    vim.cmd.hi('Normal', "ctermbg=NONE")

    if packer_bootstrap then
        packer.sync()
    end
end)

