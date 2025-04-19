## vscode

### windows

```cmd
mklink %appdata%\Code\User\keybindings.json %cd%\vscode\keybindings.json
mklink %appdata%\Code\User\settings.json %cd%\vscode\settings.json
```

### linux

```cmd
ln -sf $PWD/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf $PWD/vscode/keybindings.json ~/.config/Code/User/keybindings.json
```
