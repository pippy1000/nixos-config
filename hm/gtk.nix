{ config, pkgs, ... }:
{
    gtk = {
        enable = true;
        theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
        };
        iconTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
        };
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
        gtk4 = {
            theme = null;
            extraConfig = {
                gtk-application-prefer-dark-theme = true;
            };
        };
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };
}
