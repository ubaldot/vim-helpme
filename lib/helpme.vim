vim9script

var popup_id = -1

export def HelpMePopup(passed_items: string = '')
    var items = empty(passed_items) ? g:HelpMeItems : readfile(passed_items)
    items += ["", "press 'q' or <esc> to close"]
    popup_id = popup_create(items, {
        title: " HelpMe! ",
        line: &lines,
        col: &columns,
        pos: "botright",
        posinvert: false,
        filter: HelpMeFilter,
        borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
        border: [1, 1, 1, 1],
        maxheight: &lines - 1,
        mapping: 0,
        })
enddef

# close popup dialog with q or esc
def HelpMeFilter(id: number, key: string): bool
    if key ==# 'q' || key ==# "\<esc>"
        popup_close(id)
    elseif index(
        ["\<tab>", "\<C-n>", "\<Down>", "\<ScrollWheelDown>"], key) != -1
      var ln = getcurpos(popup_id)[1]
      win_execute(popup_id, "normal! \<c-e>")
      if ln == getcurpos(popup_id)[1]
        win_execute(popup_id, "normal! gg")
      endif
    elseif index(
        ["\<S-Tab>", "\<C-p>", "\<Up>", "\<ScrollWheelUp>"], key) != -1
      var ln = getcurpos(popup_id)[1]
      win_execute(popup_id, "normal! \<c-y>")
      if ln == getcurpos(popup_id)[1]
        win_execute(popup_id, "normal! G")
      endif
    elseif key == "\<C-f>"
      win_execute(popup_id, "normal! \<c-f>")
    elseif key == "\<C-b>"
      win_execute(popup_id, "normal! \<c-b>")
    else
        return false
    endif
    return true
enddef
