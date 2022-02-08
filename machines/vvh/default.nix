{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules
  ];

  networking = {
    hostName = "vvh";
    computerName = "Lcfijvvh";
  };

  system = {
    stateVersion = 4;
  };
}
