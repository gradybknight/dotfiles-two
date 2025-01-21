{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "grady-tools";
      paths = [
        neovim
        ripgrep
        tmux
        tree
        pure-prompt
        fzf
        jq
        # nodejs_22
      ];
    };
  };
}

