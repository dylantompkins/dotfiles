# Configuring LightDm and Greeters

Configuration files are located at `/etc/lightdm` with separate `.conf` files for LightDM as a whole and individual greeters. They're well documented. A couple edits I made:

- Copied my `xrandr` command for display configuration from `~/.xprofile` and placed it in `lightdm.conf` as the `display-setup-script`. This keeps the login page on my primary screen, and orients the monitors correctly so moving my mouse makes more sense.

- `lightdm-webkit2-greeter.conf` was refrencing some pictures which did not exist. Resolving this made obvious holes in th UI go away.
