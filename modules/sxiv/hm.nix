{ mkTarget, ... }:
mkTarget {
  # There is no Home Manager module for sxiv/nsxiv, so there is no reliable
  # enable option to use as an installation guard.
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
