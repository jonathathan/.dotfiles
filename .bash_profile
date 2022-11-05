export ENV_NAME=
export CODE_DIR=~/code/

function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[36m\]\w"
    local __git_branch_color="\[\033[36m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$ "
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__git_branch_color$__git_branch$__cur_location\$$__last_color "
}
color_my_prompt

alias vi='vim'
alias bashp='vi ~/.bash_profile && source ~/.bash_profile'
alias ff='find . | grep'
alias gb='git branch -v --sort=-committerdate'
alias gc='git checkout'
alias gss='git status'
alias gs='git -c color.ui=always status'
alias gcp='git cherry-pick'
alias gr='git rebase'
alias grc='git rebase --continue'
alias la='ls -lhaG --color=auto'
alias ll='ls -lhG --color=auto'
alias lu='ls -U1'
alias p2='/usr/bin/python2.7'
alias p='python'
alias password='cat /dev/random | head -c18 | base64'
alias dkill='docker kill $(docker ps | tail -n+2 | cut -d" " -f1)'
alias ssp='sed "s/  */ /g"'
alias tma='tmux -CC a -t'
alias tml='tmux ls'
alias tms='tmux switch -t'
alias scj='scontrol show job'
alias sact='sacct -o "jobname%-44,jobid%20,partition%10,AllocCPUS%3,Elapsed%9,State"'
alias sactl='sacct -o "jobname%-100,jobid%20,partition%10,AllocCPUS%3,Elapsed%9,State"'
alias seds='grep -v grep | sed "s/  */ /g"'
alias sedskill='grep -v grep | sed "s/  */ /g" | cut -d" " -f2 | xargs kill'
alias sedscancel='grep -v grep | grep -e RUNNING -e PENDING | sed "s/  */ /g" | cut -d" " -f2 | xargs scancel'
alias agg='ag --ignore-dir thirdparty --ignore-dir viz/web/build --ignore-dir node_modules'
alias nvps="nvidia-smi -q -d PIDS | grep 'Process ID' | grep -o '[0-9]*$'"
alias nvpsk="nvidia-smi -q -d PIDS | grep 'Process ID' | grep -o '[0-9]*$' | xargs kill"
alias less='less -R'
alias lesss='less -SR'
alias pytest='pytest --disable-pytest-warnings'
alias grepc='grep --color=always'
alias volta='srun --gpus=1 --nodes 1 --ntasks-per-node 1 --cpus-per-task 10 --mem 58G --constraint volta32gb --time 120 --partition devaccel --exclude learnfair7620 --pty bash'

function btwn {
    tail -n +"$1" | head -n "$(($2 - $1 + 1))"
}


function jpd {
    cd $CODE_DIR
    if [[ $(basename "$CONDA_PREFIX") != $ENV_NAME ]]
    then
        if [[ $CONDA_PREFIX != "" ]]
        then
            conda deactivate
        fi
        conda activate $ENV_NAME
    fi
}

set -o vi
export EDITOR=vim
export GLOG_logtostderr=1
