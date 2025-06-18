# signal.nvim

Use your Neovim as a fuzzy finder.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'iruzo/signal.nvim',
  cmd = 'Signal',
  dependencies = { {'nvim-telescope/telescope.nvim', version = '*'} },
  opts = true,
}
```

## Usage

### Manual Command

Run the `:Signal` command in Neovim:

```vim
:Signal
```

To copy to clipboard instead of printing to stdout:

```vim
:Signal copy
```

### Direct Execution with Files

You can use signal.nvim directly when opening files:

**With piped content:**
```bash
cat your_file.txt | nvim -c "Signal" >/dev/tty 2>&1
```

**With direct file:**
```bash
nvim your_file.txt -c "Signal" >/dev/tty 2>&1
```

## How it works

1. Opens Telescope's `current_buffer_fuzzy_find`
2. By default, prints the selected line to stdout
3. With the `copy` parameter, copies the selected line to your system clipboard (using the `+` register)
4. Closes Neovim immediately after selection
