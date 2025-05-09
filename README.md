## windows

### vscode

```cmd
mklink %appdata%\Code\User\settings.json %cd%\vscode\settings.json
mklink %appdata%\Code\User\keybindings.json %cd%\vscode\keybindings.json
```

## linux

```shell
stow .
```
