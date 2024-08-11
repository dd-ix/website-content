{ lib, stdenv, nodejs, wget, website, website-content-api, xorg, ... }:

let
  frontend = website.override {
    contentApi = "http://127.0.0.1:8080";
  };
in
stdenv.mkDerivation {
  name = "website-content-preview";

  src = lib.cleanSource ./.;

  nativeBuildInputs = [
    nodejs
    wget
    website-content-api
    xorg.lndir
  ];

  buildPhase = ''
    foundation --content-directory ./content/ &
    APP_DIR=${frontend} node ${frontend}/server.mjs &
    sleep 1
    mkdir data
    wget --recursive --page-requisites --no-parent --convert-links --continue --adjust-extension http://127.0.0.1:4000/ || true
    find '127.0.0.1:4000' -type f -iname '*.js' -delete
    mv '127.0.0.1:4000' $out
  '';
}
