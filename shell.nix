{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nixpkgs-fmt
    rnix-lsp
    gnumake
    nixUnstable
    stdenv.cc.cc.lib
  ];
  RUST_BACKTRACE = "1";
  # https://github.com/rust-lang/rust/issues/55979
  LD_LIBRARY_PATH = lib.makeLibraryPath (with pkgs; [ stdenv.cc.cc.lib ]);
  # Avoids issues with delve
  CGO_CPPFLAGS = "-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0";
}
