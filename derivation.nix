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
    wget --recursive --page-requisites --convert-links --no-parent --continue --adjust-extension http://127.0.0.1:4000/en/|| true
    mkdir $out
    lndir ${frontend}/browser $out
    (cd "127.0.0.1:4000" && find . -type f -name '*.html' -exec bash -c '(mkdir -p ${placeholder "out"}/$(dirname {}) && mv {} ${placeholder "out"}/{})' \;)
    (cd "127.0.0.1:4000" && find . -type f -name '*.css' -exec bash -c '(mkdir -p ${placeholder "out"}/$(dirname {}) && mv {} ${placeholder "out"}/{})' \;)
    mv "127.0.0.1:8080" $out
    find $out -type f -name '*.js' -delete
  '';
}
