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
  Plugin 'tpope/vim-sensible'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'octol/vim-cpp-enhanced-highlight'
  Plugin 'vim-scripts/a.vim'
  Plugin 'vim-scripts/camelcasemotion'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'jlanzarotta/bufexplorer'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'ggreer/the_silver_searcher'
  Plugin 'FelikZ/ctrlp-py-matcher'
  Plugin 'NLKNguyen/papercolor-theme'
  " Provide many default snippets for a variety of snippets.
  " Uncomment and :PluginInstall to enable

  call vundle#end()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
        \ 'https://github.com/VundleVim/Vundle.vim'
endif

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

" == CtrlP ===================================================================

let g:ctrlp_root_markers = ['.ctrlp_root']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_max_files = 30000
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 300
let g:ctrlp_clear_cache_on_exit = 0

" Use ag for CtrlP
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

" == UltiSnips ===============================================================

let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" == YouCompleteMe ===========================================================

nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf = 0

" ----------------------------------------------------------------------------

" CTRL-hjkl to navigate to other panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Highlight as an error if line is over 80.
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec 'match RightMargin /\%>' . &textwidth . 'v.\+/'
  endif
endfunction

augroup filetypedetect
  au WinEnter,BufNewFile,BufRead * call HighlightTooLongLines()
augroup END

syntax on
set number
set cursorline
" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Highlight the search term when you search for it.
set hlsearch
set incsearch
nnoremap <return> :noh<return>

set showcmd

" Split new panes right instead of left
set splitright

" Close current buffer and open up last seen buffer.
nnoremap BD :lclose<bar>b#<bar>bd #<CR>

" When opening files, fold on indentation.
"set foldmethod=indent

set background=dark
colorscheme PaperColor

