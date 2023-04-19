vim9script

# Vim plugin for helping you in remembering stuff
# Maintainer: Ubaldo Tiberi
# License: same as Vim


if !has('vim9script') ||  v:version < 900
  # Needs Vim version 9.0 and above
  finish
endif


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

if !exists(":HelpMe")
    command -nargs=? -complete=file HelpMe :call helpme#HelpMePopup(<f-args>)
endif
