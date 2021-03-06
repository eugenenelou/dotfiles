" Make it obvious where the char limit is
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%89v', 100)

" Toggle les numéros de ligne
" ———————————————————————————
noremap à :set invnumber<CR>

" Recherche incrémentale et surlignée
" ———————————————————————————————————
:set hls is

if filereadable(expand("~/.vimrc.bepo"))
  source ~/.vimrc.bepo
endif

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
