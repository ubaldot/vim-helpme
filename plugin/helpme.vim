vim9script

# helpme.vim
# github.com/ubaldot/helpme-vim


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

# From here
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

def HelpMePopup(...passed_items: list<string>)
    var items = g:HelpMeItems
    if !empty(passed_items)
        items = readfile(passed_items[0])
    endif
    popup_dialog(items, {
        title: g:HelpMeWindowTitle,
        filter: HelpMeFilter,
        maxheight: &lines - 1,
        })
    # g:HelpMeItems = items
enddef


# close the menu with q
def HelpMeFilter(id: number, key: string): bool
    if key == 'q'
        popup_close(id)
        return true
    else
        return false
    endif
enddef

command! -nargs=? -complete=file HelpMe :call <sid>HelpMePopup(<f-args>)

