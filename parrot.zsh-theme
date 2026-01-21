# ZSH Theme - Looks like Parrot OS's default bash theme, inspired from Bira

# User / root prompt symbol
if [[ $UID -eq 0 ]]; then
    local user_symbol='%{$fg_bold[red]%}#%{$reset_color%}'
else
    local user_symbol='%{$fg_bold[yellow]%}$%{$reset_color%}'
fi

# return code & error symbol (only on failure)
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local error_symbol="%(?::[%{$fg[white]%}✗%{$fg[red]%}]─)"

local user_host="%{$fg[green]%}%n%{$fg_bold[yellow]%}@%{$fg_bold[cyan]%}%m%{$reset_color%}"
local current_dir="%{$fg[green]%}%~%{$reset_color%}"

# Oh-My-Zsh helpers
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

# Prompt layout
PROMPT="%{$fg[red]%}┌──${error_symbol}[${user_host}%{$fg[red]%}]─[${current_dir}%{$fg[red]%}]%{$reset_color%}${rvm_ruby}${git_branch}
%{$fg[red]%}└──╼%{$reset_color%} ${venv_prompt} ${user_symbol} "
RPROMPT="${return_code}"

# Git / Ruby / Virtualenv formatting
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} ‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}●%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[cyan]%} ("
ZSH_THEME_RUBY_PROMPT_SUFFIX=")%{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[yellow]%} ("
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"