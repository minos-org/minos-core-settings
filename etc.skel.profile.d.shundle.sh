#This file is part of the minos-core-settings package

#http://github.com/chilicuil/shundle

if [ -f ~/.shundle/bundle/shundle/shundle ]; then
    .  ~/.shundle/bundle/shundle/shundle
    Bundle='chilicuil/shundle'
        #SHUNDLE_ENV_VERBOSE="0"
        #SHUNDLE_ENV_DEBUG="0"
        SHUNDLE_ENV_COLOR="1"
    #Bundle='chilicuil/shundle-plugins/todo-rememberator'
        #REMEMBERATOR_EVERY="5"
    Bundle="gh:chilicuil/shundle-plugins/eternalize"
        ETERNALIZE_PATH="${HOME}/.eternalize-data"
    Bundle="github:chilicuil/shundle-plugins/colorize"
        COLORIZE_THEME="default-dark"
        COLORIZE_PS="yujie"
        COLORIZE_UTILS="sky"
    Bundle="chilicuil/shundle-plugins/aliazator.git"
        #ALIAZATOR_PLUGINS="none"
        #ALIAZATOR_PLUGINS="minimal"
        ALIAZATOR_PLUGINS="installed"
        #ALIAZATOR_PLUGINS="all"
        #ALIAZATOR_PLUGINS="custom:minimal,git,apt-get,vagrant,vim"
        #ALIAZATOR_CLOUD="url"
    Bundle="gh:chilicuil/shundle-plugins/autocd"
        #AUTOCD_FILE="/tmp/autocd.59YlpZ50"

   #from non GitHub
   #Bundle='git://git.domain.com/rep.git'

   #from the web
   #Bundle='http://domain.com/awesome-script'

   #from the file system
   #Bundle='file://path/to/script'
else
    alias shundle-install='git clone --depth=1 \
    https://github.com/chilicuil/shundle ~/.shundle/bundle/shundle && \
    . ~/.bashrc && ~/.shundle/bundle/shundle/bin/shundle install   && \
    bash'
fi
