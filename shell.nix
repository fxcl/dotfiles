{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nixpkgs-fmt
    rnix-lsp
    gnumake
    nixUnstable
  ];
}
