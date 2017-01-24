" dein settings {{{
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let s:dein_dir = g:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Auto Download
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_dir)

    let s:toml_dir = g:config_home . '/dein'
    let s:toml = s:toml_dir . '/plugins.toml'
    let s:toml_lazy = s:toml_dir . '/lazy.toml'

    call dein#begin(s:dein_dir, [s:toml, s:toml_lazy])

    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})
    "if has('nvim')
    "    call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
    "endif

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}
"
syntax enable

set background=dark
set ts=4 sw=4 et ws is nowrap 
set number

let g:seiya_auto_enable=1
let g:deoplete#enable_at_startup=1

colorscheme solarized
