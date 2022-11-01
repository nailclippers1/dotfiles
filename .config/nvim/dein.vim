" dein.vim

" ======================================
" plugin manager

" --------------------------------------
" Load dein.
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" --------------------------------------
" dein configurations.

" In Windows, auto_recache is disabled.  It is too slow.
" let g:dein#auto_recache = !has('win32')

" let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'floating'
" let g:dein#install_check_diff = v:true
" let g:dein#enable_notification = v:true
" let g:dein#install_check_remote_threshold = 24 * 60 * 60
" let g:dein#auto_remote_plugins = v:false
" let g:dein#install_copy_vim = has('nvim')

" Load toml files 
if dein#load_state(s:dein_dir)
  let s:base_dir = fnamemodify(expand('<sfile>'), ':h').'/'
  let s:dein_toml      = s:base_dir . 'dein.toml'
  let s:dein_lazy_toml = s:base_dir . 'dein_lazy.toml'
"  let s:dein_ddc_toml  = s:base_dir . 'ddc.toml'
"  let s:dein_ddu_toml  = s:base_dir . 'ddu.toml'
  call dein#begin(s:dein_dir)
  
" Load plugins.
  call dein#load_toml(s:dein_toml,      {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
"  call dein#load_toml(s:dein_ddc_toml,  {'lazy': 1})
"  call dein#load_toml(s:dein_ddu_toml,  {'lazy': 1})

" Close dein 
  call dein#end()
  call dein#save_state()
endif

" plugin installation check
if dein#check_install()
  call dein#install()
endif

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
