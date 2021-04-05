plugins=(
    git
    blunder
    dotenv
    osx
    rake
    rbenv
    ruby
)
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT=true

# Ruby through homebrew
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"' >> ~/.zshrc

# github
alias mux="tmuxinator"
alias fun="tmuxinator start anirudh-fun"

# vim
alias vimrc="vim ~/dotfiles/.vimrc"
