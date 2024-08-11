{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";

    website = {
      url = "github:dd-ix/website";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    website-content-api = {
      url = "github:dd-ix/website-content-api";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, flake-utils, website, website-content-api, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = (import nixpkgs) {
            inherit system;
            overlays = [
              website.overlays.default
              website-content-api.overlays.default
            ];
          };
        in
        {
          packages = rec {
            preview = pkgs.callPackage ./derivation.nix {};
            default = preview;
          };
        }
      );
}
