{
  inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    username = "miya";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        inherit system;
        specialArgs = { host="${username}"; inherit inputs username; };
        modules = [ 
	  (import ./main)
	];
      };
    };
  };
}
