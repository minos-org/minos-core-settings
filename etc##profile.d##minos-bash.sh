#This file is part of the minos-core-settings package

#===============================================================================
#================================= General =====================================
#===============================================================================

#do nothing if not running interactively
[ -z "${PS1}" ] && return

set -o vi #this is sparta!
stty -ctlecho #don't show ^C when pressing Ctrl+C

#http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[ "${BASH_VERSINFO}" -ge "4" ] && shopt -s autocd cdspell dirspell
shopt -s checkhash checkwinsize cmdhist expand_aliases histreedit mailwarn
shopt -s hostcomplete histappend histverify

bind "set match-hidden-files off"     #don't match hidden files
bind "set bind-tty-special-chars on"  #punctuations are not word delimiters
bind "set show-all-if-ambiguous on"   #enable single tab completion
bind "set completion-ignore-case on"

if [ -z "${BASH_COMPLETION_VERSINFO-}" ] && ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

#/etc/terminfo/*
#export TERM="xterm-color"
#export TERM="xterm-256color"

#===============================================================================
#=============================== Environment  ==================================
#===============================================================================

[ -d "$HOME/bin" ]        && export PATH="${HOME}/bin:${PATH}"
[ -d "$HOME/.local/bin" ] && export PATH="${HOME}/.local/bin:${PATH}"
[ -d "$HOME/.bin" ]       && export PATH="${HOME}/.bin:${PATH}"

export GPG_TTY="$(tty)"

export EDITOR="editor"
export CSCOPE_EDITOR="$EDITOR"
export BROWSER="x-www-browser"

#fix java ugliness
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

if command -v "ccache" >/dev/null 2>&1; then
    export PATH="${PATH}:/usr/lib/ccache"
    export CCACHE_DIR="${HOME}/.ccache"
    export CCACHE_SIZE="2G"
fi

