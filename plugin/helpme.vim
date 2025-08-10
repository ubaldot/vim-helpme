vim9script noclear

# Vim plugin for helping you in remembering stuff.
# Maintainer: Ubaldo Tiberi
# License: BSD3-Clause.
# GetLatestVimScripts: 6069 1 :AutoInstall: replica.vim


if !has('vim9script') ||  v:version < 900
  # Needs Vim version 9.0 and above
  finish
endif

if exists('g:loaded_helpme') && g:loaded_helpme
    finish
endif
g:loaded_helpme = false

import "../autoload/helpme.vim"

command! -nargs=? -complete=file HelpMe helpme.HelpMePopup(<f-args>)
