{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, ... }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
	        pkgs.neovim
	        pkgs.ripgrep
	        pkgs.tmux
	        pkgs.starship
	        pkgs.stow
	        pkgs.gh
	        pkgs.tree
          pkgs.nodejs_22
          pkgs.jq	
          pkgs.pure-prompt
          pkgs.fzf
          pkgs.devpod
          pkgs.docker
          pkgs.colima
          pkgs.pipx
          pkgs.virtualenv
        ];

      # Symlink Nix Apps to /Applications to make Spotlight index them
      environment.pathsToLink = [
        "/Applications"
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.enableSudoTouchIdAuth = true;
      
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToEscape = true;


      system.defaults = {
        finder.AppleShowAllExtensions = true;
	      finder.AppleShowAllFiles = true;
	      finder.FXPreferredViewStyle = "clmv";
        controlcenter.Sound = true;
        controlcenter.Bluetooth = true;
      	dock.orientation = "left";
        dock.appswitcher-all-displays = true;
	      dock.autohide = true;
	      dock.minimize-to-application = true;
	      dock.mru-spaces = false;
	      dock.persistent-apps = [
	        "/Applications/Safari.app"
          "/Applications/Alacritty.app"
          "/Applications/Slack.app"
	      ];
	      dock.persistent-others = [
	        "/Users/grknight/Desktop/"
	        "/Users/grknight/Downloads/"
	      ];
        dock.show-recents = false;
      };


       # Homebrew needs to be installed on its own!
      homebrew.enable = true;
      homebrew.casks = [
        "discord"
        "alacritty"
        "nikitabobko/tap/aerospace"
        "anylist"
        "font-fira-code-nerd-font"
        "font-fira-code"
        "visual-studio-code"
        # These are disabled for work computer:
        # "google-chrome"
        # "whatsapp"
        "freecad"
        "orcaslicer"
      ];
      homebrew.brews = [
        "git-lfs"
        "akamai"
      ];

    };
  in
  {
    # darwinConfigurations."Gradys-MacBook-Air" = nix-darwin.lib.darwinSystem {
    # ^^Personal macbook

    darwinConfigurations."grknight-mac" = nix-darwin.lib.darwinSystem {
    # ^^Redhat macbook
      modules = [
        configuration
      ];
      # modules = [ configuration ];
    };
  };
}
