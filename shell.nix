{ pkgs ? import (fetchTarball channel:nixos-unstable ) {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.swiProlog
    pkgs.emacs
  ];
}
