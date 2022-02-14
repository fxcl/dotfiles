{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./homebrew.nix
    ./fonts.nix
    ./kube.nix
    ./nix.nix
    ./shells.nix
    ./sudoers.nix
    ./tools.nix
    ./rust.nix
  ];

  my.modules = {
    homebrew.enable = true;
    fonts.enable = true;
    nix.enable = true;
    shells.enable = true;
    sudoers.enable = true;
    tools.enable = true;
    kube.enable = true;
    rust.enable = true;
  };
}
