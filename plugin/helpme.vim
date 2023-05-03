vim9script

# Vim plugin for helping you in remembering stuff.
# Maintainer: Ubaldo Tiberi
# License: same as Vim
# GetLatestVimScripts: 6069 1 :AutoInstall: replica.vim


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
    "See :h helpme.txt for detailed instructions.",
    "",
     ]
endif

import autoload "../lib/helpme.vim"

if !exists(":HelpMe")
    command -nargs=? -complete=file HelpMe :call <SID>helpme.HelpMePopup(<f-args>)
endif
