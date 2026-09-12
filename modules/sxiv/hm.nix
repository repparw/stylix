{ config, lib, ... }:
let
  cfg = config.stylix.targets.sxiv;
  inherit (config.lib.stylix) colors;
  inherit (config.stylix) fonts;
in
{
  options.stylix.targets.sxiv.enable = config.lib.stylix.mkEnableTargetWith {
    name = "sxiv";
    autoEnable = config.stylix.targets.x11.enable;
    autoEnableExpr = "config.stylix.targets.x11.enable";
  };

  config = lib.mkIf (config.stylix.enable && cfg.enable) {
    xresources.properties = {
      "Sxiv.font" = "${fonts.sansSerif.name}-${toString fonts.sizes.applications}";
      "Sxiv.foreground" = "#${colors.base01}";
      "Sxiv.background" = "#${colors.base04}";
    };
  };
}
