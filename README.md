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

Simply enter the command `:HelpMe` to open the menu, find what you're looking
for, then press `q` or `<esc>` to close the menu.

That's it. You can scroll the popup as usual with `j, k, <c-f>`, etc.

Of course, there won't be much in the menu until you add stuff to it. Add the
following lines to your `.vimrc` to see how the plugin works in practice:

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

Note that you can use markdown formalism to make your notes to stand out!

Next, invocation of `:HelpMe` will produce the following popup:

![helpme](/helpme_preview.png)

### Mapping

You can map a shortcut to call `:HelpMe` with something like this:

```
nnoremap <silent> <leader>h <Cmd>HelpMe<CR>
```

This would make `<leader>h` to open the HelpMe! menu. You still need to press
`q` or `<esc>` to close the menu.

### Sourcing from external files

Sometimes, you want to take a look at different notes but you still want to
access them at the speed of light without leaving Vim. In such a case you can
simply write your notes in an external file and source it
through`:HelpMe <filename>`. For example, if you have a `shopping_list.txt`
file in your `HOME` directory with the following content:

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

```
command! HelpMeShopping :HelpMe ~/shopping_list.txt
```

Invocation of `:HelpMeShopping` will produce the output depicted in the
previous screenshots.

## Installation

Suggested installation method is through Vim-Plug: add
`Plug 'ubaldot/helpme-vim'` to your `.vimrc` file run `:PlugInstall`.

## License

BSD-3 Clause.
