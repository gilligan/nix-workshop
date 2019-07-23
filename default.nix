{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation {
  name = "silly-hello";
  version = "1.0";
  src = ./.;

  buildInputs = [ bash makeWrapper cowsay gnugrep ];
  buildPhase = "";

  installPhase = ''
    mkdir -p $out/bin
    cp ./hello $out/bin/silly-hello
    chmod +x $out/bin/silly-hello
    wrapProgram $out/bin/silly-hello --prefix PATH : ${lib.makeBinPath [ cowsay ]}
  '';
}
