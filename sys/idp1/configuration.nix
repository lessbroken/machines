{ pkgs, ... }:

{
  imports = [
    ./generated.nix
    ../common/common.nix
  ];

  networking.hostName = "idp1";

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking.interfaces.ens32.useDHCP = true;

  system.stateVersion = "22.05";
};
