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

def HelpMeFilter(id: number, key: string): bool
  # To handle the keys when release notes popup is visible
  # Close
  if key ==# 'q' || key ==# "\<esc>"
    popup_close(id)
  # Move down
  elseif ["\<tab>", "\<C-n>", "\<Down>", "\<ScrollWheelDown>"]->index(key) != -1
    win_execute(id, "normal! \<c-e>")
  # Move up
  elseif ["\<S-Tab>", "\<C-p>", "\<Up>", "\<ScrollWheelUp>"]->index(key) != -1
    win_execute(id, "normal! \<c-y>")
  # Jump down
  elseif key == "\<C-f>"
    win_execute(id, "normal! \<c-f>")
  # Jump up
  elseif key == "\<C-b>"
    win_execute(id, "normal! \<c-b>")
  else
    return false
  endif
  return true
enddef
