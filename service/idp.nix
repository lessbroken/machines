{ pkgs, config, ... }: {
  environment.systemPackages = [ pkgs.glauth ];

  security.acme.certs = {
    idp-ldaps = {
      domain = "ldap.idp.lessbroken.org";
      reloadServices = [ "lessbroken-idp" ];
    };
  };

  systemd.services.lessbroken-idp = {
    script = ''
      . $CREDENTIALS_DIRECTORY/aws-idp
      export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
      ${pkgs.glauth}/bin/glauth -r us-east-2 -c s3://lessbroken-infrastructure/glauth.conf --ldap [::1]:9389 --ldaps [::]:9636 --ldaps-cert $CREDENTIALS_DIRECTORY/cert --ldaps-key $CREDENTIALS_DIRECTORY/key
    '';

    serviceConfig = {
      DynamicUser = "yes";

      LoadCredential = let base = config.security.acme.certs.idp-ldaps.directory; in [
        "key:${base}/key.pem"
        "cert:${base}/fullchain.pem"
        "aws-idp:/var/secrets/glauth-s3"
      ];
    };

    after = [ "acme-finished-idp-ldaps.target" ];
    wantedBy = [ "multi-user.target" ];
  };

  networking.firewall.allowedTCPPorts = [ 9636 ];
}
