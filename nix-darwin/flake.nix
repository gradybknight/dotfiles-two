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
      environment.etc."fonts/FiraCode".source = "${pkgs.fira-code}/share/fonts";
      environment.systemPackages =
        [
	  pkgs.neovim
	  pkgs.wezterm
	  pkgs.ripgrep
	  pkgs.tmux
	  pkgs.starship
	  pkgs.stow
	  pkgs.aerospace
	  pkgs.gh
	  pkgs.alacritty
	  pkgs.tree
    pkgs.nodejs_22
    pkgs.fira-code	
    pkgs.jq	
    pkgs.pure-prompt
    pkgs.fzf
    pkgs.fontconfig
    # pkgs.sketchybar
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
	      ];
	      dock.persistent-others = [
	        "/Users/gradydev/Desktop"
	      ];
        dock.show-recents = false;
      };

       # Homebrew needs to be installed on its own!
      homebrew.enable = true;
      homebrew.casks = [
	     #  "wireshark"
      ];
      # homebrew.brews = [
	     #  "imagemagick"
      # ];

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Air-2
    darwinConfigurations."MacBook-Air-2" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
      ];
      # modules = [ configuration ];
    };
  };
}
