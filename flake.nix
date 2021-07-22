{
  description = "Distributed transactional key-value database, originally created to complement TiDB";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (
        system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
            fork = "git@github.com:iosmanthus/tikv.git";
            upstream = "git@github.com:tikv/tikv.git";
          in
            {
              devShell = pkgs.mkShell {
                hardeningDisable = [ "all" ];
                nativeBuildInputs = with pkgs;[ cmake ];
                buildInputs = with pkgs;[ zsh git gnumake rustup protobuf3_8 perl ];
                PROTOC = "${pkgs.protobuf3_8}/bin/protoc";
                shellHook = ''
                  if [ ! -d "tikv" ]; then
                    git clone ${fork}
                    git remote add upstream ${upstream}
                  fi
                '';
              };
            }
      );
}
