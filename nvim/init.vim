call plug#begin('~/.local/share/nvim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-rooter'
Plug 'amadeus/vim-mjml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'glanotte/vim-jasmine'
Plug 'hail2u/vim-css3-syntax'
Plug 'honza/vim-snippets'
Plug 'jremmen/vim-ripgrep'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'neomake/neomake'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'stulzer/colorschemes'
Plug 'stulzer/vim-vroom/'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Enter-Indent'

call plug#end()

set nocompatible

syntax on

" Auto detect filetype
filetype plugin indent on

" Display current mode
set showmode

" Intuitive basckspace
set backspace=indent,eol,start

" Handle multiple buffer better
set hidden

" Enhanced command line commands
set wildmenu
set wildmode=list:longest

" Ignore certain directories
set wildignore+=public/uploads
set wildignore+=.sass-cache
set wildignore+=node_modules
set wildignore+=temp
set wildignore+=public/spree
set wildignore+=tmp
set wildignore+=bower
set wildignore+=bower_components
set wildignore+=dist
set wildignore+=src/main/webapp/static
set wildignore+=src/main/webapp/v/static
set wildignore+=build
set wildignore+=.keep
set wildignore+=.rspec
set wildignore+=spec/cassettes/
set wildignore+=*/tmp/*,*.so,**/*.swp

" Ignore case when search
set ignorecase
" If expression has capital letter the case is relevant
set smartcase

" Remaping the <Leader> key.
let mapleader = " "

" Show line numbers
set number

" Highlight match as you type
set incsearch
set hlsearch

" Turn on line wrapping.
set wrap

" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

" No more annoying beeps
set visualbell

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Keep swap files in one location
set directory=$HOME/.vim/tmp//,.

" Default tab width
set tabstop=2
set shiftwidth=2

" Use spaces instead of tabs
set expandtab
set pastetoggle=<F12>

" colorscheme Tomorrow
colorscheme heroku-terminal
set background=dark

" Mapping for tab manipulation
map <leader>tt :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tm :tabmove

nnoremap <leader>w :w<cr>
nnoremap <leader>a :wa<cr>

vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" vim-vroom configuration
let g:vroom_use_terminal = 1
let g:vroom_command_prefix="docker-compose run web"
map <leader>s :VroomRunNearestTest<cr>
map <leader>S :VroomRunTestFile<cr>

" Trigger to run the whole RSpec suite
function ClearScreenAndRunRSpec()
  :silent !clear
  if filereadable("Dockerfile")
    :sp<cr>
    :terminal docker-compose run web bundle exec rspec && docker-compose run web bundle exec rubocop
  elseif filereadable("bin/rspec")
    :sp<cr>
    :terminal ./bin/rspec && bundle exec rubocop && bundle exec rails_best_practices
  elseif filereadable("Gemfile") && filereadable("package.json")
    :sp<cr>
    :terminal bundle exec rspec && bundle exec rubocop && bundle exec rails_best_practices
  elseif filereadable("package.json")
    :sp<cr>
    :terminal npm run test
  else
    :sp<cr>
    :terminal bundle exec rspec && bundle exec rubocop && bundle exec rails_best_practices
  end
endfunction
map <leader>R :call ClearScreenAndRunRSpec()<cr>

" For the MakeGreen plugin and Ruby RSpec
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,ftl set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

au BufRead,BufNewFile *.ejs set filetype=html
autocmd! BufRead,BufNewFile *.sass set filetype=sass

" Set line break
set linebreak

" Don't show invisibles
set nolist

" Invisibles for tab and end of line
set listchars=tab:▸\ ,eol:¬,trail:·

" Blank chars colors
highlight NonText guifg=#143c46
highlight SpecialKey guifg=#143c46

" spell checker, Portuguese and English as default language
set spelllang=en_us,pt,de
set spell

