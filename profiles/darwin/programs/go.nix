{ pkgs, ... }:

{
  enable = true;
  package = pkgs.go_1_17;
  #goPath = "Golang";
  #goBin = "Golang/bin";
  goPath = "${builtins.getEnv "HOME"}/workspace/go";
  goBin = "${builtins.getEnv "HOME"}/workspace/go/bin";

  # add delve to system packages
}
