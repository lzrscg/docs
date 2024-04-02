let
  pkgs = import <nixpkgs> {};

in
pkgs.mkShell {
  name = "modularcloud";

  buildInputs = with pkgs; [
    nodejs_20
    nodePackages.npm
  ];

  shellHook = ''
    export NPM_CONFIG_PREFIX=~/.npm-global
    mkdir -p ~/.npm-global
    npm config set prefix '~/.npm-global'
    npm install -g mintlify
    export PATH=~/.npm-global/bin:$PATH
  '';
}