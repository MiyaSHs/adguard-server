{
  inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    username = "dnsman";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      server = lib.nixosSystem {
        inherit system;
        specialArgs = { host="${username}"; inherit inputs username; };
        modules = [ 
	  (import ./main)
	];
      };
    };
  };
}
