{ mkTarget, ... }:
mkTarget {
  # Home Manager has no sxiv/nsxiv module which can provide an auto-enable
  # guard. Enabling this target unconditionally would create ~/.Xresources even
  # when neither program is installed.
  autoEnable = false;

  config = [
    ({ fonts }: {
      xresources.properties."Sxiv.font" =
        "${fonts.sansSerif.name}-${toString fonts.sizes.applications}";
    })
    ({ colors }: {
      xresources.properties = {
        "Sxiv.foreground" = "#${colors.base01}";
        "Sxiv.background" = "#${colors.base04}";
      };
    })
  ];
}
