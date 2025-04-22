For the nvim

```bash
rm -rf ~/.conifg/nvim
ln -s ~/Documents/dotfiles/nvim ~/.config/nvim
```

For the alacritty

```bash
rm -rf ~/.conifg/alacritty
ln -s ~/Documents/dotfiles/alacritty ~/.config/alacritty
```

For the tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -rf ~/.tmux.conf
ln -s ~/Documents/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

For the zsh

```bash
rm -rf ~/.zshrc
ln -s ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc
```
