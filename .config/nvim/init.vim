"██╗      ██████╗ ██╗   ██╗███████╗   ██╗  ██╗   ██╗
"██║     ██╔═══██╗██║   ██║██╔════╝   ██║  ╚██╗ ██╔╝
"██║     ██║   ██║██║   ██║█████╗     ██║   ╚████╔╝ 
"██║     ██║   ██║╚██╗ ██╔╝██╔══╝     ██║    ╚██╔╝  
"███████╗╚██████╔╝ ╚████╔╝ ███████╗██╗███████╗██║   
"╚══════╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝╚══════╝╚═╝   
"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗          
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝          
"  ██║   ██║██║██╔████╔██║██████╔╝██║               
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║               
"██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗          
"╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝    
"
call plug#begin('~/.vim/plugged')
" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pantharshit00/vim-prisma'
" Git in the gutter
Plug 'airblade/vim-gitgutter'
" Indent char
Plug 'Yggdroot/indentLine'
" File tree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" CtrlP menu
Plug 'ctrlpvim/ctrlp.vim'
" Color hightlighting
Plug 'brenoprata10/nvim-highlight-colors'
" Theming
Plug 'itchyny/lightline.vim'
"Plug 'thedenisnikulin/vim-cyberpunk'
Plug 'cocopon/iceberg.vim'

call plug#end()


lua require('nvim-highlight-colors').setup {}

" Avoid syntax hl sync problems
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let mapleader="\\"
" Defaults
set number
set relativenumber
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=80
set so=8

" Disable right-click menu
set mouse=

" Aesthetic
syntax on
set termguicolors
set encoding=UTF-8
colorscheme iceberg

let g:lightline = {
      \ 'colorscheme': 'iceberg'
\  }

" Enables cursor line position tracking:
set cursorline
" Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" Sets the line numbering to red background:
highlight CursorLineNR ctermbg=black

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Git Gutter
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)


let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-emmet',
  \ 'coc-prisma'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" NerdTree Settings
nnoremap <leader>c :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeToggleFind<CR>

" Remap for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" " Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Code Completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

":Prettier to format the active buffer
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')



" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':'\v[\/](git|node_modules|public\/build)$'
  \ }

