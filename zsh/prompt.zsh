# pimp my prompt
autoload -Uz promptinit && promptinit # use the included prompt functionality
autoload -Uz colors && colors         # create a colors associative array

# prompt adam1

# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  [[ -n $ref ]] && echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
}

# a slight variation of the pws theme
PS1='%K{black}%F{white}%B%(2L.+.)%(1j.[%j].)'\
'%F{yellow}%m '\
'%f%k%b%# '

# right-hand prompt with exit status error, ssh and git info
RPS1='%B%F{red}%(?..(%?%))%b%f'\
'$(git_prompt_info)'\
'[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '

# EOF
