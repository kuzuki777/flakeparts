[
  {
    host = "nixos";
    user = "mark";
    #extraOSModules = [ ./nixos/os.nix ];
    #extraHomeModules = [ ./nixos/homenew.nix ];
    extraHomeArgs = {
      nixosVersion = "unstable";
      homeManagerVersion = "master";
    };
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDU8FwzRIEkhjHenhZxbccnl9m31lU9lkSSv8njm7QF1 markwangfreetyle@gmail.com";
  }
]
