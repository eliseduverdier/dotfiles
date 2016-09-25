#########################################
#                                       #
#   .bash_aliases                       #
#                                       #
#########################################

### Aliases
# print to fit
alias ifit='lpr -o fit-to-page'

#   nav
# ...
#   ftp/ssh connections
# ...

mdview() {
  markdown "$1" | lynx -stdin
}

# enable color support 
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias less='less -r'
    alias ls='ls --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi
