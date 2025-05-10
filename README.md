## windows

### vscode

```cmd
mklink %appdata%\Code\User\settings.json %cd%\.config\Code\User\settings.json
mklink %appdata%\Code\User\keybindings.json %cd%\.config\Code\User\keybindings.json
```

## linux

```shell
mkdir -p ~/.config/Code/User
stow .
```
