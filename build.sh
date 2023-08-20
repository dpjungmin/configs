#!/usr/bin/env sh
#
# Install packages and setup custom configurations.

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
  local core_packages=(sddm dunst pipewire polkit-kde-agent qt5-wayland qt6-wayland)
  local apps=(hyprpaper fish neovim)

  yay -S ${core_packages[@]}
  yay -S ${apps[@]}
}

setup_configurations() {
  if [[ ! -d "$HOME/.config/hypr" ]]; then
    ln -s $(pwd)/hypr $HOME/.config/hypr
  fi

  if [[ ! -d "$HOME/.gitconfig" ]]; then
    ln -s $(pwd)/.gitconfig $HOME/.gitconfig
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
