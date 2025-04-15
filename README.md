## vscode

### windows

```cmd
mklink %appdata%\Code\User\keybindings.json %cd%\vscode\keybindings.json
mklink %appdata%\Code\User\settings.json %cd%\vscode\settings.json
```

### linux

```cmd
ln -sf vscode/settings.json ~/.config/Code/User/settings.json
ln -sf vscode/keybindings.json ~/.config/Code/User/keybindings.json
```
