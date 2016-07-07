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
set numberwidth=4
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

augroup more_ruby_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.jbuilder set filetype=Ruby
  autocmd BufRead,BufNewFile *.arb set filetype=Ruby
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead Gemfile.develop set filetype=ruby
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
let g:airline_section_z = airline#section#create(['hunks'])
"let g:airline_section_y = airline#section#create(['branch'])

let g:airline#extensions#hunks#enabled = 1

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
autocmd BufWritePre *.slim :%s/\s\+$//e

"clean too mutch blank line and insert blank line beetween def
autocmd BufWritePre *.rb :%s/end\_s  def/end\r\r  def/e
autocmd BufWritePre *.rb :%s/\n\{3,}/\r\r/e



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
highlight Visual cterm=NONE ctermbg=0


silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('seedling')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
  set completefunc=emoji#complete
endif
"augroup emoji_complete
"  autocmd!
"  autocmd FileType markdown setlocal completefunc=emoji#complete
"augroup END

" supprime le | dans la bar de vertical split
set fillchars+=vert:.
hi VertSplit ctermbg=236 ctermfg=236
hi VertSplit ctermbg=none ctermfg=237
" change la couleur des ~ des lignes vides
hi NonText ctermfg=237


" Fugitive color
" http://i.stack.imgur.com/U5AJI.png
"
hi! DiffAdd      ctermbg=22
hi! DiffChange   ctermbg=235
" zone grise
hi! DiffDelete   ctermfg=237 ctermbg=none
" info zone NOTE bug fg and bg are reversed
hi! DiffText     ctermfg=233  ctermbg=136

" EasyGrep config
let g:EasyGrepRoot = "search:app,spec,db,features,config,lib,bin"


" calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:indent_guides_exclude_filetypes = ['calendar']

"rubyblock
runtime macros/matchit.vim
"set tags=.git/tags,tags
set tags=./tags,tags,/Users/ranska/commontags

set tags+=.git/tags
set tags+=tags
"let g:vim_tags_directories = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
let g:vim_tags_directories = ["."]
let g:vim_tags_main_file = 'tags'


let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

"echom "('.') fait le ou ne le fait pas mais il n'y pas d'essais"
