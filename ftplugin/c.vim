" Functions {{{1

" First occurence of keyword in function
function! JumpToFirstOccurenceInFunction()
    normal *
    keepjumps normal N999[{n
    nohlsearch
endfunction

" First occurence of keyword in file
function! JumpToFirstOccurenceInFile()
    normal *
    keepjumps normal ggn
    nohlsearch
endfunction

" Mappings {{{1

nnoremap [[ 999[{
nnoremap ]] 999]}
nnoremap gd :silent call JumpToFirstOccurenceInFunction()<cr>
nnoremap gD :silent call JumpToFirstOccurenceInFile()<cr>
