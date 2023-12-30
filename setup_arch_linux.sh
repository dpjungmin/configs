#!/usr/bin/env sh

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
  if [[ ! -d "~/.config" ]]; then
    mkdir -p ~/.config
  fi
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
  if [[ ! -d "$HOME/.config/hypr" ]]; then
    ln -s $(pwd)/hypr $HOME/.config/hypr
  fi

  if [[ ! -d "$HOME/.config/eww" ]]; then
    ln -s $(pwd)/eww $HOME/.config/eww
  fi

  if [[ ! -d "$HOME/.config/wezterm" ]]; then
    ln -s $(pwd)/wezterm $HOME/.config/wezterm
  fi

  if [[ ! -f "$HOME/.gitconfig" ]]; then
    ln -s $(pwd)/.gitconfig $HOME/.gitconfig
  fi

  rm $HOME/.config/fish/config.fish
  ln -s $(pwd)/config.fish $HOME/.config/fish/config.fish

  if [[ ! -f "$HOME/.config/starship.toml" ]]; then
    ln -s $(pwd)/starship.toml $HOME/.config/starship.toml
  fi

  if [[ ! -d "$HOME/.config/nvim" ]]; then
    ln -s $(pwd)/nvim $HOME/.config/nvim
  fi
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
