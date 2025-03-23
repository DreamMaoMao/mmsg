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

  src = ./.;

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
    description = "Maomaowm ipc client";
    homepage = "https://github.com/DreamMaoMao/mmsg";
    maintainers = with lib.maintainers; [ ];
    mainProgram = "mmsg";
    platforms = lib.platforms.all;
  };
}
