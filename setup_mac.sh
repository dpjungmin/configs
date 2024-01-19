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

init() {
  [[ ! -d "~/.config" ]] && mkdir -p ~/.config
}

install_packages() {
  brew bundle install
}

setup_configurations() {
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
  init
  install_packages
  setup_configurations
}

main "$@"

echo "Done!!"
