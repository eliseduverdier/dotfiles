#########################################################
#                  ~/.bashrc                            #
#########################################################
#     see also                                          #
#           .aliases        (alias)                     #
#           .aliases_common (alias for all users)       #
#########################################################

# get the list of aliases
source ~/.aliases
source ~/.aliases_perso

# prompt
git_branch(){   #  get current git branch
    branch=$(git branch 2>/dev/null |grep '^*' |cut -f2 -d' ')
    isGit=$(echo $branch |wc -c)
    [[ $isGit -gt 1 ]] && echo "⎇  $branch $(git_dirty)"
}
git_dirty(){   # get git state
    dirty=$(git diff --shortstat 2> /dev/null | tail -n1)
    [[ $dirty != "" ]] && echo "🞴 "
}

if [[ $- == *i* ]]; then   # if interactive mode
    initcolor=$(tput sgr 0 0)
    color=$(tput setab 2)$(tput setaf 7)
    color_git=$(tput setaf 3)  
    color_gitdirty=$(tput setaf 1)  
    color_end=$(tput setaf 2)$(tput setab 9)
    reset=$(tput sgr0)

    PS1='\[$initColor\]\[$color\]❱ \W \[$reset\]$(git_branch)❱ '
else
    PS1='(\u:\h) \W ↝  '
fi

export PATH=$PATH:~/.composer/vendor/bin

if [[ $- == *i* ]]; then   # if interactive mode
    bind 'TAB:menu-complete'
    bind 'set completion-ignore-case on'
    bind 'set show-all-if-ambiguous on'
fi
