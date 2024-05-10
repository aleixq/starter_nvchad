# Nvchad Custom

My custom options and plugins to nvchad.

- To add this as local user:

`git clone to ~/.config/nvim`

- To add this system wide:

`git clone to /etc/xdg/nvim/NvChad`

And remember that to run as system wide it needs in /etc/xdg/nvim/sysinit.vim :

```vim
set runtimepath+=/etc/xdg/nvim/NvChad
source /etc/xdg/nvim/NvChad/init.lua
```

Each time plugins are added/ suppressed, run

```
:Lazy sync
```
