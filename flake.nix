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

    # lsp-nil = {
    #   url = "github:oxalica/nil";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };

  };

  outputs = { self, nur, ... }@inputs:
    let
      sharedHostsConfig = { config, pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;

          extraOptions = ''
            experimental-features = nix-command flakes
          '';

          settings.extra-trusted-substituters = [
            "https://nix-cache.status.im"
          ];

          settings.substituters = [
            "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=30"
            # "https://mirrors.ustc.edu.cn/nix-channels/store"
            "https://cache.nixos.org"
            # "https://nix-community.cachix.org"
            # "https://nixpkgs.cachix.org"
            # "https://nix-linter.cachix.org"
            # "https://statix.cachix.org"
            # "https://nix-community.cachix.org"
            # "https://cache.nixos.org"
            # "https://nixpkgs.cachix.org"
            # "https://zxfstd.cachix.org"
          ];

          settings.trusted-public-keys = [
            "nix-cache.status.im-1:x/93lOfLU+duPplwMSBR+OlY4+mo+dCN7n0mr4oPwgY="
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            # "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            # "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
            # "nix-linter.cachix.org-1:BdTne5LEHQfIoJh4RsoVdgvqfObpyHO5L0SCjXFShlE="
            # "statix.cachix.org-1:Z9E/g1YjCjU117QOOt07OjhljCoRZddiAm4VVESvais="
            # "zxfstd.cachix.org-1:3Q1gyqgA9NsOshOgknDvc6fhA8gw0PFAf2qs5vJpeLU="
          ];

          gc = {
            automatic = true;
            options = "--delete-older-than 10d";
          };
        };

        nixpkgs = {
          config = { allowUnfree = true; };
          overlays = [
            (
              final: prev: {
                unstable = inputs.nixpkgs-unstable.legacyPackages.${prev.system}; # Make available unstable channel.
                # lsp-nil = inputs.lsp-nil.packages.${prev.system}.default;
              }
            )
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
            ./machines/tony.nix
            ./profiles/darwin
          ];
        };
        addsa = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.homemanager.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            sharedHostsConfig
            ./profiles/modules/darwin
            ./machines/addsa.nix
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
            ./machines/vvh.nix
            ./profiles/darwin
          ];
        };
      };

      devShell =
        let
          mkDevShell = arch:
            let pkgs = inputs.unstable.legacyPackages."${arch}";
            in
            pkgs.mkShell {
              buildInputs = [
                # inputs.lsp-nil.packages."${arch}".nil
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
      addsa = self.darwinConfigurations.addsa.system;

      nixosConfigurations = {
        "nixos" = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            ./profiles/modules/shared
            sharedHostsConfig
            ./machines/nixos
          ];
        };
      };
    };
}
