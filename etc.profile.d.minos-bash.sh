#This file is part of the minos-core-settings package

#===============================================================================
#================================= General =====================================
#===============================================================================

#do nothing if not running interactively
[ -z "${PS1}" ] && return

set -o vi     #this is sparta!
stty -ctlecho #don't show ^C when pressing Ctrl+C

#http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[ "${BASH_VERSINFO}" -ge "4" ] && shopt -s autocd cdspell dirspell
shopt -s checkhash checkwinsize cmdhist expand_aliases histreedit mailwarn
shopt -s hostcomplete histappend histverify

bind "set match-hidden-files off"    #don't match hidden files
bind "set bind-tty-special-chars on" #punctuations are not word delimiters
bind "set show-all-if-ambiguous on"  #enable single tab completion
bind "set completion-ignore-case on"

#===============================================================================
#=============================== Environment  ==================================
#===============================================================================

export PATH="/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/games"
export GPG_TTY="$(tty)"
export EDITOR="editor"
export CSCOPE_EDITOR="editor"
export WCDHOME="${HOME}/.wcd"
export BROWSER="x-www-browser"

#fix java ugliness
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

if [ -f "$(command -v "ccache")" ]; then
    export PATH="${PATH}:/usr/lib/ccache"
    export CCACHE_DIR="${HOME}/.ccache"
    export CCACHE_SIZE="2G"
    #export CCACHE_PREFIX="distcc"
fi
