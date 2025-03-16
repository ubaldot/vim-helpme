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
for, then press `q` to close the menu.

That's it.

You can scroll the popup as usual with `j,k,<c-f>`, etc.

Of course, there won't be much in the menu until you add stuff to it. Use the
following `.vimrc` entry as an guide for customizing your own menu:

```
g:HelpMeItems = [
    "Shortcuts:",
    "tt           toggle split terminal buffer",
    "daw          delete a word under the cursor",
    "caw          change a word under the cursor and insert",
    "di\"         delete text inside quotes (for others, change \")",
    "ci\"         change text inside quotes (for others, change \")",
    "<C-n>        enter multiple cursors mode",
    "",
    "Commands:",
    ":H           insert nicely formatted header comment (custom)",
    ]
```

Then, invocation of `:HelpMe` will produce:

![helpme](/helpme_preview.png)

### Mapping

You can map a shortcut to call `:HelpMe` with something like this:

```
nnoremap <silent> <leader>h <Cmd>HelpMe<CR>
```

This would make `<leader>h` to open the HelpMe! menu.
You still need to press `q` or `<esc>` to close the menu.

### Sourcing from external files

Sometimes, you want to take a look at different notes but you still want to
access them at the speed of light without leaving Vim.

In such a case you can simply write your notes in an external file and source
it through`:HelpMe <filename>`. For example, if you have a `numpy_cmds.txt`
file in your HOME directory with the following content:

```
USEFUL NUMPY CONSTANTS
np.inf - Infinity
np.NINF - Negative infinity
np.NaN - Not a number
np.PI - 3.1415926535897932384626433...
np.e - 2.718281828459045235360287471...

USEFUL NDARRAY METHODS
A = np.array([[3, 1, 4], [5, -1, 9]]) - Array creation
iter = A.flat - iter is a np.ndarray iterator (it scans by rows)
A = np.atleast_1d(1.0) - A is a 1D np.ndarray

LINEAR ALGERBA
A @ B - Matrix multiplication
lambda, U = la.eig(A) - eigenvalues and (right) eigenvectors
```

then `:HelpMe ~/numpy_cmds.txt` will produce:

![helpme](/numpy_preview.png)

or, if you have a `shopping_list.txt` with the following content:

```
SHOPPING LIST
-------------
Potatoes
Milk
Bananas
Peperoni
Tomatoes
```

then `:HelpMe ~/shopping_list.txt` will produce:

![helpme](/shopping_list_preview.png)

You can also create custom commands to source from different files, like for
example:

```
command! HelpMeNumpy :HelpMe ~/numpy_cmds.txt
command! HelpMeShopping :HelpMe ~/shopping_list.txt
```

Invokation of `:HelpMeNumpy` and `:HelpMeShopping` will produce the output
depicted in the previous two screenshots, respectively.

## Installation

Suggested installation method is through Vim-Plug: add
`Plug 'ubaldot/helpme-vim'` to your `.vimrc` file run `:PlugInstall`.

## License

BSD-3 Clause.
