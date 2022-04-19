{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  pname = "intellij-idea";
  version = "2021.2";

  buildInputs = [ undmg];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p "$out/Applications"
    cp -r IntelliJ\ IDEA.app "$out/Applications/IntelliJ IDEA.app"
  '';

  src = fetchurl {
    name = "ideaIU-${version}.dmg";
    url = "https://download-cdn.jetbrains.com/idea/ideaIU-${version}.dmg";
    sha256 = "wj7p9oq71QPlAZx0XMW/KjCPgejCu9IQzPr7wRJMHlk=";
  };

  meta = {
    description = "Jetbrains";
    homepage = "https://www.jetbrains.com/idea/";
    maintainers = [ maintainers.zxfstd ];
    platforms = platforms.darwin;
  };
}
