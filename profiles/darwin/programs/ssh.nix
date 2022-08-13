{ pkgs, ... }:

{
  enable = true;
  serverAliveInterval = 20;

  matchBlocks = {
    "bous" = {
      hostname = "bous.kleister.tech";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "github.com" = {
      hostname = "github.com";
      identityFile = "~/.ssh/github_rsa";
    };
    "haas.hackclub.com" = {
      hostname = "haas.hackclub.com";
      identityFile = "~/.ssh/old_haas_rsa";
    };
  };
}
