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


# #  Few defaults
# if !exists('g:HelpMeMinWidth')
#     g:HelpMeMinWidth = 40   # minimum width of the popup menu in cols
# endif


# if !exists('g:HelpMeMaxWidth')
#     g:HelpMeMaxWidth = 140   # maximum width of the popup menu in cols
# endif


# if !exists('g:HelpMeWindowTitle')
#     g:HelpMeWindowTitle = "HelpMe!" # the default title of the popup menu
# endif

#  ===== From here
if !exists('g:HelpMeItems')
    # g:HelpMeHeight = 4
    g:HelpMeItems = [
    "Add items here by assigning a list to `g:HelpMeItems` in your .vimrc file ",
    "See README.md at https://github.com/ubaldot/helpme-vim for detailed instructions",
    "",
     ]
# else
#     g:HelpMeHeight = len(g:HelpMeItems)
endif


# for item in g:HelpMeItems
#     g:HelpMeWidth = min([g:HelpMeMaxWidth, max([len(item), g:HelpMeMinWidth])])
# endfor


command! -nargs=? -complete=file HelpMe call <sid>helpme#HelpMePopup(<f-args>)
