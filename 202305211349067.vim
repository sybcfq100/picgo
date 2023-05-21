let g:python3_host_porg = expand('/usr/bin/python3.8')
" ==================== Editor behavior ====================

"======================= Basic Mappings ====================
let mapleader=","
" Open the vimrc file anytime
nnoremap <LEADER>ev :vsp $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>sv :source $HOME/.config/nvim/init.vim<CR>
set number
syntax enable
" 支持使用鼠标
set mouse=a
" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
" 按下Tab键后，vim显示的空格数
set tabstop=4
" normal模式下，>>增加一级缩进、<<取消一级缩进、==取消全部缩进时，每一级缩进的空格数
set shiftwidth=4
" 自动将Tab转为空格(防止Tab键在不同编辑器缩进不一致导致问题)
set noexpandtab
" Tab转为多少个空格
set softtabstop=4
" 光标所在行高亮
set cursorline
" 关闭自动折行
set nowrap
" 垂直滚动时，光标距离顶部/底部的距离（单位：行）
set scrolloff=7
" 水平滚动时，光标距离行首或行尾的距离（单位：字符）
set sidescrolloff=30
" 设置行宽，即一行显示多少字符
set textwidth=1000
" 是否显示状态栏：0表示不显示，1表示只在多窗口显示，2表示显示
set laststatus=2
" 光标遇到括号时，自动高亮对应的另一半括号
set showmatch
" 命令行模式下，在底部显示当前键入的指令。例如键入dd删除一行时，键入第一个d，底部右侧显示d，完全键入dd时，操作完成，底部显示消失
set showcmd
" 搜索时，高亮显示搜索结果
set hlsearch
" 搜索时，每输入一个字符，自动跳到第一个匹配的结果
set incsearch
" 搜索时忽略大小写
set ignorecase
" 不创建交换文件
set noswapfile
" 保留 撤销 操作历史
set undofile
" 设置操作历史文件的保存位置
set undodir=~/.vim/.undo//
" vim需要记住多少次历史操作
set history=1000
" Search
noremap <LEADER><CR> :nohlsearch<CR>
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"突出显示当前行"
set cursorline

set autoread
set clipboard+=unnamed
"状态行显示的内容
map <F9> <C-w>w
set nocompatible               "去除VIM一致性，必须"
" F12一键编译运行
map <F12> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!python % '
        " 如果显示时间，将上面一句换为exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

filetype plugin indent on
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>
" Resize lits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
noremap <leader><cr> :nohlsearch<cr>
noremap <leader>sc :vsp $HOME/.config/nvim/coc-settings.json<cr>
" ==================== Tab management ====================

" ==================== Markdown Settings ====================


"===================== PlugIn=================================
call plug#begin()
"主题
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim'
"智能补全
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

"为当前单词添加下划线
Plug 'itchyny/vim-cursorword'

Plug 'Yggdroot/indentLine'
"
Plug 'petertriho/nvim-scrollbar'
" 搜索
Plug 'nvim-telescope/telescope.nvim'

"git操作
Plug 'kdheepak/lazygit.nvim'

Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'
" F8 is TagbarToggle 
Plug 'preservim/tagbar'

Plug 'tpope/vim-surround'

Plug 'luochen1990/rainbow'
" 状态栏设置
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'


Plug 'NvChad/nvim-colorizer.lua'
" 启动文件
Plug 'mhinz/vim-startify'
" trouble.vim
" Plug 'folke/trouble.nvim'
"跳转
Plug 'ggandor/leap.nvim'

"注释工具
Plug 'preservim/nerdcommenter'

" 格式对齐
Plug 'godlygeek/tabular'
" Using Vim-Plug
" -- debug tools //this is a todo thing.
Plug 'https://gitee.com/nvim-plugin/nvim-dap.git'
Plug 'git@github.com:mfussenegger/nvim-dap-python.git'
" Plug 'rcarriga/nvim-dap-ui'
" Plug 'folke/neodev.nvim'
Plug 'git@github.com:theHamsta/nvim-dap-virtual-text.git'
"Plug 'sindrets/diffview.nvim'
"Plug 'folke/trouble.nvim'
"Plug 'rmagatti/goto-preview', { 'for': ['go'] }
"
"
"Plug 'github/copilot.vim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'SmiteshP/nvim-navic'
"Plug 'williamboman/nvim-lsp-installer'
"Plug 'williamboman/mason.nvim'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-emoji'
"Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'octaltree/cmp-look'
"Plug 'lewis6991/gitsigns.nvim'
"Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Treesitter 代码高亮
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'git@github.com:nvim-treesitter/nvim-treesitter-context.git'
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"deoplete 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" undo tree
Plug 'https://gitclone.com/github.com/mbbill/undotree.git'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

"markdown 
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" syntax
" Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'

Plug 'ervandew/supertab'
" format code
Plug 'google/vim-maktaba'
Plug 'git@github.com:google/vim-codefmt.git'
call plug#end()
" ================ configuration setting ==================
" let g:onedark_config = {
"   \ 'style': 'deep',
"   \ 'toggle_style_key': '<leader>ts',
"   \ 'ending_tildes': v:true,
"   \ 'diagnostics': {
"     \ 'darker': v:false,
"     \ 'background': v:false,
"   \ }
"   \}
" colorscheme onedark
"

