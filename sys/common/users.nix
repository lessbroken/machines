{ ... }: {
  users.users = {
    tris = {
      uid = 2001;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        # YubiKey
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCXEShUcOG0aNtI8+ZydcGJY7VPS6P35BohbM68cHyvvwK7+PKlPcloTfidHOaTTveD/5vMB9jKAuuY6uKAWJM5a6CNdS77+9ugeaCFDLc7I82eY+STXX8UehUi78LB0s3qOULvYpGvZIwG7Oz8L2O58ZJkeUgv+3r675m7ejaNOK15OeHL51xkZ/fn6C5T6EqkHxwjgWYUZTqRCLGb4nynnjcnMIzh0croSatEr8vmKa6eGwfbaEnLMJ4E7QY+JYD/H4X0QjmDqFUhTxeZ2gyvR5GOTVVuMe1047LcU/qv65zNDc96raPAGeNeC1h2c3e4rgUtl8KNuDo99aovItreJv6CuLBAgC5ZAsgwDl6qH03ahhVAyr7kdR0/4lTXYyOFnkKgnXcLu3GQtfb71rhTef+RbDKyMTcw2gOaTcn44hDJGGOWKce+a91CTIRlBEYj5/baiwesg5XP5loKjAqnP1smXnLLHvJBZawHU6qaS86PxxH1E26xGcYW1mdliS1O7U6odfkvPWZNumPFLP+nDUElsUTySrE0w0AOWLGRD8guGdhUh34RpTjcbnVSzfILciKIrEnYIThHJz1/AosUoVw3vPsO5/HFdz6VDHjZEoRzqG6RWLBa6lMtUE218c0HNMK8nuwPCciXOibnGzKYIKxIUCQs9sPtYpaJQMFZtQ=="

        # dripleaf TPM
        "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLQkbAMhZuf7qXNrqx61sNU/34RdBamkePfkbK39x6tR3FRkfdsrc5ySgXYoObbNeJSDYRbPwUd/IXuOdvPQPtk="
      ];
    };

    hunter = {
      uid = 2002;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBG8RmADAb6jH4agL6YUn0PiDVRJhKWds1P433m0N//8ExPsgdw02eJz40HVJtTOsUhXOA+3/6I0PC91wmbDUCkq+32cD8qYQQxXzAhqHgKsGECqvmfufn30Y2zrLR3loQMDtTojrgHExS33rO6/GnpLSUaQZ3XTmXzXaXryJDlPAeEpboabTQs29JnEvfK5Xv5grpKLHthJ4xw/hPqNSPqS3zQWdGdl71TSfopmNM1Wg0RAhgP4mHgfbPqXFpvnKtCpYfVSao49QDJck5D+KHNhFrkegVFHSSJ9rdjksUUP0ZBlQPlQeQsjLCLx7EWjgJ6gU23maDaJ6Ra82CSVxH"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCX9aJvPUip/RKOQl8kftHjTfrR/OoKRkeY1lv8oPro+JrBWVW01gqNSUgsDuVF5Aj8tvVeAXvDdnYo00IaQG/WTeQNOrCyeyKzU+iAvtpiLM4O7EG0i5xhP2doXIm5fM/IWg1DlF3yfzWLCnGnSClCYCxK91u3RItOSJs0qDDtTTpAgX5jUYBfMNIfKfHJsy3e9uwHBLty7KOqGbrfGcJfkylyYf21v3SwcW+SZ1yZXggpALTBzfraBL/T6qZYDA3D7HWVWhnxbWUNrdIbAwYZWcCZXwFG8+bWjOw7zn5O6TleMnzjVfHGbltNUaQUJlUTMWCQ7X0oVXDkT9E3nhlt"
      ];
    };
  };
}
