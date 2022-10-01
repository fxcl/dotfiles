{
  description = "NixOS and Darwin configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/22.05"; # Default to stable for most things.
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # Unstable for some packages.

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # MacOS inputs
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs"; # Ensure versions are consistent.

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    # Home inputs
    homemanager.url = "github:nix-community/home-manager/release-22.05";
    homemanager.inputs.nixpkgs.follows = "nixpkgs"; # Ensure versions are consistent.

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lsp-nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

  };

  outputs = { self, nur, ... }@inputs:
    let
      sharedHostsConfig = { config, pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;

          extraOptions = ''
            experimental-features = nix-command flakes
          '';

          settings.substituters = [
            "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
            "https://cache.nixos.org"
            "https://nix-community.cachix.org"
            "https://nixpkgs.cachix.org"
            #"https://zxfstd.cachix.org"
          ];

          settings.trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
            #"zxfstd.cachix.org-1:3Q1gyqgA9NsOshOgknDvc6fhA8gw0PFAf2qs5vJpeLU="
          ];

          gc = {
            automatic = true;
            options = "--delete-older-than 3d";
          };
        };

        nixpkgs = {
          config = { allowUnfree = true; };
          overlays = [
            (
              final: prev: {
                unstable = inputs.nixpkgs-unstable.legacyPackages.${prev.system}; # Make available unstable channel.
                lsp-nil = inputs.lsp-nil.packages.${prev.system}.default;
              }
            )
            #(final: prev: { inherit (inputs.nil.packages.${prev.system}) nil; })
            self.overlay

            # Access to NUR.
            nur.overlay

            # Rust overlay for them ease of setting up Rust toolchains.
            inputs.rust-overlay.overlays.default
          ];
        };
      };
    in
    {
      overlay = import ./overlays;

      darwinConfigurations = {
        tony = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.homemanager.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            sharedHostsConfig
            ./profiles/modules/shared
            ./profiles/modules/darwin
            ./machines/tony
            ./profiles/darwin
          ];
        };
        vvh = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.homemanager.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            sharedHostsConfig
            ./profiles/modules/shared
            ./profiles/modules/darwin
            ./machines/vvh
            ./profiles/darwin
          ];
        };
      };

      devShell =
      let
        mkDevShell = arch:
          let pkgs = inputs.unstable.legacyPackages."${arch}";
          in pkgs.mkShell {
            buildInputs = [
              #pkgs.sumneko-lua-language-server
              inputs.lsp-nil.packages."${arch}".nil
            ];
          };
      in
      {
        "x86_64-darwin" = mkDevShell "x86_64-darwin";
        "aarch64-darwin" = mkDevShell "aarch64-darwin";
        "x86_64-linux" = mkDevShell "x86_64-linux";
        "aarch64-linux" = mkDevShell "aarch64-linux";
      };

      tony = self.darwinConfigurations.tony.system;
      vvh = self.darwinConfigurations.vvh.system;
    };
}
