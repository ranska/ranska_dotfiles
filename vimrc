set nocompatible               " be iMproved
filetype off                   " required!

let g:tinykeymap#map#tabs#map = "gé"
let g:tinykeymap#map#windows#map = "gé"

" leader vlm vb vtm sm
"
" vlm  map
" vb   
" vtm
" sm   snippet
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
if filereadable(expand("~/.vimrc.tabmode"))
  source ~/.vimrc.tabmode
endif

"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"map <C-n> :NERDTreeToggle<CR>
syntax enable
filetype plugin indent on

let g:taboo_tab_format = '%m[%N]%f '

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Leader ---------------------- {{{
let mapleader = " "
" }}}

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    "
" http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

"if filereadable(expand("~/.vim/vundles"))
"  source ~/.vim/vundles
"endif

filetype plugin indent on

augroup vimrcEx
  autocmd!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor
  " position.
  " Don't do it for commit messages, when the position is
  " invalid, or when
  " inside an event handler (happens when dropping a file on
  " gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  " Enable spellchecking for Markdown
  "autocmd BufRead,BufNewFile *.md setlocal spell
  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set nolist listchars=tab:»·,trail:·

" Use The Silver Searcher
"    https://github.com/ggreer/the_silver_searcher
"     if executable('ag')
" Use Ag over Grep
"  et grepprg=ag\ --nogroup\ --nocolor
"
    " Use ag in CtrlP for listing files. Lightning
"   fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag %s -l
"     --nocolor -g ""'
"endif

" Numbers
set number
set numberwidth=5
"  old crap {{{
" " Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"
"
" " Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
" set wildmode=list:longest,list:full
" set complete=.,w,t
" function! InsertTabWrapper()
"     let col = col('.') - 1
"         if !col || getline('.')[col - 1] !~ '\k'
"                 return "\<tab>"
"                     else
"                             return "\<c-p>"
"                                 endif
"                                 endfunction
"                                 inoremap <Tab>
"                                 <c-r>=InsertTabWrapper()<cr>
"
"                                 " Exclude Javascript files in :Rtags via
"                                 rails.vim due to warnings when parsing
"                                 let g:Tlist_Ctags_Cmd="ctags
"                                 --exclude='*.js'"
"
"                                 " Index ctags from any project, including
"                                 those outside Rails
"                                 map <Leader>ct :!ctags -R .<CR>
"
"                                 " Switch between the last two files
"                                 nnoremap <leader><leader> <c-^>
"
"                                 " Get off my lawn
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>
"
"                                 " Quicker window movement
"                                 nnoremap <C-j> <C-w>j
"                                 nnoremap <C-k> <C-w>k
"                                 nnoremap <C-h> <C-w>h
"                                 nnoremap <C-l> <C-w>l
"
"                                 " Local config
"                                 if filereadable($HOME . "/.vimrc.local")
"                                   source ~/.vimrc.local
"                                   endif
" }}}

augroup more_ruby_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.jbuilder set filetype=Ruby
  autocmd BufRead,BufNewFile *.arb set filetype=Ruby
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  " TODO didn't work
  autocmd BufNewFile,BufRead *.coffee.erb set filetype=coffee
augroup END
set t_Co=256
colorscheme jellybeans 
set ts=2 sw=2 et
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=235
augroup filetype_IndentGuidesEnable
  autocmd!
  autocmd  FileType * IndentGuidesEnable
augroup END
set mouse=nicr
"comand visual range
command! -range Vis call setpos('.', [0,<line1>,0,0]) |
                    \ exe "normal V" |
                    \ call setpos('.', [0,<line2>,0,0])

"
" coffeescript hack extract methods
"
" visual block
" mettre le visual block dans un register
" ecrire un @toto_tag à la place
" ce dépalcer au dessu de la 1er -> ou => trouvé
" écrire un toto_tag: ->
" collé le contenu du registre
" ouvrir la commande pour remplacer toto_tag par le text de son choix


augroup rc_color_scheme
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=None
  autocmd ColorScheme * highlight NonText ctermbg=None
augroup END

hi Normal ctermbg=none

let g:airline_theme='wombat'
"let g:airline_theme='badwolf'

syntax enable
filetype plugin indent on


" Mouse section
set ttyfast
set mouse=a
"xterm2 is good for iterm2 mac
set ttymouse=xterm2

set backspace=2
set foldlevelstart=1

"autocmd BufWinEnter * normal! zR
set foldlevelstart=1

"adtocmd FileType coffee onoremap <buffer> p V:<c-u>call coffee_tools#FunctionTextObject('a')<cr>
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'

let g:languagetool_jar = '/Users/ranska/softwares/LanguageTool-2.8/languagetool-commandline.jar'


let g:meow=1

function! Meow()
  if g:meow ==1
    "set meow!

  colorscheme jellybeans
  autocmd ColorScheme * highlight Normal ctermbg=None
  autocmd ColorScheme * highlight NonText ctermbg=None
  else
  autocmd ColorScheme * highlight Normal ctermbg=White
  autocmd ColorScheme * highlight NonText ctermbg=White
colorscheme github

  endif
  let g:meow = g:meow * -1
endfunction

"TODO clipboard to register
"set clipboard=unnamed           " clipboard system"

"silent exe "g:flog_enable"
"remove trailing whitespaces
autocmd BufWritePre *.rb :%s/\s\+$//e

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()


if filereadable(expand("~/.vimrc.leader_map"))
  source ~/.vimrc.leader_map
endif

highlight Pmenu ctermbg=236 ctermfg=145





