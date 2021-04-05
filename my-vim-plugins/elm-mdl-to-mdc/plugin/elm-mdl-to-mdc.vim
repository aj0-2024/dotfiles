let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, 'python'))
sys.path.insert(0, python_root_dir)
import mdc_button
import mdc_icon_button
import mdc_textfield
EOF

function! MdcButton()
    python3 mdc_button.to_mdc_button()
endfunction
command! -nargs=0 MdcButton call MdcButton()

function! MdcIconButton()
    python3 mdc_icon_button.to_mdc_icon_button()
endfunction
command! -nargs=0 MdcIconButton call MdcIconButton()

function! MdcTextField()
    python3 mdc_textfield.to_mdc_textfield()
endfunction
command! -nargs=0 MdcTextField call MdcTextField()
