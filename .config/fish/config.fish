. ~/dotfiles/.config/fish/alias.fish
set -x EDITOR vim

if status --is-login
    . ~/dotfiles/.config/fish/env.fish
end

set -gx PATH /Users/Anirudh/.config/fnm/bin/ $PATH
set -gx PATH /Users/Anirudh/.nvm/versions/node/v10.15.3/bin/ $PATH

status --is-interactive; and source (rbenv init -|psub)
