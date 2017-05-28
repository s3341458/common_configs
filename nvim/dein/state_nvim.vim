if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/chengyu/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/chengyu/.config/nvim/dein'
let g:dein#_runtime_path = '/home/chengyu/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/chengyu/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/chengyu/.config/nvim,/etc/xdg/nvim,/home/chengyu/.local/share/nvim/site,/usr/local/share/nvim/site,/home/chengyu/.config/nvim/dein//repos/github.com/Shougo/dein.vim,/home/chengyu/.config/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/chengyu/.config/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/chengyu/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/chengyu/.config/nvim/after'
filetype off
