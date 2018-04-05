" Enable modern Vim features not compatible with Vi spec.
set nocompatible

"======================"
" Vundle configuration "
"======================"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  " Required
  Plugin 'gmarik/vundle'
  " Install plugins that come from github.  Once Vundle is installed, these can be
  " installed with :PluginInstall
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'tpope/vim-sensible'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'rafi/awesome-vim-colorschemes'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-scripts/a.vim'
  Plugin 'vim-scripts/camelcasemotion'
  Plugin 'ggreer/the_silver_searcher'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'FelikZ/ctrlp-py-matcher'
  Plugin 'mhinz/vim-signify'
  Plugin 'prabirshrestha/vim-lsp'
  Plugin 'prabirshrestha/async.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'jlanzarotta/bufexplorer'
  "Plugin 'scrooloose/syntastic'
  "Plugin 'SirVer/ultisnips'
  "Plugin 'honza/vim-snippets'
  " Provide many default snippets for a variety of snippets.
  " Uncomment and :PluginInstall to enable
  " Plugin 'honza/vim-snippets'

  call vundle#end()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
        \ 'https://github.com/VundleVim/Vundle.vim'
endif

" Language Server or ctags?
"nnoremap gd :<C-u>LspDefinition<CR>

" All of your plugins must be added before the following line.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on

" Airline options
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Show buffer numbers
let g:airline#extensions#tabline#buffer_nr_show = 1

" NERDTree options
" ctrl+n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>

" Speeding up CtrlP
let g:ctrlp_root_markers = ['.ctrlp_root']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 30000
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_switch_buffer = 2

" Use AG for CtrlP
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ --ignore .git5_specs
        \ --ignore review
        \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Signify
let g:signify_vcs_list = ['hg']
let g:signify_realtime = 1

function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec 'match RightMargin /\%>' . &textwidth . 'v.\+/'
  endif
endfunction

augroup filetypedetect
  au WinEnter,BufNewFile,BufRead * call HighlightTooLongLines()
augroup END


"===================="
"" Some basic options "
"===================="

" Enable syntax highlighting
syntax on
" Show line numbers
set number
" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Highlight the search term when you search for it.
set hlsearch
nnoremap <return> :noh<return>

set showcmd

set background=dark
colorscheme PaperColor

" Split new panes right instead of left
set splitright

" CTRL-hjkl to navigate to other panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Cursorline
set cursorline

" Close buffer but don't close pane.
nnoremap BD :lclose<bar>b#<bar>bd #<CR>

" Don't have cursorlines on unfocused panes
au BufEnter * setlocal cursorline
au BufLeave * setlocal nocursorline
au WinLeave * setlocal nocursorline

