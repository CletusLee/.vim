call pathogen#incubate()
call pathogen#incubate()
call pathogen#helptags()

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" create a new tab with current page
map cp :bufdo tab split<CR>

" save file
noremap <C-U> :update<CR>
vnoremap <C-U> <C-O>:update<CR>
inoremap <C-U> <C-O>:update<CR>

noremap <Leader>j :nohl<CR>
vnoremap <Leader>j :nohl<CR>
inoremap <Leader>j :nohl<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
set wrap
set linebreak
highlight ColorColumn ctermbg=233


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" reload the current file
map <leader>re :edit!<CR>

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" ============================================================================
" Python IDE Setup
" ============================================================================

" Hot key for executing
map <F4> :!python %<CR>

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let g:jedi#autocompletion_command = "<leader>a"
let g:jedi#rename_command = "<leader><leader>r"

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


"  ~/.vim/ftplugin/python_editing.vim
" Python folding
"  mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" NERDTree
"nnoremap <silent> <F6> :NERDTree<CR>
nnoremap <Leader>wn :NERDTree<CR>

" TagBar
nmap <Leader>wt :TagbarToggle<CR>
let g:tagbar_left=1 " move the bar to the left

" Gundo(Revision history)
nnoremap <Leader>wg :GundoToggle<CR>

" yankring
nmap <Leader>y :YRShow<CR> 

" ctrl
nmap <Leader>f :CtrlPCurFile<CR>

" Pytest

" Execute the tests
nmap <silent>tf <Esc>:Pytest file<CR>
nmap <silent>tc <Esc>:Pytest class<CR>
nmap <silent>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent>tn <Esc>:Pytest next<CR>
nmap <silent>tp <Esc>:Pytest previous<CR>
nmap <silent>te <Esc>:Pytest error<CR>

" yankring
nmap <Leader>y :YRShow<CR> 

" Pylint
nmap <Leader>af :PyLintAuto<CR>

" fugitive
nmap ga <Esc>:Gwrite<CR> 
nmap gr <Esc>:Gread<CR> 
nmap gd <Esc>:Gremove<CR> 
nmap gm <Esc>:Gmove<CR> 
nmap gc <Esc>:Gcommit<CR> 
nmap gu <Esc>:Gwrite<CR><Esc>:Gcommit<CR> 
nmap gb <Esc>:Gblame<CR> 
nmap gs <Esc>:Gstatus<CR> 
nmap gf <Esc>:Git flow 
map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>

" this depends on the config of git
nmap <leader>gg <Esc>:Git lg2<CR>

" vim-debug
map <F5> :Dbg into<CR>
map <F6> :Dbg over<CR>
map <F7> :Dbg out<CR>
map <F8> :Dbg run<CR>
map <F9> :Dbg break<CR>
map <F10> :Dbg eval<CR>
map <F11> :Dbg .<CR>
map <F12> :Dbg quit<CR>

let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'
nnoremap go :YcmCompleter GoToDefinitionElseDeclaration<CR>

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
