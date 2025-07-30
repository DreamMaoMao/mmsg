{
  lib,
  pkg-config,
  wayland,
  wayland-scanner,
  stdenv,
}:
stdenv.mkDerivation {
  pname = "mmsg";
  version = "nightly";

  src = builtins.path {
    path = ./.;
    name = "source";
  };

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland
  ];

  installPhase = ''
    install -D mmsg $out/bin/mmsg
  '';

  meta = {
    description = "Mango ipc client";
    homepage = "https://github.com/DreamMaoMao/mmsg";
    maintainers = [];
    mainProgram = "mmsg";
    platforms = lib.platforms.all;
  };
}
