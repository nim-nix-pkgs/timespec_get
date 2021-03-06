{
  description = ''Nanosecond-percision time using timespec_get'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."timespec_get-master".dir   = "master";
  inputs."timespec_get-master".owner = "nim-nix-pkgs";
  inputs."timespec_get-master".ref   = "master";
  inputs."timespec_get-master".repo  = "timespec_get";
  inputs."timespec_get-master".type  = "github";
  inputs."timespec_get-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."timespec_get-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}