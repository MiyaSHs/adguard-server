{ config, pkgs, lib, ... }:
{
  services.adguardhome = {
    enable = true;
    mutableSettings = true;
    openFirewall = true;
    allowDHCP = true;
  };
}
