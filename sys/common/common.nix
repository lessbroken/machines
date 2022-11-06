{ config, pkgs, ... }:

{
  imports = [ ./users.nix ];

  # Nix/nixpkgs configuration
  nix.package = pkgs.nixUnstable;
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    trusted-users = @wheel
  '';

  # Remote access
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    kbdInteractiveAuthentication = false;
  };

  networking.firewall.allowedTCPPorts = [ 22 ];

  # Certs
  security.acme.acceptTerms = true;
  security.acme.defaults = {
    email = "infra@lessbroken.org";
    dnsProvider = "route53";
    credentialsFile = "/var/secrets/acme-route53";
  };

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
