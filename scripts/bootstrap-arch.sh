#!/usr/bin/env bash

set -Eeuo pipefail
shopt -s nullglob

run() {
  "$@"
}

info() {
  printf '[info] %s\n' "$*"
}

warn() {
  printf '[warn] %s\n' "$*" >&2
}

die() {
  printf '[erro] %s\n' "$*" >&2
  exit 1
}

if [[ ${EUID} -eq 0 ]]; then
  die 'Execute como usuario normal, nao como root.'
fi

if [[ ! -f /etc/arch-release ]]; then
  die 'Este script foi feito para Arch Linux.'
fi

command -v sudo >/dev/null 2>&1 || die 'sudo nao encontrado.'
command -v pacman >/dev/null 2>&1 || die 'pacman nao encontrado.'

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

PACMAN_PACKAGES=(
  git
  curl
  stow
  zsh
  tmux
  neovim
  starship
  zoxide
  fzf
  eza
  bat
  fd
  ripgrep 
  lazygit
  mise
  tree-sitter
  wl-clipboard
  xclip
  unzip
  ghostty
)

install_pacman_packages() {
  local missing=()
  local pkg

  for pkg in "$@"; do
    if ! pacman -Q "$pkg" >/dev/null 2>&1; then
      missing+=("$pkg")
    fi
  done

  if ((${#missing[@]} == 0)); then
    info 'Pacotes do pacman ja estao instalados.'
    return
  fi

  info 'Instalando pacotes via pacman...'
  run sudo pacman -Syu --needed --noconfirm "${missing[@]}"
}

stow_all_packages() {
  local packages=()
  local dir
  local name

  for dir in "$DOTFILES_DIR"/*; do
    [[ -d "$dir" ]] || continue
    name="$(basename "$dir")"

    case "$name" in
      scripts) continue ;;
      .*) continue ;;
    esac

    packages+=("$name")
  done

  if ((${#packages[@]} == 0)); then
    die "Nenhum pacote stow encontrado em $DOTFILES_DIR"
  fi

  info "Aplicando stow para: ${packages[*]}"
  run stow --dir="$DOTFILES_DIR" --target="$HOME" --restow "${packages[@]}"
}

ensure_oh_my_zsh() {
  local omz_dir="$HOME/.oh-my-zsh"

  if [[ ! -d "$omz_dir" ]]; then
    info 'Instalando oh-my-zsh...'
    run git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$omz_dir"
  else
    info 'oh-my-zsh ja instalado.'
  fi

  run mkdir -p "$omz_dir/custom/plugins"

  local plugin_name
  local plugin_repo
  local plugin_dir

  for plugin_name in zsh-autosuggestions zsh-syntax-highlighting; do
    case "$plugin_name" in
      zsh-autosuggestions) plugin_repo='https://github.com/zsh-users/zsh-autosuggestions.git' ;;
      zsh-syntax-highlighting) plugin_repo='https://github.com/zsh-users/zsh-syntax-highlighting.git' ;;
      *) continue ;;
    esac

    plugin_dir="$omz_dir/custom/plugins/$plugin_name"

    if [[ -d "$plugin_dir/.git" ]]; then
      run git -C "$plugin_dir" pull --ff-only
    elif [[ -d "$plugin_dir" ]]; then
      warn "$plugin_dir existe mas nao e um repo git; pulando."
    else
      run git clone --depth=1 "$plugin_repo" "$plugin_dir"
    fi
  done
}

install_mise_tools() {
  if ! command -v mise >/dev/null 2>&1; then
    warn 'mise nao encontrado; pulando instalacao de ferramentas do mise.'
    return
  fi

  info 'Instalando tools do mise (config.toml)...'
  run mise install
}

install_sesh_with_go() {
  if ! command -v mise >/dev/null 2>&1; then
    warn 'mise nao encontrado; pulando instalacao do sesh via go.'
    return
  fi

  info 'Instalando sesh via go (runtime do mise)...'
  run mkdir -p "$HOME/.local/bin"
  run env GOBIN="$HOME/.local/bin" mise exec go@latest -- go install github.com/joshmedeski/sesh/v2@latest
}

set_default_shell_to_zsh() {
  local zsh_path=''
  local candidate=''

  for candidate in /bin/zsh /usr/bin/zsh "$(command -v zsh || true)"; do
    [[ -n "$candidate" ]] || continue
    [[ -x "$candidate" ]] || continue
    if grep -qx "$candidate" /etc/shells; then
      zsh_path="$candidate"
      break
    fi
  done

  if [[ -z "$zsh_path" ]]; then
    warn 'Nenhum caminho valido de zsh encontrado em /etc/shells; pulando chsh.'
    return
  fi

  local login_shell
  login_shell="$(getent passwd "$USER" | cut -d: -f7)"

  if [[ "$login_shell" == "$zsh_path" ]]; then
    info 'Shell padrao ja esta como zsh.'
    return
  fi

  info 'Definindo zsh como shell padrao (pode pedir senha)...'
  run chsh -s "$zsh_path" "$USER"
}

info 'Bootstrap Arch iniciado.'
install_pacman_packages "${PACMAN_PACKAGES[@]}"
stow_all_packages
ensure_oh_my_zsh
install_mise_tools
install_sesh_with_go
set_default_shell_to_zsh

info 'Concluido.'
info 'Reabra a sessao (ou rode: exec zsh) para carregar o shell novo.'
