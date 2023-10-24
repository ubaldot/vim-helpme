vim9script

export def HelpMePopup(...passed_items: list<string>)
    var items = g:HelpMeItems
    if !empty(passed_items)
        items = readfile(passed_items[0])
    endif
    items += ["", "press 'q' to close"]
    popup_create(items, {
        title: " HelpMe! ",
        line: line('$'),
        col: col('$'),
        pos: "center",
        posinvert: false,
        filter: HelpMeFilter,
        borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
        border: [1, 1, 1, 1],
        maxheight: &lines - 1,
        })
enddef

# close popup dialog with q
def HelpMeFilter(id: number, key: string): bool
    if key ==# 'q'
        popup_close(id)
        return true
    else
        return false
    endif
enddef
