{
  description = "Lessbroken machine configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs }: let
    mkSystem = (module: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ module ];
    }); in {
    nixosConfigurations = {
      idp1 = mkSystem ./sys/idp1/configuration.nix;
    };
  };
}
