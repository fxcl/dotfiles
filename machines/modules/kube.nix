{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.kube;

in

{
  options = with lib; {
    my.modules.kube = {
      enable = mkEnableOption ''
        Whether to enable kube module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          argocd
          # helm
          helm-docs
          jsonnet
          jsonnet-bundler
          k9s
          krew
          kubectl
          kustomize
          kustomize-sops
          stern
        ];
      };
    };
}
