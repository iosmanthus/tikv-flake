# Nix Flake for TiKV

TiKV project has plenty of build methods including Dockerfile, Makefile, ... which will increase the maintenance cost of maintainers. So I create this repository to wrap the TiKV project with nix flake.

## Usage
```sh
# If you want to clone the repository and pull the submodules.
git clone --recursive git@github.com:iosmanthus/tikv-flake.git

# If you clone this repo without --recursive
git clone git@github.com:iosmanthus/tikv-flake.git
git submodule update --recursive --init

# If you want to update the submodules
git submodule update --recursive --remote

nix develop
cd tikv
# Happy coding
```