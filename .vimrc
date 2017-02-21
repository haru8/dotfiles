set encoding=utf-8
scriptencoding utf-8

"" " 文字コードの自動認識
" if &encoding !=# 'utf-8'
"   set encoding=japan
"   set fileencoding=japan
" endif
" if has('iconv')
"   let s:enc_euc = 'euc-jp'
"   let s:enc_jis = 'iso-2022-jp'
"   " iconvがeucJP-msに対応しているかをチェック
"   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"     let s:enc_euc = 'eucjp-ms'
"     let s:enc_jis = 'iso-2022-jp-3'
"   " iconvがJISX0213に対応しているかをチェック
"   elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"     let s:enc_euc = 'euc-jisx0213'
"     let s:enc_jis = 'iso-2022-jp-3'
"   endif
"   " fileencodingsを構築
"   if &encoding ==# 'utf-8'
"     let s:fileencodings_default = &fileencodings
"     let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"     let &fileencodings = &fileencodings .','. s:fileencodings_default
"     unlet s:fileencodings_default
"   else
"     let &fileencodings = &fileencodings .','. s:enc_jis
"     set fileencodings+=utf-8,ucs-2le,ucs-2
"     if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"       set fileencodings+=cp932
"       set fileencodings-=euc-jp
"       set fileencodings-=euc-jisx0213
"       set fileencodings-=eucjp-ms
"       let &encoding = s:enc_euc
"       let &fileencoding = s:enc_euc
"     else
"       let &fileencodings = &fileencodings .','. s:enc_euc
"     endif
"   endif
"   " 定数を処分
"   unlet s:enc_euc
"   unlet s:enc_jis
" endif
" " 日本語を含まない場合は fileencoding に encoding を使うようにする
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"       let &fileencoding=&encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif

"if filereadable(expand('~/.vim/plugin/encode.vim'))
"  source ~/.vim/plugin/encode.vim
"endif
if filereadable(expand('~/.vim/plugin/debugger.vim'))
  source ~/.vim/plugin/debugger.vim
endif

 " 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
"if exists('&ambiwidth')
"  set ambiwidth=double
"endif

"set nocompatible                           "コンパチブルモードをオフ
"set encoding=utf-8

"set langmenu=japanese
"set fileencodings=iso-2022-jp,sjis,euc-jp  "ファイル文字コード
"set fileencodings=euc-jp,sjis,iso-2022-jp  "ファイル文字コード
"set nu                                     "行番号表示

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決


set autoindent                              " オートインデント
set smartindent                             " スマートインデント
set paste                                   " 貼り付け
"set cindent
"set smarttab                               " スマートタブ
set showmatch                               " 閉じ括弧が入力時、対応する括弧を表示
set smartcase                               " 検索時に大文字を含んでいたら大/小を区別
set showmode                                " モードを表示
set nowrapscan                              " 検索をファイルの先頭へループしない

set expandtab                               " タブの代わりに空白文字を挿入
"set noexpandtab                                "
set shiftwidth=4                            " シフト移動幅
set softtabstop=4                           "
set tabstop=4                               " タブ幅

" 単語
"set iskeyword=!-~,^*,^45,^124,^34,192-255,^_
set iskeyword+=$,.

set laststatus=1                           " ステータスラインを表示

" ステータスラインに文字コード、モードを表示
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l/%L,%c%V%8P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" ステータスラインの色
"highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

" 入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine ctermfg=lightblue guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine ctermfg=4 guifg=#2E4340 guibg=#ccdc90
"augroup END

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=DarkMagenta guibg=white
match ZenkakuSpace /　/

" TAB、改行 を視覚化
"highlight Tab cterm=underline ctermfg=7 guibg=white
"match Tab /    /
highlight SpecialKey ctermfg=7 guibg=#222222
"set listchars=tab:>-
"set listchars=tab:^\
set nolist
"set listchars=tab:^\ ,eol:<
set lcs=tab:>.,eol:$,trail:_,extends:\

"set foldmethod=marker                      "マーカー文字列で折り畳む
"let c:c_syntax_folding = 1
set foldmethod=syntax                      "マーカー文字列で折り畳む

"閉じ括弧を自動入力
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap ` ``<LEFT>
"vnoremap { "zdi{<C-R>z}<ESC>
"vnoremap [ "zdi[<C-R>z]<ESC>
"vnoremap ( "zdi(<C-R>z)<ESC>
"vnoremap " "zdi"<C-R>z"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC
"vnoremap ` "zdi'<C-R>z'<ESC>

"%ペア設定
set matchpairs=(:),{:},[:],<:>
set noshowmatch


" カーソル位置の単語をヤンクした単語に置換
"nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
"nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
"vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>


highlight MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black
let loaded_matchparen = 1

" ESCキー連打でさりげなく色を消す
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"辞書ファイル
autocmd FileType php  :set dictionary=~/.vim/dict/php.dict


"tagファイル
if has('path_extra')
    set tags+=tags;
endif

"カラースキーマ
":colorscheme peachpuff

" 行末の空白を削除する
"autocmd BufWritePre * :%s/\s\+$//ge
function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    " 保存時にtabをスペースに変換する
    " %s/\t/  /ge
    %retab!
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" 永続的Undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif


" ---- memo -----
" 内部grep
":vimgrep /function/ % | cw
" ---- memo -----

"vim: ts=4:sw=4

