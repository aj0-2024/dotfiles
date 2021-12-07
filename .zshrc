plugins=(
    git
    dotenv
    macos
    rake
    rbenv
    ruby
)
ZSH_THEME="robbyrussell"

# github
alias mux="tmuxinator"

# vim
alias vimrc="vim ~/dotfiles/.vimrc"

build_ctags() {
    ctags -R -o ~/mytags ~/src
}

alias vim="nvim"


