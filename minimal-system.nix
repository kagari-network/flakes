{ pkgs, lib, system, ...}: (pkgs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [{
        documentation.enable = false;
        boot.isContainer = true;
        users.users.root.password = "test";
        system.stateVersion = "22.05";
    }];
}).config.system.build.toplevel