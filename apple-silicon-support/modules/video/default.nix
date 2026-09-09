{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.hardware.asahi;
in
{
  config = lib.mkIf (cfg.enable && cfg.avd.enable) {
    hardware.firmware = [
      pkgs.avd-fw
    ];
  };

  options.hardware.asahi.avd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.hardware.asahi.enable;
      description = ''
        Setup the firmware required for the Apple Video Decoder to work properly.
      '';
    };
  };
}
