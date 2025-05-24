#!/usr/bin/env bash

rsync -ravv ~/.config/nvim/ .config/nvim
rsync -avv ~/.config/zellij/config.kdl .config/zellij/config.kdl
rsync -avv ~/.config/starship.toml .config/starship.toml
