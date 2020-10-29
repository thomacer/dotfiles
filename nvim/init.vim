call plug#begin('~/.vim/plugged')
    """ Theming {{{
        Plug 'tomasr/molokai'
        Plug 'ryanoasis/vim-devicons'
        Plug 'myusuf3/numbers.vim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
    """ }}}

    """ Movement Extension {{{
        """ ctrl-d/ctrl-u {{{
            " Plugin makes scrolling nice and smooth when pressing Ctrl-D and Ctrl-U
            Plug 'psliwka/vim-smoothie'
        """ }}}
        """ <v>gcc {{{
            " Super easy commenting, toggle comments etc
            Plug 'tpope/vim-commentary'
        """ }}}
        """ tab {{{
            " This plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
            Plug 'tpope/vim-sleuth'
        """ }}}
        """ ctrl-a/ctrl-x {{{
            Plug 'tpope/vim-speeddating'
            Plug 'Konfekt/vim-CtrlXA'
        """ }}}
        """ alignment {{{
            Plug 'junegunn/vim-easy-align'
        """ }}}
    """ }}}

    """ GIT {{{
        " Git wrapper inside Vim
        Plug 'tpope/vim-fugitive'
        " Vim signs (:h signs) for modified lines based off VCS (e.g. Git)
        Plug 'mhinz/vim-signify'
        " Gist
        Plug 'mattn/webapi-vim'
        Plug 'mattn/vim-gist'
    """ }}}

    """ Session management {{{
        Plug 'tpope/vim-obsession'
        Plug 'dhruvasagar/vim-prosession'
    """ }}}

    """ Language Support {{{
        """ Global {{{
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
            let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python', 'coc-vimlsp', 'coc-clangd', 'coc-vimtex', 'coc-diagnostic']
            """ Snippets {{{
                Plug 'honza/vim-snippets'
            """ }}}
        """ }}}
        """ Typescript && Javascript {{{
            Plug 'leafgarland/typescript-vim'
            Plug 'peitalin/vim-jsx-typescript'
        """ }}}
        """ LaTex {{{
            Plug 'lervag/vimtex'
        """ }}}
        """ C {{{
            " Highlight Language Support
            Plug 'jackguo380/vim-lsp-cxx-highlight'
        """ }}}
    """ }}}

    """ File Navigation {{{
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
    """ }}}
call plug#end()

""" Local leading config, only use for prerequisites as it will be
""" User interface {{{
    """ Syntax highlighting {{{
        filetype plugin indent on                   " detect file plugin+indent
        syntax on                                   " syntax highlighting
        set background=dark                         " we're using a dark bg
        colorscheme molokai                         " colorscheme from plugin
        let g:tex_flavor="latex"
        """ force behavior and filetypes, and by extension highlighting {{{
            augroup FileTypeRules
                autocmd!
                autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
                autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
                autocmd BufNewFile,BufRead *.txt set ft=sh tw=79
            augroup END
        """ }}}
        """ 256 colors for maximum jellybeans bling. See commit log for info {{{
            if (&term =~ "xterm") || (&term =~ "screen")
                set t_Co=256
            endif
        """ }}}
        """ Custom highlighting, where NONE uses terminal background {{{
            function! CustomHighlighting()
                highlight Normal ctermbg=NONE
                highlight NonText ctermbg=NONE
                highlight LineNr ctermbg=NONE
                highlight SignColumn ctermbg=NONE
                highlight SignColumn guibg=#151515
                highlight CursorLine ctermbg=235
            endfunction

            call CustomHighlighting()
        """ }}}
    """ }}}
    """ Interface general {{{
        set cursorline                              " hilight cursor line
        set more                                    " ---more--- like less
        set scrolloff=3                             " lines above/below cursor
        set showcmd                                 " show cmds being typed
        set title                                   " window title
        set vb t_vb=                                " disable beep and flashing
        set wildignore=*.a,*.o,*.so,*.pyc,*.jpg,
                    \*.jpeg,*.png,*.gif,*.pdf,*.git,
                    \*.swp,*.swo                    " tab completion ignores
        set wildmenu                                " better auto complete
        set wildmode=longest,list                   " bash-like auto complete
        set cmdheight=2                             " Give more space for displaying messages.
        set updatetime=300
        set signcolumn=yes
        """ Depending on your setup you may want to enforce UTF-8.
        """ Should generally be set in your environment LOCALE/$LANG {{{
            " set encoding=utf-8                    " default $LANG/latin1
            " set fileencoding=utf-8                " default none
        """ }}}
        """ Gvim {{{
            set guifont=Hack\ Nerd\ \Font\ Mono\ Regular\ 9
            set guioptions-=m                       " remove menubar
            set guioptions-=T                       " remove toolbar
            set guioptions-=r                       " remove right scrollbar
        """ }}}
        """ Airline {{{
            let g:airline_powerline_fonts = 1
        """ }}}
    """ }}}
""" }}}
""" General settings {{{
    set shell=/usr/bin/bash
    set hidden                                      " buffer change, more undo
    set history=1000                                " default 20
    set iskeyword+=_,$,@,%,#                        " not word dividers
    set laststatus=2                                " always show statusline
    set linebreak                                   " don't cut words on wrap
    set listchars=tab:>\                            " > to highlight <tab>
    set list                                        " displaying listchars
    set mouse=                                      " disable mouse
    set noshowmode                                  " hide mode cmd line
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " keep cursor column pos
    set nowrap                                      " don't wrap lines
    set numberwidth=5                               " 99999 lines
    set shortmess+=I                                " disable startup message
    set splitbelow                                  " splits go below w/focus
    set splitright                                  " vsplits go right w/focus
    set ttyfast                                     " for faster redraws etc
    set clipboard+=unnamedplus
    if !has('nvim')
        set ttymouse=xterm2                             " experimental
    endif
    """ Folding {{{
        set foldcolumn=0                            " hide folding column
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
        set foldlevelstart=99                       " folds open by default
    """ }}}
    """ Search and replace {{{
        set gdefault                                " default s//g (global)
        set incsearch                               " "live"-search
    """ }}}
    """ Matching {{{
        set matchtime=2                             " time to blink match {}
        set matchpairs+=<:>                         " for ci< or ci>
        set showmatch                               " tmpjump to match-bracket
    """ }}}
    """ Return to last edit position when opening files {{{
        augroup LastPosition
            autocmd! BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
        augroup END
    """ }}}
""" }}}
""" Files {{{
    set autochdir                                   " always use curr. dir.
    set autoread                                    " refresh if changed
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set nobackup                                    " disable backups
    """ Persistent undo. Requires Vim 7.3 {{{
        if has('persistent_undo') && exists("&undodir")
            set undodir=$HOME/.vim/undo/            " where to store undofiles
            set undofile                            " enable undofile
            set undolevels=500                      " max undos stored
            set undoreload=10000                    " buffer stored undos
        endif
    """ }}}
    """ Swap files, unless vim is invoked using sudo. Inspired by tejr's vimrc
    """ https://github.com/tejr/dotfiles/blob/master/vim/vimrc {{{
        if !strlen($SUDO_USER)
            set directory^=$HOME/.vim/swap//        " default cwd, // full path
            set swapfile                            " enable swap files
            set updatecount=50                      " update swp after 50chars
            """ Don't swap tmp, mount or network dirs {{{
                augroup SwapIgnore
                    autocmd! BufNewFile,BufReadPre /tmp/*,/mnt/*,/media/*
                                \ setlocal noswapfile
                augroup END
            """ }}}
        else
            set noswapfile                          " dont swap sudo'ed files
        endif
    """ }}}
""" }}}
""" Text formatting {{{
    set autoindent                                  " preserve indentation
    set backspace=indent,eol,start                  " smart backspace
    set cinkeys-=0#                                 " don't force # indentation
    set expandtab                                   " no real tabs
    set ignorecase                                  " by default ignore case
    set nrformats+=alpha                            " incr/decr letters C-a/-x
    set shiftround                                  " be clever with tabs
    set shiftwidth=4                                " default 8
    set smartcase                                   " sensitive with uppercase
    set smarttab                                    " tab to 0,4,8 etc.
    set softtabstop=4                               " "tab" feels like <tab>
    set tabstop=4                                   " replace <TAB> w/4 spaces
    """ Only auto-comment newline for block comments {{{
        "augroup AutoBlockComment
        "    autocmd! FileType c,cpp setlocal comments -=:// comments +=f://
        "augroup END
    """ }}}
    """ Take comment leaders into account when joining lines, :h fo-table
    """ http://ftp.vim.org/pub/vim/patches/7.3/7.3.541 {{{
        "if has("patch-7.3.541")
        "    set formatoptions+=j
        "endif
    """ }}}
""" }}}
""" NERDTree Configuration {{{
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeIgnore = []
    let g:NERDTreeStatusline = ''
    " Automaticaly close nvim if NERDTree is only thing left open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
""" }}}
""" Custom Binding {{{
    let mapleader=","
    """ Copy/Paste clipboard {{{
    vmap <leader>xyy :!xclip -f -sel clip<CR>
    map <leader>xpp mz:-1r !xclip -o -sel clip<CR>
    """ }}}
    """ Use alt+hjkl to move between split/vsplit panels {{{
        tnoremap <A-h> <C-\><C-n><C-w>h
        tnoremap <A-j> <C-\><C-n><C-w>j
        tnoremap <A-k> <C-\><C-n><C-w>k
        tnoremap <A-l> <C-\><C-n><C-w>l
        nnoremap <A-h> <C-w>h
        nnoremap <A-j> <C-w>j
        nnoremap <A-k> <C-w>k
        nnoremap <A-l> <C-w>l
    """ }}}
    """ Nerd Tree {{{
        " Toggle
        onoremap <silent> <C-b> :NERDTreeToggle<CR>
    """ }}}
    """ Fuzzy Finder {{{
        nnoremap <C-p> :GFiles<CR>
        nnoremap <C-s> :GFiles?<CR>
        nnoremap <C-t> :BTags<CR>
        " nnoremap <C-p> :FZF<CR>
        let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit'
        \}
        onoremap <silent> <C-a> :Commands<CR>
        onoremap <silent> <C-l> :Commits<CR>
    """ }}}
    """ COC {{{
        " Use tab for trigger completion with characters ahead and navigate.
        " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
        " other plugin before putting this into your config.
        let g:lsp_cxx_hl_use_text_props = 1
        let g:cpp_class_scope_highlight = 1
        let g:cpp_member_variable_highlight = 1
        let g:cpp_class_decl_highlight = 1
        inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
        " position. Coc only does snippet and additional edit on confirm.
        if has('patch8.1.1068')
        " Use `complete_info` if your (Neo)Vim version supports it.
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
        else
        imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        endif

        " Use `[g` and `]g` to navigate diagnostics
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " GoTo code navigation.
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use K to show documentation in preview window.
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
        endfunction

        " Highlight the symbol and its references when holding the cursor.
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Symbol renaming.
        nmap <leader>rn <Plug>(coc-rename)

        " Formatting selected code.
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Applying codeAction to the selected region.
        " Example: `<leader>aap` for current paragraph
        " xmap <leader>a  <Plug>(coc-codeaction-selected)
        " nmap <leader>a  <Plug>(coc-codeaction-selected)
        function! s:cocActionsOpenFromSelected(type) abort
            execute 'CocCommand actions.open ' . a:type
        endfunction
        xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
        nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@


        " Remap keys for applying codeAction to the current line.
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Apply AutoFix to problem on the current line.
        nmap <leader>qf  <Plug>(coc-fix-current)

        " Introduce function text object
        " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
        xmap if <Plug>(coc-funcobj-i)
        xmap af <Plug>(coc-funcobj-a)
        omap if <Plug>(coc-funcobj-i)
        omap af <Plug>(coc-funcobj-a)

        " Use <TAB> for selections ranges.
        " NOTE: Requires 'textDocument/selectionRange' support from the language server.
        " coc-tsserver, coc-python are the examples of servers that support it.
        nmap <silent> <TAB> <Plug>(coc-range-select)
        xmap <silent> <TAB> <Plug>(coc-range-select)

        " Add `:Format` command to format current buffer.
        command! -nargs=0 A :call coc#rpc#notify('runCommand', ['clangd.switchSourceHeader'])

        " Add `:Format` command to format current buffer.
        command! -nargs=0 Format :call CocAction('format')

        " Add `:Fold` command to fold current buffer.
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        " Add `:OR` command for organize imports of the current buffer.
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

        " Add (Neo)Vim's native statusline support.
        " NOTE: Please see `:h coc-status` for integrations with external plugins that
        " provide custom statusline: lightline.vim, vim-airline.
        set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

        " Mappings using CoCList:
        " Show all diagnostics.
        nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
        " Manage extensions.
        nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
        " Show commands.
        nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
        " Find symbol of current document.
        nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
        " Search workspace symbols.
        nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent> <space>j  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
        " Resume latest coc list.
        nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    """ }}}
    """ Language Tool {{{
        "Enable all categories
        " let g:languagetool_enable_categories = 'PUNCTUATION,TYPOGRAPHY,CASING,COLLOCATIONS,CONFUSED_WORDS,CREATIVE_WRITING,GRAMMAR,MISC,MISUSED_TERMS_EU_PUBLICATIONS,NONSTANDARD_PHRASES,PLAIN_ENGLISH,TYPOS,REDUNDANCY,SEMANTICS,TEXT_ANALYSIS,STYLE,GENDER_NEUTRALITY'
        ""Enable all special rules that cannot be enabled via category
        " let g:languagetool_enable_rules = 'AND_ALSO,ARE_ABLE_TO,ARTICLE_MISSING,AS_FAR_AS_X_IS_CONCERNED,BEST_EVER,BLEND_TOGETHER,BRIEF_MOMENT,CAN_NOT,CANT_HELP_BUT,COMMA_WHICH,EG_NO_COMMA,ELLIPSIS,EXACT_SAME,HONEST_TRUTH,HOPEFULLY,IE_NO_COMMA,IN_ORDER_TO,I_VE_A,NEGATE_MEANING,PASSIVE_VOICE,PLAN_ENGLISH,REASON_WHY,SENT_START_NUM,SERIAL_COMMA_OFF,SERIAL_COMMA_ON,SMARTPHONE,THREE_NN,TIRED_INTENSIFIERS,ULESLESS_THAT,WIKIPEDIA,WORLD_AROUND_IT'
        " let g:languagetool_jar='/usr/share/java/languagetool/languagetool-commandline.jar'
        let g:grammarous#enabled_categories = {'*' : ['PUNCTUATION', 'TYPOGRAPHY', 'CASING', 'COLLOCATIONS', 'CONFUSED_WORDS', 'CREATIVE_WRITING', 'GRAMMAR', 'MISC', 'PLAIN_ENGLISH', 'TYPOS', 'REDUNDANCY', 'SEMANTICS', 'TEXT_ANALYSIS', 'STYLE', 'GENDER_NEUTRALITY']}
        let g:grammarous#enabled_rules = {'*' : ['AND_ALSO', 'ARE_ABLE_TO', 'ARTICLE_MISSING', 'AS_FAR_AS_X_IS_CONCERNED', 'BEST_EVER', 'BLEND_TOGETHER', 'BRIEF_MOMENT', 'CAN_NOT', 'CANT_HELP_BUT', 'COMMA_WHICH', 'EG_NO_COMMA', 'ELLIPSIS', 'EXACT_SAME', 'HONEST_TRUTH', 'HOPEFULLY', 'IE_NO_COMMA', 'IN_ORDER_TO', 'I_VE_A', 'NEGATE_MEANING', 'PASSIVE_VOICE', 'PLAN_ENGLISH', 'REASON_WHY', 'SENT_START_NUM', 'SERIAL_COMMA_OFF', 'SERIAL_COMMA_ON', 'SMARTPHONE', 'THREE_NN', 'TIRED_INTENSIFIERS', 'ULESLESS_THAT', 'WIKIPEDIA', 'WORLD_AROUND_IT']}
    """ }}}
    """ Easy align {{{
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    """ }}}
    """ Terminal {{{
        " start terminal in insert mode
        au BufEnter * if &buftype == 'terminal' | :startinsert | endif
        "
        " open terminal on ctrl+;
        " uses zsh instead of bash
        function! OpenTerminal()
            split term://bash
            resize 10
        endfunction
        nnoremap <c-n> :call OpenTerminal()<CR>
    """ }}}
""" }}}