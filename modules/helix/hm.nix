{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.stylix.targets.helix.enable =
    config.lib.stylix.mkEnableTarget "Helix" true;

  config =
    lib.mkIf
      (
        config.stylix.enable
        && config.stylix.targets.helix.enable
        && config.programs.helix.enable
      )
      {
        programs.helix = {
          settings.theme = "stylix";

          themes.stylix =
            let
              theme = config.lib.stylix.colors {
                templateRepo = config.stylix.inputs.base16-helix;
              };

              # Removing the background exposes transparency from the terminal. The
              # background might be helpful if the terminal isn't themed, so we only
              # do this if transparency is actually enabled.
              transparentTheme = pkgs.runCommandLocal "helix-transparent.toml" { } ''
                sed 's/,\? bg = "base00"//g' <${theme} >$out
              '';
            in
            if config.stylix.opacity.terminal == 1.0 then theme else transparentTheme;
        };
      };
}
