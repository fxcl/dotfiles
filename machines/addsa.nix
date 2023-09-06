{ config, pkgs, lib, inputs, ... }: {

  nix = {
    gc = { user = config.my.username; };
    # Auto upgrade nix package and the daemon service.
    # services.nix-daemon.enable = true;
    # nix.package = pkgs.nix;
    # nix.maxJobs = 4;
    # nix.buildCores = 4;
  };

  my = {
    modules = {
      # macos.enable = true;
      # gpg.enable = true;
    };
  };

  homebrew.casks = [
    # "arq" # I need a specific version so I will handle it myself.
    # "transmit"
    # "jdownloader"
    # "signal"
  ];

  networking = {
    hostName = "addsa";
    computerName = "addsa";
  };

  system.stateVersion = 4;
}
