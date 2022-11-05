{ config, pkgs, ... }:

{
  imports = [ ./users.nix ];

  # Nix/nixpkgs configuration
  nix.package = pkgs.nixUnstable;
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Tailscale / remote access
  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.openssh = {
    enable = true;
    openFirewall = false;
    passwordAuthentication = false;
    kbdInteractiveAuthentication = false;
  };

  networking.firewall.trustedInterfaces = [ config.services.tailscale.interfaceName ];
  networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];

  # Language, console, keyboard layout, time
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Etc/UTC";

  # Hardening
  boot.kernel.sysctl."kernel.unprivileged_bpf_disabled" = 1;

  # Anti-hardening
  security.sudo.wheelNeedsPassword = false;

  # Useful tools
  environment.systemPackages = with pkgs; [
    git
    pciutils
    tcpdump
    usbutils
    vim
  ];

  programs.mtr.enable = true;
}
