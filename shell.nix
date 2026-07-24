let
  # nixpkgs-unstable, pinned 2026-03-16 to match the Zamlet projects.
  nixpkgs = fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/a07d4ce6bee67d7c838a8a5796e75dff9caa21ef.tar.gz";
  pkgs = import nixpkgs {
    config.allowUnfreePredicate = pkg: (pkg.pname or "") == "drawio";
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    hugo
    drawio
    gnumake
    (builtins.getAttr "xvfb-run" pkgs)
  ];

  shellHook = ''
    echo "Notes development environment"
    echo "  Hugo:    $(hugo version | head -1)"
    echo "  Draw.io: available for diagram exports"
    echo ""
    echo "Run 'make serve' to preview the site."
    echo ""
  '';
}
