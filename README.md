# dotfiles

Collection of my dotfiles across ubuntu/linux, windows, wsl

## Arrangement

- `linux` - linux dotfiles
- `windows` - windows dotfiles
- `wsl` - wsl dotfiles
- the global shared dotfiles are in the root directory
- `apps` - Application-specific dotfiles are in the `apps` directory.

nb. Some application-specific dotfiles are shared across platforms e.g `zshrc`. The shared config options are in the root directory. while those residing in the `apps` directory within each platform-specific directory are platform-specific e.g `zshrc` for wsl is in the `wsl/apps` directory.

### Some interesting apps/tools

- `zsh` - Zsh config with [oh-my-zsh](https://ohmyz.sh/)
- `tmux` - Tmux config with tmux plugin manager and [tmux-tilish](https://github.com/jabirali/tmux-tilish)