colorscheme tokyonight-moon

" ================== rainbow ===============
let g:rainbow_active = 1

	let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
\}

" ==================== nvim-treesitter ====================
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {"typescript", "python", "java", "bash", "go"},
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
	query_linter = {
	enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },	
}
EOF
" =============== nvim-treesitter playground configuration =================
lua <<EOF
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
EOF

" =============== treesitter context ======================
lua <<EOF
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
            'interface',
            'struct',
            'enum',
        },
        -- Patterns for specific filetypes
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        haskell = {
            'adt'
        },
        rust = {
            'impl_item',

        },
        terraform = {
            'block',
            'object_elem',
            'attribute',
        },
        scala = {
            'object_definition',
        },
        vhdl = {
            'process_statement',
            'architecture_body',
            'entity_declaration',
        },
        markdown = {
            'section',
        },
        elixir = {
            'anonymous_function',
            'arguments',
            'block',
            'do_block',
            'list',
            'map',
            'tuple',
            'quoted_content',
        },
        json = {
            'pair',
        },
        typescript = {
            'export_statement',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
}
EOF


" custom highlight group(buildin & Treesitter)
hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

hi TSKeyword ctermfg=167 gui=italic guifg=#ea6962
hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
hi TreesitterContext ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836
hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
hi FloatBorder  ctermfg=142 guifg=#a9b665 guibg=#1E2021
" hi InclineNormal ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
hi lualine_c_inactive ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
" hi FocusedSymbol cterm=italic ctermfg=4 ctermbg=11 gui=bold,italic guifg=#181A1A guibg=#77814C
" hi ErrorText cterm=undercurl ctermbg=52 gui=italic guibg=#442e2d guisp=#ea6962

" ==================== coc.nvim ====================
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-flutter-tools',
            \ 'coc-gitignore',
            \ 'coc-html',
            \ 'coc-import-cost',
            \ 'coc-jest',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-omnisharp',
            \ 'coc-prettier',
            \ 'coc-prisma',
            \ 'coc-pyright',
            \ 'coc-snippets',
            \ 'coc-sourcekit',
            \ 'coc-stylelint',
            \ 'coc-tasks',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-yaml',
            \ 'coc-yank']
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
    call CocActionAsync('highlight')
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>tt :CocCommand explorer<CR>
" coc-translator
nmap <leader>t <Plug>(coc-translator-p)
vmap <leader>t <Plug>(coc-translator-p)
nmap <leader>e <Plug>(coc-translator-e)
vmap <leader>e <Plug>(coc-translator-ev)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" ========== treesitter context setting ================
hi TreesitterContext ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836


" 使用Telescope命令进行查找.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ==================== Undotree ====================
noremap <F3> :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
    nmap <buffer> u <plug>UndotreeNextState
    nmap <buffer> e <plug>UndotreePreviousState
    nmap <buffer> U 5<plug>UndotreeNextState
    nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0,
            \ 'toc': {}
            \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle


" ==================== lazygit.nvim ====================
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" =============== tagbar ===================
noremap <F8> :TagbarToggle<CR>
let g:tagbar_show_tag_count = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_wrap = 1
let g:tagbar_zoomwidth = 0
let g:tagbar_show_linenumbers = 0
let g:tagbar_autofocus = 0
let g:tagbar_sort = 0
let g:tagbar_map_togglesort = "r"
let g:tagbar_help_visibility = 0
let g:tagbar_show_data_type = 1
let g:tagbar_autopreview = 0

let g:tagbar_type_markdown = {
            \ 'ctagsbin'  : 'mdctags',
            \ 'ctagsargs' : '',
            \ 'kinds'     : [
            \     'a:h1:0:0',
            \     'b:h2:0:0',
            \     'c:h3:0:0',
            \     'd:h4:0:0',
            \     'e:h5:0:0',
            \     'f:h6:0:0',
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \     'a' : 'h1',
            \     'b' : 'h2',
            \     'c' : 'h3',
            \     'd' : 'h4',
            \     'e' : 'h5',
            \     'f' : 'h6',
            \ },
            \ 'scope2kind' : {
            \     'h1' : 'a',
            \     'h2' : 'b',
            \     'h3' : 'c',
            \     'h4' : 'd',
            \     'h5' : 'e',
            \     'h6' : 'f',
            \}
            \}

lua require('leap').add_default_mappings()

lua << END
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                    },
                    tabline = {},
                    winbar = {},
                    inactive_winbar = {},
                    extensions = {}
}
END

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" =============== indentline =================
let g:indentLine_setColors = 1
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:markdown_syntax_conceal=0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

let g:deoplete#enable_at_startup = 1


" ==================== nvim-colorizer.lua ====================

