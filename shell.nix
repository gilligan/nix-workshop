{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [ pkgs.hello ];
  shellHook = ''
    echo "Welcome!"
  '';
}
