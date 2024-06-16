{ lib, ... }:
let
  # Define the function to get .nix files excluding default.nix
  getNixFiles = files: builtins.filter (file: lib.hasSuffix ".nix" file && file != "default.nix") files;

  # Get the list of relevant .nix files
  nixFiles = getNixFiles (builtins.attrNames (builtins.readDir ./.));
in
{
  # Use the list of nix files in imports
  imports = builtins.map (file: "${./.}/${file}") nixFiles;
}
