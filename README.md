## About

This repository provides the minimal settings which gives to minos its identity. It's intend to be installed in all environments, even environments without graphic interface. Some of these changes affect:

- Skel default files:
 - `.bash_profile` (add gpg-agent/tmux autolaunchers)
 - `.aliases` (replace cd, rm and other core system applications with minos wrappers)
 - `.profile.d/shundle.sh` (shundle integration)
 - `.tmux.conf` (tmux/tundle integration)
 - `.vimrc` (default vim configuration)

- Sudo settings:
 - turn on sudo insults
 - set a longer (1hr) timeout
 - add subgroups to bypass password authentication for shutdown/hibernate/wakeup ...

- Bash
 - advanced bash settings and 'vi' as default readline mode

## Quick start

### On Ubuntu (only LTS releases)

1. Set up the minos archive:

   ```
   $ sudo add-apt-repository ppa:minos-archive/main
   ```

2. Install:

   ```
   $ sudo apt-get update && sudo apt-get install minos-core-settings
   ```

3. Enjoy ☺!

## Feedback

Please drop me an [email](mailto:m@javier.io) with your suggestions or open [an issue](https://github.com/minos-org/bash-minos-settings/issues) with your comments.
