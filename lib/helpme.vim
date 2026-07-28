vim9script

var popup_id = -1

export def Echoerr(msg: string)
  echohl ErrorMsg | echom $'[helpme] {msg}' | echohl None
enddef

export def HelpMePopup(passed_items: string = '')
    var items: any

    # Select input
    if !empty(passed_items)
      if filereadable(fnamemodify(passed_items, ':p'))
        items = readfile(passed_items)
      elseif typename(eval(passed_items)) == 'list<string>'
        items = eval(passed_items)
      else
        Echoerr("Argument must be a file or a 'list<string>'")
      endif
    elseif exists('g:HelpMeItems') != 0
      items = g:HelpMeItems
    else
      items =<< trim END
      Add items here by assigning a list to `g:HelpMeItems` OR by passing a
      text file OR by passing a list of strings to `:HelpMe` command.

      See :h helpme.txt for detailed instructions

END
    endif

    items = items + ["", "press 'q' or <esc> to close"]
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
    win_execute(popup_id, 'setlocal ft=markdown')
    win_execute(popup_id, 'setlocal conceallevel=2')
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
