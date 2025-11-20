{
  description = "Giraffic Jams Site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: let 
    system = "x86_64-linux"; 
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = self.site;
    site = pkgs.stdenv.mkDerivation {
      pname = "giraffic-jams-site";
      version = "0.0.1";

      src = ./site;

      installPhase = ''
        mkdir -p $out
        cp -r ./* $out/
      '';
    };
  };
}
