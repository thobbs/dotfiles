# ~/.bash_aliases: imported by .bashrc for non-login shells.

alias ls='ls --color=auto --hide="*.pyc" --width=120'
alias gr='grep -I --color=auto --exclude="*svn*" --exclude="all-wcprops" --exclude="entries" --exclude="*.pyc" --exclude="*.po" -R -n -C 2'
alias untar='tar -xzf'
alias redshift='nohup redshift -l 30.267153:-97.7430608 -t 6500:4000 &'
alias pp='python -mjson.tool'

alias rmcass='sudo rm -rf /var/lib/cassandra/* && sudo rm -rf /var/log/cassandra/*'

alias curlpj='curl -X POST -H "Content-Type: application/json" -d '

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset' --abbrev-commit"

alias gstat="git status"
alias dc="docker-compose"
alias vimr="nvim -R -"
alias lr="set -a && . /home/thobbs/travelboss/devopsboss/.env && lein repl"
alias lrmock="set -a && . /home/thobbs/travelboss/devopsboss/.env && export GDS_PROVIDER=mock && lein repl"
alias lein-env="set -a && . /home/thobbs/travelboss/devopsboss/.env && lein"
alias tok="cat /home/thobbs/travelboss/devopsboss/.token | xclip -sel clip"
