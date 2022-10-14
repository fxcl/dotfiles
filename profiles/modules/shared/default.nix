{ pkgs, lib, config, options, ... }:

{

  imports = [
    ./settings.nix
    ./nix.nix
    ./shells.nix
    ./sudoers.nix
    # ./fonts.nix
    ./gui.nix
    ./git.nix
    ./gpg.nix
    ./vim.nix
    ./java.nix
    ./node.nix
    ./rust.nix
    ./go.nix
    ./mysql.nix
    ./cc.nix
    ./kube.nix
    ./python.nix
  ];

  my.modules = {
    nix.enable = lib.mkDefault true;
    shells.enable = lib.mkDefault true;
    sudoers.enable = lib.mkDefault true;
    # fonts.enable = lib.mkDefault true;
    gui.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    gpg.enable = lib.mkDefault true;
    vim.enable = lib.mkDefault true;
    java.enable = lib.mkDefault true;
    node.enable = lib.mkDefault true;
    rust.enable = lib.mkDefault true;
    go.enable = lib.mkDefault true;
    mysql.enable = lib.mkDefault true;
    cc.enable = lib.mkDefault true;
    kube.enable = lib.mkDefault false;
    python.enable = lib.mkDefault false;
  };
}
