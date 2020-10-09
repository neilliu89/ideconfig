set number
let mapleader = ' '

call plug#begin('~/.vim/plugged')
" https://vimawesome.com/plugin/nerdtree-red
" github: https://github.com/preservim/nerdtree
" Plug ‘scrooloose/nerdtree’ is the same
Plug 'scrooloose/nerdtree'
" autocmd vimenter * NERDTree

" coc.nvim
" https://vimawesome.com/plugin/coc-nvim
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ---golang---
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
"

" ================================vim-go.vim========================================
" vim-go
" https://vimawesome.com/plugin/vim-go-sparks-fly
" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" autowrite
set autowrite
" shortcut for find error
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" shortcut for go run, go build, go test
" autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" only show quickfix，don‘t show locallist
let g:go_list_type = "quickfix"
" set go test timeout 
let g:go_test_timeout = '10s'

" shortcut go test and go build
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" auto fmt, import package on save file
let g:go_fmt_command = "goimports"

" highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" tab 4space，but not Exchange the tab by 4 space
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" :GoMetaLinter
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

":GoAlternate
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" 默认使用guru,如果慢可以使用godef,暂时不用
"let g:go_def_mode = 'godef'

" :GoDecls默认显示func和type，可以修改为只显示func
" let g:go_decls_includes = "func,type"

" :GoInfo
autocmd FileType go nmap <Leader>i <Plug>(go-info)
" auto show info
let g:go_auto_type_info = 1
set updatetime=100

" auto highlight identifier
let g:go_auto_sameids = 1

let s:packages = [
      \ "github.com/nsf/gocode",
      \ "github.com/alecthomas/gometalinter",
      \ "golang.org/x/tools/cmd/goimports",
      \ "golang.org/x/tools/cmd/guru",
      \ "golang.org/x/tools/cmd/gorename",
      \ "github.com/golang/lint/golint",
      \ "github.com/rogpeppe/godef",
      \ "github.com/kisielk/errcheck",
      \ "github.com/jstemmer/gotags",
      \ "github.com/klauspost/asmfmt/cmd/asmfmt",
      \ "github.com/fatih/motion",
      \ "github.com/fatih/gomodifytags",
      \ "github.com/zmb3/gogetdoc",
      \ "github.com/josharian/impl",
      \ "github.com/dominikh/go-tools/cmd/keyify",
      \ ]

" ================================surround.vim========================================
" surround.vim
" https://vimawesome.com/plugin/surround-vim
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
"

" https://vimawesome.com/plugin/fzf
" https://github.com/junegunn/fzf
" 
" " If installed using Homebrew
" Plug '/usr/local/opt/fzf'
" "If installed using git
" Plug '~/.fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Install the new binary fzf
"

" https://vimawesome.com/plugin/easymotion
" https://github.com/easymotion/vim-easymotion
" vim-easymotion
Plug 'easymotion/vim-easymotion'
"

" https://vimawesome.com/plugin/vim-airline-superman
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
"

"===
"
"
Plug 'majutsushi/tagbar'

"===
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"
"
"===
" https://github.com/ferrine/md-img-paste.vim
Plug 'ferrine/md-img-paste.vim'
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change
let g:mdip_imgdir = 'images'
let g:mdip_imgname = 'image'
let g:mdip_imgdir_absolute = '/Users/neilliu/Blog/static/images'
let g:mdip_imgdir_intext = '/images'
"
"===
"
Plug 'AndrewRadev/splitjoin.vim'
"
"===
" snippets插件
Plug 'SirVer/ultisnips'
"
"===
" 配色方案
Plug 'tomasr/molokai'

"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"colorscheme molokai
"
"===
"
Plug 'ctrlpvim/ctrlp.vim'
"
call plug#end()

" --------------------------------------------------------
"  配色方案
" --------------------------------------------------------
colorscheme molokai

let g:rehash256 = 1
let g:molokai_original = 1

set t_Co=256
set background=dark
syntax on
"
"
" --------------------------------------------------------
"  coc.vim
" --------------------------------------------------------
"  coc-setting.json格式的注释
autocmd FileType json syntax match Comment +\/\/.\+$+

" --------------------------------------------------------
" JsonFormat 
" --------------------------------------------------------
command! JsonFormat :execute '%!python -m json.tool' 
			\ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
			\ | :set ft=javascript 
			\ | :

