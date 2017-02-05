(($+commands[fzf])) || (($+commands[fzf-tmux])) || return 0

if (($+commands[pt])); then
  export FZF_DEFAULT_COMMAND='pt --hidden --ignore .git -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  function _fzf_compgen_path() {
    eval $FZF_DEFAULT_COMMAND "$1"
  }
fi

export FZF_DEFAULT_OPTS='--height 80%
  --bind ctrl-j:preview-down,ctrl-k:preview-up
  --bind ctrl-h:preview-page-down,ctrl-l:preview-page-up
  --bind ctrl-p:toggle-preview
  --toggle-sort=\`
  --header "`: sort, Ctrl+P: preview, Ctrl+J,K,H,L: scroll preview"'

export FZF_CTRL_R_OPTS='--exact'

if (($+commands[tree])); then
  export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
  export FZF_CTRL_T_OPTS="--preview '(cat {} || tree -C {}) 2> /dev/null'"
fi

[[ -f ~/.fzf.zsh ]] || return 0
source ~/.fzf.zsh
