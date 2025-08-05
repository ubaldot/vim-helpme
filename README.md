# HelpMe!

Have you ever found yourself staring at a blinking cursor on Vim's command
line, trying your hardest to remember what the command you're trying to
perform is?

Are you learning a new _SuperCoolLanguage_ library but you could not really
remember that specific command and you are too tired to go through all the API
documentation to find it out?

Well, I have both of these problems and this plugin may help you too.

HelpMe! is nothing more than a tiny customizable popup menu for Vim 9.0+ that
you can fill as you want and that you can recall whenever you want.

## Usage

Simply enter the command `:HelpMe` to open the popup and press `q` or `<esc>`
to close it. That's it. You can scroll the popup as usual with `j, k, <c-f>`,
etc.

Of course, there won't be much in the menu until you add stuff to it. You can
do it in a number of ways, as described next.

### Option 1

Add the following lines to your `.vimrc`:

```
g:HelpMeItems = [
    "## Shortcuts:",
    "",
    "**tt**           toggle split terminal buffer",
    "**daw**          delete a word under the cursor",
    "**caw**          change a word under the cursor and insert",
    "**di\"**          delete text inside quotes (for others, change `\"`)",
    "**ci\"**          change text inside quotes (for others, change `\"`)",
    "**<C-n>**        enter multiple cursors mode",
    "",
    "*Commands:*",
    "**:H**           insert nicely formatted header comment (custom)",
  ]
```

Next, invocation of `:HelpMe` will produce the following popup:

![helpme](/helpme_preview.png)

Note that you can use markdown language to make your notes to stand out!

### Option 2

Invoke `:HelpMe` with a text file, i.e. `:HelpMe /path/to/file`. If you have a
`shopping_list.txt` file in your `HOME` directory with the following content:

```
# SHOPPING LIST

Potatoes
Milk
**Bananas**
Pepperoni
*Tomatoes*
```

then `:HelpMe ~/shopping_list.txt` will produce:

![helpme](/shopping_list.png)

You can also create custom commands to source from different files, like for
example:

```vim
command! HelpMeShopping :HelpMe ~/shopping_list.txt
```

Invocation of `:HelpMeShopping` will produce the output depicted in the
previous screenshots.

### Option 3

Pass a list of strings to `:HelpMe` command, for example run
`:HelpMe ['potato', 'carrots', 'strawberries']` to have an effect like the
ones depicted above.

In all the cases the popup filetype is set to `markdown`.

### Mapping & Commands

You can use utilitarian mappings like the following:

```vim
nnoremap <silent> <leader>h <Cmd>HelpMe ~/shopping_list.txt<CR>
```

This would make `<leader>h` to open the HelpMe! popup shwoing the content of
`~/shopping_list.txt`.

You can also define utilitarian commands like the following:

```vim
  command! HelpMeShopping :HelpMe ~/shopping_list.txt
```

You still need to press `q` or `<esc>` to close the popup.

## Installation

Suggested installation method is through Vim-Plug: add
`Plug 'ubaldot/helpme-vim'` to your `.vimrc` file run `:PlugInstall`.

## License

BSD-3 Clause.
