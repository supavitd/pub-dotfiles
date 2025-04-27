#!/usr/bin/env bash

rsync -av .config/ $HOME/.config/

if ! grep -q 'starship init bash' ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi
