#This file is part of the minos-core-settings package

#http://github.com/javier-lopez/shundle

if [ -f ~/.shundle/bundle/shundle/shundle ]; then
    .  ~/.shundle/bundle/shundle/shundle
    Bundle='javier-lopez/shundle'
        #SHUNDLE_ENV_VERBOSE="0"
        #SHUNDLE_ENV_DEBUG="0"
        SHUNDLE_ENV_COLOR="1"
    Bundle="gh:javier-lopez/shundle-plugins/eternalize"
        PostInstall='wget -qO- \
            https://github.com/junegunn/fzf/releases/download/v0.74.4/fzf-0.74.4-linux_amd64.tar.gz | \
            tar xz -C ~/.local/bin fzf && chmod +x ~/.local/bin/fzf'
        ETERNALIZE_PATH="${HOME}/.eternalize-data"
        ETERNALIZE_IGNORE="cd,cd *,ls,ls *,pwd,exit,clear,history,history *"
        ETERNALIZE_BIND='"\C-r"' #control-r gets overrided for history search
    Bundle="javier-lopez/shundle-plugins/aliazator.git"
        #ALIAZATOR_PLUGINS="none"
        #ALIAZATOR_PLUGINS="minimal"
        ALIAZATOR_PLUGINS="installed"
        ALIAZATOR_OVERRIDE="cd gs size install"
        #ALIAZATOR_PLUGINS="all"
        #ALIAZATOR_PLUGINS="custom:minimal,git,apt-get,vagrant,vim"
    Bundle="github:javier-lopez/shundle-plugins/colorize"
        COLORIZE_THEME="default-dark"
        COLORIZE_PS="yujie"
        COLORIZE_UTILS="sky"
        COLORIZE_GITPROMPT="branch" #'dirty' marks changes, at one git per prompt
        #COLORIZE_ELAPSED_MIN="60"  #how many seconds a command must take to be timed
    Bundle="gh:javier-lopez/shundle-plugins/autocd"
        #AUTOCD_FILE="/tmp/autocd.59YlpZ50"
    Bundle="gh:javier-lopez/shundle-plugins/runner"
        #RUNNER_NAME="r"
        #RUNNER_FILES="scripts/run.sh run.sh justfile Makefile package.json"
    #Bundle='javier-lopez/shundle-plugins/todo-rememberator'
        #REMEMBERATOR_EVERY="5"

    Bundle="gh:javier-lopez/learn"  #repository of commands
        PostInstall='sh/tools/wcd --update && sh/tools/wcd --cron'
                    #wcd --no-cron #after rm ~/.shundle/bundle/learn

        #SHUNDLE_BIN="${HOME}/.bin" #where Expose links their commands
        Expose="sh/tools"
        Expose="perl: diff-so-fancy gcal keepn rmdup sentry"
        Expose="python/tools: mailgun simple-*"
        #export WCD_LS_MAX="80"

        command -v fuck >/dev/null 2>&1 && eval "$(fuck --hook bash)"
    Bundle="gh:javier-lopez/cmdfound" #runs what isn't installed, fuck hands it the missing commands
        Expose="cmdfound"
else
    alias shundle-install='git clone --depth=1 \
    https://github.com/javier-lopez/shundle ~/.shundle/bundle/shundle && \
    . ~/.bashrc && ~/.shundle/bundle/shundle/bin/shundle install   && \
    bash'
fi

[ -f ~/.credentials ] && . ~/.credentials
