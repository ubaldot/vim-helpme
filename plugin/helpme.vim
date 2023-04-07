if !has('vim9script') ||  v:version < 900
  " Needs Vim version 9.0 and above
  finish
endif

vim9script

# helpme.vim
# github.com/ubaldot/helpme-vim


if exists('g:helpme_loaded')
    finish
endif

g:helpme_loaded = 1

if !exists('g:HelpMeItems')
    g:HelpMeItems = [
    "Add items here by assigning a list to `g:HelpMeItems` in your .vimrc file ",
    "See README.md at https://github.com/ubaldot/helpme-vim for detailed instructions",
    "",
     ]
endif

command! -nargs=? -complete=file HelpMe call helpme#HelpMePopup(<f-args>)
