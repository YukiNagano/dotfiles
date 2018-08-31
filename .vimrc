if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  " プラグインリストを収めたTOMLファイル
    let g:dein_dir = expand('~/.vim/dein')
    let s:toml = g:dein_dir . '/dein.toml'
    let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

    " TOMLファイルにpluginを記述
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-endwise') 
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('mattn/emmet-vim')
  call dein#add('scrooloose/nerdtree')
  call dein#end()
  call dein#save_state()
endif


" ここからインストールするプラグイン
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplcache-rsense.vim')

" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1


" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダiがデフォルトと異なるので設定
let g:rsenseHome = expand('~/.rbenv/shims/rsense')
let g:rsenseUseOmniFunc = 1



if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"ESCをjjで実現"
inoremap <silent> jj <ESC>

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn 
"行の強調のon/off"
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap <C-e> :!ruby %
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
set clipboard=unnamed,autoselect

nmap <Esc><Esc> :nohlsearch<CR><Esc>



