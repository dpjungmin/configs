#!/bin/sh

parse_args() {
  while [[ "$#" -gt 0 ]]; do
    case $1 in
      -c | --config)
        setup_configurations
        exit 0
  ;;
      *)
        echo "invalid argument: $1"
        exit 1
  ;;
    esac
    shift
  done
}

check() {
  local dependencies=(yay Hyprland)

  for d in ${dependencies[@]}; do
    if [[ -z "$(which $d)" ]]; then
      echo "missing dependency \`$d\`"
      exit 1
    fi
  done
}

init() {
  [[ ! -d "~/.config" ]] && mkdir -p ~/.config
}

install_packages() {
  sudo yay -S sddm dunst pipewire polkit-kde-agent qt5-wayland qt6-wayland
  sudo yay -S python python-pip lua clang nodejs typescript llvm
  sudo yay -S lua-language-server
  sudo yay -S stylua
  sudo yay -S git git-lfs
  sudo yay -S firefox
  sudo yay -S hyprpaper wofi thunar grim slurp swappy
  sudo yay -S fish starship zoxide neovim
  sudo yay -S exa bat ripgrep fd bear git-delta
}

setup_configurations() {
  [[ ! -d "$HOME/.config/hypr" ]] && ln -s $(pwd)/hypr $HOME/.config/hypr
  [[ ! -d "$HOME/.config/eww" ]] && ln -s $(pwd)/eww $HOME/.config/eww
  [[ ! -d "$HOME/.config/wezterm" ]] && ln -s $(pwd)/wezterm $HOME/.config/wezterm
  [[ ! -f "$HOME/.config/starship.toml" ]] && ln -s $(pwd)/starship.toml $HOME/.config/starship.toml
  [[ ! -d "$HOME/.config/nvim" ]] && ln -s $(pwd)/nvim $HOME/.config/nvim
  [[ ! -f "$HOME/.gitconfig" ]] && ln -s $(pwd)/.gitconfig $HOME/.gitconfig
  [[ ! -f "$HOME/themes.gitconfig" ]] && ln -s $(pwd)/themes.gitconfig $HOME/themes.gitconfig
  [[ ! -f "$HOME/.ripgreprc" ]] && ln -s $(pwd)/.ripgreprc $HOME/.ripgreprc

  rm $HOME/.config/fish/config.fish
  ln -s $(pwd)/config.fish $HOME/.config/fish/config.fish
}

main() {
  parse_args "$@"
  check
  init
  install_packages
  setup_configurations
}

main "$@"

echo "Done!!"
