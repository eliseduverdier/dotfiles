#########################################################
#                  ~/.bashrc                            #
#########################################################
#     see also                                          #
#           .bash_aliases        (alias)                #
#           .bash_aliases_common (alias for all users)  #
#           .bash_profile        (start up session)     #
#########################################################

# get the list of aliases
source ~/.bash_aliases_common
source ~/.bash_aliases

# prompt
git_branch(){   #  get current git branch
    echo $green"$(git branch 2>/dev/null |grep '^*' |cut -f2 -d' ')"$color
}

if [[ $- == *i* ]]; then                                                                                                
    color=$(tput sgr 0 1)$(tput setaf 3)
    green=$(tput setaf 4)
    cyan=$(tput setaf 6)
    reset=$(tput sgr0)

    PS1='\[$color\] \W $(git_branch)↝ \[$reset\] '
else
    PS1='(\u:\h) \W ↝  '
fi

