{ host, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "25.11";
  networking.hostName = host;
}
