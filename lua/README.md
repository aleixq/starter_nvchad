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



# PHP DAP

To add the debugger dap with php, clone vscode-php-debug to /etc/xdg/nvim/vscode-php-debug (if you want another dir set in https://github.com/aleixq/starter_nvchad/blob/main/lua/myinit.lua#L39 :

```
git clone https://github.com/xdebug/vscode-php-debug.git
cd vscode-php-debug
npm install && npm run build
```

# Clear nvchad for one user

```
echo "echo 'removing all user nvchad stuff' && rm -Ir ~/.config/nvim && rm -Ir ~/.local/share/nvim && rm -Ir ~/.cache/nvim" > /usr/local/bin/nvchad-clear-configuration
chmod +x /usr/local/bin/nvchad-clear-configuration
/usr/local/bin/nvchad-clear-configuration
```
