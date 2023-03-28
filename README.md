# HelpMe!
Have you ever found yourself staring at a blinking cursor on Vim's command line, trying your hardest to remember what the command you're trying to perform is?

Are you learning a new Python library but you could not really remember that command and you are too tired to go through all the API documentation to find it out?

Well, I have both of these problems and this plugin may help you too.

HelpMe! is nothing more than a tiny customizable popup menu for Vim 9.0+ that you can fill as you want and that you recall whenever you want just by simply typing `:HelpMe`.

Have your favourite notes always at hand!

## Usage
Simply enter the command `:HelpMe` to open the menu, find what you're looking for, then press `q` to close the menu. That's it.

Of course, there won't be much in the menu until you add stuff to it. Use the following `.vimrc` entry as an guide for customizing your own menu:

``` 
g:HelpMeItems = [
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

You can also specify the list in an external file and use `:HelpMe filename`.
For example, if you have a `~numpy_cmds.txt` file with the following content:

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

then `:HelpMe numpy_cmds.txt? will produce the following:


![helpme](/NumpyExample.png)


Optionally, you can map a shortcut to call `:HelpMe` with something like this:
```
nnoremap <silent> <C-h> :HelpMe<CR>
```

This would make `ctrl+h` to open the HelpMe! menu.

You could also create custom commands to source specific files, like for example:

```
command! HelpMeNumpy :HelpMe ~/numpy_cmd.txt
command! HelpMeShopping :HelpMe ~/shopping_list.txt
```
This would make `:HelpMeNumpy` to source from `~/numpy_cmd.txt` and `:HelpMeShopping` to source from `~/shopping_list.txt`


![helpme](/NumpyExample.png)
![helpme](/ShoppingListExample.png)


## Installation
Add `helpme.vim` to your `~/.vim/plugin/` folder, or if you're using Vim-Plug, add `Plug 'ubaldot/helpme-vim'` to your `.vimrc` file.

