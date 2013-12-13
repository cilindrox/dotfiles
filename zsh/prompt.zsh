# pimp my prompt
autoload -Uz promptinit && promptinit # use the included prompt functionality
autoload -Uz colors && colors         # create a colors associative array

# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  [[ -n $ref ]] && echo "[%{$fg_bold[blue]%}${ref#refs/heads/}%{$reset_color%}]"
}

# right-hand prompt with exit status error and git info
RPS1='%B%F{red}%(?..(%?%))%b%f'\
'$(git_prompt_info)'

# adam3 prompt theme

prompt_adam1_help () {
  cat <<'EOF'
This prompt is color-scheme-able.  You can invoke it thus:

  prompt adam1 [<color1> [<color2> [<color3>]]]

where the colors are for the user@host background, current working
directory, and current working directory if the prompt is split over
two lines respectively.  The default colors are blue, cyan and green.
This theme works best with a dark background.

Recommended fonts for this theme: nexus or vga or similar.  If you
don't have any of these, then specify the `plain' option to use 7-bit
replacements for the 8-bit characters.

And you probably thought adam1 was overkill.
EOF
}

prompt_adam3_setup () {
  prompt_adam1_color1=${1:-'blue'}
  prompt_adam1_color2=${2:-'cyan'}
  prompt_adam1_color3=${3:-'green'}

  base_prompt="%F{yellow}%B%m%f%b "
  post_prompt="%b%f%k"

  base_prompt_no_color=$(echo "$base_prompt" | perl -pe "s/%(K{.*?}|k)//g")
  post_prompt_no_color=$(echo "$post_prompt" | perl -pe "s/%(K{.*?}|k)//g")

  add-zsh-hook precmd prompt_adam1_precmd
}

prompt_adam1_precmd () {
  setopt noxtrace localoptions
  local base_prompt_expanded_no_color base_prompt_etc
  local prompt_length space_left

  base_prompt_expanded_no_color=$(print -P "$base_prompt_no_color")
  base_prompt_etc=$(print -P "$base_prompt%(4~|...|)%3~")
  prompt_length=${#base_prompt_etc}
  if [[ $prompt_length -lt 40 ]]; then
    path_prompt="%B%F{$prompt_adam1_color2}%(4~|...|)%3~%F{white}"
  else
    space_left=$(( $COLUMNS - $#base_prompt_expanded_no_color - 2 ))
    path_prompt="%B%F{$prompt_adam1_color3}%${space_left}<...<%~$prompt_newline%F{white}"
  fi
  PS1="$base_prompt$path_prompt %# $post_prompt"
  PS2="$base_prompt$path_prompt %_> $post_prompt"
  PS3="$base_prompt$path_prompt ?# $post_prompt"
}

prompt_adam3_setup "$@"

# EOF
