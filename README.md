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

For the vscode

```bash
rm -rf ~/.config/Code/User/*.json
rm -rf ~/.config/Code/User/snippets
ln -s ~/Documents/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -s ~/Documents/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s ~/Documents/dotfiles/vscode/snippets ~/.config/Code/User/snippets
```