" fast nohighligth
map <leader>q :noh<cr>
" Mapping to show or hide invisibles
map <leader>l :set list!<cr>
" Execute the current file in nodejs
map <leader>nd :!node %<cr>
" Mapping for quick js/less/scss folding
nmap <leader>f vi{zf
" Execute rubocop
map <leader>u :sp<cr>:terminal docker-compose run web bundle exec rubocop<cr>
map <leader>U :sp<cr>:terminal docker-compose run web bundle exec rubocop -a<cr>
" Execute grunt test
nmap <leader>g :!clear && npm test<cr>

" Function to align key value fat arrows in ruby, and equals in js, stolen
" from @tenderlove vimrc file.
command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <leader>a :Align<cr>
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction

if has('cmdline_info')
  set ruler                   " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2
endif

" Nice way to corret typos saving, editing and deleting buffers
if has("user_commands")
  command! -bang -nargs=* -complete=file E e<bang> <args>
  command! -bang -nargs=* -complete=file W w<bang> <args>
  command! -bang -nargs=* -complete=file Wq wq<bang> <args>
  command! -bang -nargs=* -complete=file WQ wq<bang> <args>
  command! -bang -nargs=* -complete=file Bd bd<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
  command! -bang Bd bd<bang>
endif

" Removed the slow rake routes function from bash
function! ShowRoutes()
  :topleft 100 :split __Routes__
  :set buftype=nofile
  :normal 1GdG
  :0r! docker-compose run web rake -s routes
  :exec ":normal " . line("$") . "^W_ "
  :normal 1GG
  :normal dd
  :normal gg
  :normal /Prefix
  :normal k
  :normal dgg
endfunction
map <leader>cR :call ShowRoutes()<cr>

" CtrlP mapings
map <leader>cv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>ct :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>cm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>cp :CtrlPClearCache<cr>\|:CtrlP app/presenters<cr>
map <leader>cs :CtrlPClearCache<cr>\|:CtrlP spec<cr>
map <leader>cl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>cc :sp config/application.yml<cr>
map <leader>cr :topleft 100 :split config/routes.rb<cr>
map <leader>cg :topleft 100 :split Gemfile<cr>

" Alternate between last opened buffer
nnoremap <leader><leader> <c-^>

" Makes ctrlp FASTER THAN HELL
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

" End of line and First non-blank chracter of the line
vnoremap H ^
vnoremap L $
nnoremap H ^
nnoremap L $

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Automaticaly create a directory in the current file
map <leader>md :silent !mkdir -p %%<cr> :redraw! <cr>

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>

augroup vimrcEx
  " Clear all autocmd in the group
  autocmd!

  " open vim in the last position of the file that you were editing
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" searching commands
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <C-n> :NERDTree <cr>

" delimitMate configuration
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = ""

" Easy way to add and subtract numbers
nnoremap + <C-a>
nnoremap - <C-X>
nnoremap _ <C-X>

" Show syntax highlighting groups for word under cursor
nmap <C-S-X> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set viminfo='50,<10000,s1000,:1
" '50 Marks will be remembered for the last 50 files you edited.
" <10000 Contents of registers (up to 10000 lines each) will be
" remembered.
" s1000 Registers with more than 1 Mb text are skipped.
" :1 Actives command-line history

" Stores up to 2000 commands types on command-line mode
set history=2000


function! InlineVariable()
  " Copy the variable under the cursor into the 'a' register
  :let l:tmp_a = @a
  :normal "ayiw
  " Delete variable and equals sign
  :normal 2daW
  " Delete the expression into the 'b' register
  :let l:tmp_b = @b
  :normal "bd$
  " Delete the remnants of the line
  :normal dd
  " Go to the end of the previous line so we can start our search for the
  " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
  " work; I'm not sure why.
  normal k$
  " Find the next occurence of the variable
  exec '/\<' . @a . '\>'
  " Replace that occurence with the text we yanked
  exec ':.s/\<' . @a . '\>/' . escape(@b, "/")
  :let @a = l:tmp_a
  :let @b = l:tmp_b
endfunction
nnoremap <leader>i :call InlineVariable()<cr>

" Show whitespaces as dots and End of Line as ¬
" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

" nvim air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" beautify JSON
function! JSONify()
  %!python -m json.tool
endfunction

nnoremap <leader>j :call JSONify()<cr>

" Disable mouse click to go to position
set mouse-=a

" deoplete config
let g:deoplete#enable_at_startup = 1
" disable autocomplete
let g:deoplete#disable_auto_complete = 1
if has("gui_running")
    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
else
    inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
endif

" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" mjml as haml
autocmd BufNewFile,BufReadPost *.mjml set filetype=haml

" Remaps escape for terminal mode
tnoremap <esc> <c-\><c-n>
