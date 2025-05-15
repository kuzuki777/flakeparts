{ host, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "24.11";
  networking.hostName = host;
}
