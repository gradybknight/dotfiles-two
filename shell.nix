{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.neovim
    pkgs.ripgrep
    pkgs.tmux
    pkgs.tree
    pkgs.pure-prompt
    pkgs.fzf
    pkgs.jq
  ];
}

