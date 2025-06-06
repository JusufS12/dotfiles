# Track first prompt
if [[ -z ${ZSH_FIRST_PROMPT_SHOWN+x} ]]; then
  ZSH_FIRST_PROMPT_SHOWN=0
fi

# Track last command
LAST_COMMAND=""

# Hook that runs BEFORE a command is executed
preexec() {
  LAST_COMMAND="$1"
}

# Hook that runs BEFORE prompt is shown
precmd() {
  # Skip newline on first prompt
  if (( ZSH_FIRST_PROMPT_SHOWN == 0 )); then
    (( ZSH_FIRST_PROMPT_SHOWN++ ))
    return
  fi

  # Skip newline if last command was 'clear' or Ctrl+L (terminal usually sends `clear`)
  case "$LAST_COMMAND" in
    clear|clear\ *|tput\ reset|reset)
      # do nothing
      ;;
    *)
      echo
      ;;
  esac

  (( ZSH_FIRST_PROMPT_SHOWN++ ))
}

