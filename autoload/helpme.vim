vim9script

export def! g:HelpMePopup(...passed_items: list<string>)
    var items = g:HelpMeItems
    if !empty(passed_items)
        items = readfile(passed_items[0])
    endif
    items += ["", "press 'q' to close"]
    popup_dialog(items, {
        title: "HelpMe!",
        filter: HelpMeFilter,
        maxheight: &lines - 1,
        })
enddef


# close popup dialog with q
def HelpMeFilter(id: number, key: string): bool
    if key == 'q'
        popup_close(id)
        return true
    else
        return false
    endif
enddef
