{
    description = "Package and module sets for nayuta networking";

    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    inputs.flake-utils.url = "github:numtide/flake-utils";

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system: let
            pkgs = import nixpkgs {
                inherit system;
                overlays = [(self: super: {
                    inherit nixpkgs;
                })];
            };
        in {
            packages = {
                minimal-system = pkgs.callPackage ./minimal-system.nix {};
            };
        });
}
