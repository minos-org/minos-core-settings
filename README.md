## About

This repository provides minimal settings which gives to minos its identity. It's intend to be installed in all environments, even those without graphic interface. Some of the changes affect:

- Skel default files:
 - `.bash_profile`: add gpg-agent/tmux autolaunchers
 - `.aliases`: replace cd, rm and other core system applications with minos wrappers
 - `.profile.d/shundle.sh`: shundle integration
 - `.tmux.conf`: tmux/tundle integration
 - `.vimrc`: vim configuration

- Sudo settings:
 - turn on sudo insults
 - set a longer (1hr) timeout
 - bypass password authentication for shutdown/hibernate/wakeup

- Ssh:
 - connection sharing, improve performance and general resiliance

- Bash
 - autocompletion enhancement
 - 'vi' as default readline mode

- Motd
 - modify message of the day and other personality files

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
