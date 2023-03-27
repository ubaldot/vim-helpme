# helpme.vim
# github.com/ubaldot/helpme-vim

vim9script

if exists('g:plugin_helpme')
    finish
endif

g:plugin_helpme = 1


# plugin settings
if !exists('g:HelpMeMinWidth')
    g:HelpMeMinWidth = 40   # minimum width of the popup menu in cols
endif


if !exists('g:HelpMeMaxWidth')
    g:HelpMeMaxWidth = 140   # maximum width of the popup menu in cols
endif


if !exists('g:HelpMeWindowTitle')
    g:HelpMeWindowTitle = "HelpMe!" # the default title of the popup menu
endif

# if no menu items exist, add some help text, otherwise set height to the number of items in the list
if !exists('g:HelpMeItems')
    g:HelpMeHeight = 4
    g:HelpMeItems = [
    \ "Add items here by assigning a list to `g:HelpMeItems` in your .vimrc file",
    \ "See README.md at https://github.com/leftbones/helpme-vim for detailed instructions",
    \ "",
    \ "press 'q' to close",
    \ ]
else
    g:HelpMeHeight = len(g:HelpMeItems)
    g:HelpMeItems += ["", "press 'q' to close"]
endif


for item in g:HelpMeItems
    g:HelpMeWidth = min([g:HelpMeMaxWidth, max([len(item), g:HelpMeMinWidth])])
endfor

def HelpMePopup()
    popup_dialog(g:HelpMeItems, {
        title: g:HelpMeWindowTitle,
        filter: HelpMeFilter,
        maxheight: &lines - 1,
        })
enddef

# close the menu with q, all other keys are consumed to avoid accidental keypresses while the menu is open
def HelpMeFilter(id: number, key: string): bool
    if key == 'q'
        popup_close(id)
        return true
    else
        return false
    endif
enddef

# default mappings
command! HelpMe :call <sid>HelpMePopup()

