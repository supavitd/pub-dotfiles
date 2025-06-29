#!/usr/bin/env bash

rsync -av .config/ $HOME/.config/

echo 'export LANG=en_US.UTF-8' >> ~/.zshrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc

if ! grep -q 'starship init bash' ~/.zshrc; then
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

if ! grep -q '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh' ~/.zshrc; then
    echo '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh"' >> ~/.zshrc
fi
