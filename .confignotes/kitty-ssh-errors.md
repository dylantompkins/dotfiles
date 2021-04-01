# Kitty SSH Errors

Kitty can sometimes introduce errors when ssh-ing because the remote does not have the kitty terminfo. Here's a couple solutions to try:

- add `alias ssh="kitty +kitten ssh"` to `.bashrc` which will make kitty automatically copy its terminfo to the remote

- install the `kitty-terminfo` package on the remote
  
  - I had to install the package on the raspberry pi because the alias still didn't allow me to `sudo nano`. Seems like Ubuntu 20.04 may have made this required

## Resources

[Frequently Asked Questions &#8212; kitty 0.19.3 documentation](https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer)

[Error opening terminal: xterm-kitty · Issue #1613 · kovidgoyal/kitty · GitHub](https://github.com/kovidgoyal/kitty/issues/1613)
