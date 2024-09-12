{ config, pkgs, lib, ... }: 
{
  networking = {
    hostName = "dnsbox";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedUDPPorts = [];
      allowedTCPPorts = [];
    };
  };
}