lua <<EOF
require("colorizer").setup {
	filetypes = { "*" },
	user_default_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = true, -- "Name" codes like Blue or blue
		RRGGBBAA = false, -- #RRGGBBAA hex codes
		AARRGGBB = true, -- 0xAARRGGBB hex codes
		rgb_fn = false, -- CSS rgb() and rgba() functions
		hsl_fn = false, -- CSS hsl() and hsla() functions
		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Available modes for `mode`: foreground, background,  virtualtext
		mode = "virtualtext", -- Set the display mode.
		-- Available methods are false / true / "normal" / "lsp" / "both"
		-- True is same as normal
		tailwind = false, -- Enable tailwind colors
		-- parsers can contain values used in |user_default_options|
		sass = { enable = false, parsers = { css }, }, -- Enable sass colors
		virtualtext = "■",
	},
	-- all the sub-options of filetypes apply to buftypes
	buftypes = {},
}
EOF

" ===================== ale setting =============

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
augroup YourGroup
    autocmd!
    autocmd User ALELint call YourFunction()
augroup END

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" syntastic end                                           
let g:SuperTabDefaultCompletionType = "<c-n>"


" ============== tabnine ==============
let g:tabnine_no_tab_map = v:true
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()

" ======== nvim-scrollbar =============
lua <<EOF
local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    }
})
EOF



"================== dap setting ================
lua <<EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/home/sybcfq/.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
EOF

"
" lua <<EOF
" local dap = require('dap')
" dap.configurations.python = {
"   {
"     -- The first three options are required by nvim-dap
"     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
"     request = 'launch';
"     name = "Launch file";
"
"     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
"
"     program = "${file}"; -- This configuration will launch the current file if used.
"     pythonPath = function()
"       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
"       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
"       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
"       local cwd = vim.fn.getcwd()
"       if vim.fn.executable(cwd .. '/home/sybcfq/.virtualenvs/venv/bin/python') == 1 then
"         return cwd .. '/venv/bin/python'
"       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
"         return cwd .. '/.venv/bin/python'
"       else
"         return '/usr/bin/python'
"       end
"     end;
"   },
" }
" EOF

"================= dap python settings ====================
lua <<EOF
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${file}',
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
}
)
	vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
	vim.keymap.set('n', '<F2>', function() require('dap').step_over() end)
	vim.keymap.set('n', '<F4>', function() require('dap').step_into() end)
	vim.keymap.set('n', '<F6>', function() require('dap').step_out() end)
	vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
	vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
	vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
	vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
	vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
	vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
	  require('dap.ui.widgets').hover()
	end)
	vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
	  require('dap.ui.widgets').preview()
	end)
	vim.keymap.set('n', '<Leader>df', function()
	  local widgets = require('dap.ui.widgets')
	  widgets.centered_float(widgets.frames)
	end)
	vim.keymap.set('n', '<Leader>ds', function()
	  local widgets = require('dap.ui.widgets')
	  widgets.centered_float(widgets.scopes)
	end)
EOF

nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>


"====================== dap ui =================

" lua <<EOF
" local dap_breakpoint_color = {
"     breakpoint = {
"         ctermbg=0,
"         fg='#993939',
"         bg='#31353f',
"     },
"     logpoing = {
"         ctermbg=0,
"         fg='#61afef',
"         bg='#31353f',
"     },
"     stopped = {
"         ctermbg=0,
"         fg='#98c379',
"         bg='#31353f'
"     },
" }
"
" vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
" vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
" vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)
"
" local dap_breakpoint = {
"     error = {
"         text = "",
"         texthl = "DapBreakpoint",
"         linehl = "DapBreakpoint",
"         numhl = "DapBreakpoint",
"     },
"     condition = {
"         text = 'ﳁ',
"         texthl = 'DapBreakpoint',
"         linehl = 'DapBreakpoint',
"         numhl = 'DapBreakpoint',
"     },
"     rejected = {
"         text = "",
"         texthl = "DapBreakpint",
"         linehl = "DapBreakpoint",
"         numhl = "DapBreakpoint",
"     },
"     logpoint = {
"         text = '',
"         texthl = 'DapLogPoint',
"         linehl = 'DapLogPoint',
"         numhl = 'DapLogPoint',
"     },
"     stopped = {
"         text = '',
"         texthl = 'DapStopped',
"         linehl = 'DapStopped',
"         numhl = 'DapStopped',
"     },
" }
"
" vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
" vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
" vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
" vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
" vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
"
"
" require("neodev").setup({
"   library = { plugins = { "nvim-dap-ui" }, types = true },
"   ...
" })
" local dapui = require("dapui")
" dapui.setup({})
"
" local dap = require("dap")
" dap.listeners.after.event_initialized["dapui_config"] = function()
"     dapui.open({})
" end
"
" dap.listeners.before.event_terminated["dapui_config"] = function()
"     dapui.close({})
" end
"
"
" dap.listeners.before.event_exited["dapui_config"] = function()
"     dapui.close({})
" end
"
" EOF
"

"==================== dap text setting =====================

lua <<EOF
require("nvim-dap-virtual-text").setup({
    enabled = true,
    enable_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    filter_references_pattern = '<module',
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
})
EOF

augroup autoformat_settings
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType vue,javascript,html,css,sass,scss,less,json AutoFormatBuffer prettier
augroup END
noremap <leader>fm :FormatCode<CR>

