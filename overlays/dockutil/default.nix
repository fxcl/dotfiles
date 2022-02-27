{ lib, stdenv, fetchurl, libarchive, p7zip }:
with lib;

stdenv.mkDerivation rec {
  pname = "dockutil";
  version = "3.0.0b2";
  versions = "3.0.0-beta.2";

  src = fetchurl {
    url = "https://github.com/kcrawford/dockutil/releases/download/${version}/dockutil-${versions}.pkg";
    sha256 = "sha256-IaO+sQVqB5niT2xm2COK8N30KYgF5Ak5WGX+PQhwiFk=";
  };

  dontBuild = true;
  nativeBuildInputs = [ libarchive p7zip ];

  unpackPhase = ''
    7z x $src
    bsdtar -xf Payload~
  '';

  installPhase = ''
    mkdir -pv $out/bin
    cp "usr/local/bin/dockutil" "$out/bin/dockutil"
  '';

  meta = {
    description = "Tool for managing dock items";
    homepage = "https://github.com/kcrawford/dockutil";
    license = licenses.asl20;
    maintainers = [ "zxfstd" ];
    platforms = platforms.darwin;
  };
}
