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

init() {
  if [[ ! -d "~/.config" ]]; then
    mkdir -p ~/.config
  fi
}

install_packages() {
  brew bundle install
}

setup_configurations() {
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
  init
  install_packages
  setup_configurations
}

main "$@"

echo "Done!!"
