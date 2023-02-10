#  path/  ⎇  main ✘  ls

PROMPT='%{$bg[yellow]%} %c/'
PROMPT=$PROMPT' %{$fg[yellow]%}%{$bg[green]%}'

PROMPT=$PROMPT'%{$fg[white]%}$(git_prompt_info)'
PROMPT=$PROMPT'%{$reset_color%}%{$fg[green]%}'

PROMPT=$PROMPT'%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=' ⎇  '
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓ "
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘ "
