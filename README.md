# HelpMe!
Have you ever found yourself staring at a blinking cursor on Vim's command line, trying your hardest to remember what the command you're trying to perform is?

Remember that super cool trick you saw on Reddit a year ago and thought, "Wow, I'm totally going to use that!" and now you can't remember what was that?

Well, I have both of these problems and this plugin may help you too.

HelpMe! is nothing more than a tiny customizable popup menu for Vim 9.0+ that you can fill as you want and that you recall whenever you want just by simply typing `:HelpMe`.

## Usage
Simply enter the command `:HelpMe` to open the menu, find what you're looking for, then press `q` to close the menu. That's it.

Of course, there won't be much in the menu until you add stuff to it. Use the following `.vimrc` entry as an guide for customizing your own menu:

``` 
let g:HelpMeItems = [
    "Shortcuts:",
    "tt           toggle split terminal buffer",
    "daw          delete a word under the cursor",
    "caw          change a word under the cursor and insert",
    "di\"          delete text inside quotes (for others, change \")",
    "ci\"          change text inside quotes (for others, change \")",
    "<C-n>        enter multiple cursors mode",
    "",
    "Commands:",
    ":H           insert nicely formatted header comment (custom)",
    ]
```

By default, Vim will ignore all other input aside from `q` while HelpMe! is open. 

Optionally, you can map a shortcut to call `:HelpMe` with something like this:
```
nnoremap <silent> <C-h> :HelpMe<CR>
```

This would make `ctrl+h` to open the HelpMe! menu.


## Installation
Add `helpme.vim` to your `~/.vim/plugin/` folder, or if you're using Vim-Plug, add `Plug 'ubaldot/helpme-vim'` to your `.vimrc` file.

## Preview
![helpme](/helpme_preview.png)
